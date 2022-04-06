import 'dart:convert';
import 'dart:typed_data';

import 'package:basic_utils/basic_utils.dart';
import 'package:crypto/crypto.dart';
import 'package:fast_base58/fast_base58.dart';
import 'package:hash/hash.dart';
import 'package:pointycastle/api.dart';
import 'package:pointycastle/src/utils.dart';
import 'package:convert/convert.dart';
import 'package:crypto/crypto.dart' as Crypto;
import 'crypt_utils_ex.dart';


main() {
  AsymmetricKeyPair asymmetricKeyPair = CryptoUtils.generateEcKeyPair(curve: 'secp256k1');
  ECPrivateKey ecPrivateKey = asymmetricKeyPair.privateKey as ECPrivateKey;
  String ecPrivateKeyPem = CryptoUtilsEx.encodeEcPrivateKeyToPem(ecPrivateKey);
  print("ecPrivateKeyPem:\n" + ecPrivateKeyPem);

  ECPublicKey ecPublicKey = asymmetricKeyPair.publicKey as ECPublicKey;
  String ecPublicKeyPem = CryptoUtilsEx.encodeEcPublicKeyToPem(ecPublicKey);
  print("ecPublicKeyPem:\n" + ecPublicKeyPem);
  //
  String privateKey = pem2Coin(ecPrivateKeyPem);
  print("privateKey: " + privateKey);
  //
  String publicKey = pem2Coin(ecPublicKeyPem);
  print("publicKey: " + publicKey);
  //
  String address = getAddress(publicKey);
  print("address: " + address);


  //TODO coin2Pem -> pem -> key
  String ecPrivateKeyPem2 = coin2Pem(privateKey);
  print("ecPrivateKeyPem:\n" + ecPrivateKeyPem2);
  ECPrivateKey ecPrivateKey2 = CryptoUtilsEx.ecPrivateKeyFromPem(ecPrivateKeyPem2);
  print(CryptoUtilsEx.encodeEcPrivateKeyToPem(ecPrivateKey2));

  //TODO: sign && verify
  String data = "TEST";
  String signature = sign(privateKey, data);
  print("signature: " + signature);

  bool ver = verify(publicKey, data, signature);
  print("ver: " + ver.toString());

  //TODO: encrypt and decrypt
  String password = "password";
  String input = "input";
  print("input: " + input);
  print("password: " + password);
  String encrypted = CryptoUtilsEx.encrypt(password, input);
  print("encrypted: " + encrypted);

  String decrypted = CryptoUtilsEx.decrypt(password, encrypted);
  print("decrypted: " + decrypted);
}

String pem2Coin(String pem) {
  String s = pem.replaceAll("-----BEGIN PUBLIC KEY-----", "");
  s = s.replaceAll("-----END PUBLIC KEY-----", "");
  s = s.replaceAll("-----BEGIN EC PRIVATE KEY-----", "");
  s = s.replaceAll("-----END EC PRIVATE KEY-----", "");
  s = s.replaceAll("-----BEGIN EC PUBLIC KEY-----", "");
  s = s.replaceAll("-----END EC PUBLIC KEY-----", "");
  s = s.replaceAll("\n", "");
  Uint8List d = base64.decode(s);
  String se = Base58Encode(d);
  return se;
}

String coin2Pem(String key, {private = true}) {
  List<int> base58 = Base58Decode(key);
  String keyBase64 = base64.encode(base58);
  List<String> chunks = StringUtils.chunk(keyBase64, 64);
  String body = chunks.join("\n");
  String pem = private ? "-----BEGIN EC PRIVATE KEY-----\n" : "-----BEGIN PUBLIC KEY-----\n";
  pem += body;
  pem += private ? "\n-----END EC PRIVATE KEY-----\n" : "\n-----END PUBLIC KEY-----\n";
  return pem;
}

String getAddress(String publicKey) {
  var bytes = utf8.encode(publicKey);
  Crypto.Digest hash1 = sha256.convert(bytes);
  Uint8List hash2 = RIPEMD160().update(hex.encode(hash1.bytes).codeUnits).digest();
  String baseAddress = "38" + hex.encode(hash2);
  Crypto.Digest checksumCalc1 = sha256.convert(utf8.encode(baseAddress));
  Crypto.Digest checksumCalc2 = sha256.convert(hex.encode(checksumCalc1.bytes).codeUnits);
  Crypto.Digest checksumCalc3 = sha256.convert(hex.encode(checksumCalc2.bytes).codeUnits);
  String checksum = checksumCalc3.toString().substring(0, 8);
  String addressHex = baseAddress + checksum;
  String address = Base58Encode(hex.decode(addressHex));
  return address;
}

String signatureToBase64(ECSignature ecSignature ) {
  var sequence = ASN1Sequence();
  sequence.add(ASN1Integer(ecSignature.r));
  sequence.add(ASN1Integer(ecSignature.s));
  var dataBase64 = base64.encode(sequence.encode());
  return dataBase64;
}

String sign(String privateKey, String data) {
  String ecPrivateKeyPem = coin2Pem(privateKey);
  ECPrivateKey ecPrivateKey = CryptoUtilsEx.ecPrivateKeyFromPem(ecPrivateKeyPem);
  ECSignature ecSignature = CryptoUtils.ecSign(ecPrivateKey, Uint8List.fromList(data.codeUnits), algorithmName: 'SHA-256/ECDSA');
  var sequence = ASN1Sequence();
  sequence.add(ASN1Integer(ecSignature.r));
  sequence.add(ASN1Integer(ecSignature.s));
  return Base58Encode(sequence.encode());
}

bool verify(String publicKey, String data, String signature) {
  String ecPublicKeyPem = coin2Pem(publicKey, private: false);
  ECPublicKey ecPublicKey = CryptoUtils.ecPublicKeyFromPem(ecPublicKeyPem);
  ECSignature ecSignature = signatureFromString(signature);
  bool res = CryptoUtils.ecVerify(ecPublicKey, Uint8List.fromList(data.codeUnits), ecSignature, algorithm: 'SHA-256/ECDSA');
  return res;
}

ECSignature signatureFromString(String signature) {
  List<int> decoded = Base58Decode(signature);
  var bytes = Uint8List.fromList(decoded);
  var asn1Parser = ASN1Parser(bytes);
  var topLevelSeq = asn1Parser.nextObject() as ASN1Sequence;
  ASN1Integer asn1integerR = topLevelSeq.elements![0] as ASN1Integer;
  var rBytes = asn1integerR.valueBytes;
  BigInt r = decodeBigInt(rBytes!);
  ASN1Integer asn1integerS = topLevelSeq.elements![1] as ASN1Integer;
  var sBytes = asn1integerS.valueBytes;
  BigInt s = decodeBigInt(sBytes!);
  ECSignature ecSignature = ECSignature(r, s);
  return ecSignature;
}



String private2publicKey(String privateKey) {
  String privateKeyPem = CryptoUtilsEx.coin2Pem(privateKey);
  ECPrivateKey ecPrivateKey = CryptoUtilsEx.ecPrivateKeyFromPem(privateKeyPem);
  ECDomainParameters? params = ecPrivateKey.parameters;
  BigInt? d = ecPrivateKey.d;

  var Q = params!.G * d;
  ECPublicKey ecPublicKey = ECPublicKey(Q, params);

  String ecPublicKeyPem = CryptoUtilsEx.encodeEcPublicKeyToPem(ecPublicKey);
  return CryptoUtilsEx.pem2Coin(ecPublicKeyPem);
}
