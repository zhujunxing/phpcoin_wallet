import 'dart:convert';
import 'dart:convert' as ConvertPack;
import 'dart:math';
import 'dart:typed_data';

import 'package:basic_utils/basic_utils.dart';
import 'package:convert/convert.dart';
import 'package:crypto/crypto.dart' as CryptoPack;
import 'package:crypto/crypto.dart';
import 'package:encrypt/encrypt.dart';
import 'package:encrypt/encrypt.dart' as EncryptPack;
import 'package:fast_base58/fast_base58.dart';
import 'package:hash/hash.dart';
import 'package:pointycastle/asn1/object_identifiers.dart';
import 'package:pointycastle/ecc/ecc_fp.dart' as ecc_fp;
import 'package:pointycastle/pointycastle.dart';
import 'package:pointycastle/src/utils.dart' as utils;
import 'package:crypto/crypto.dart' as Crypto;

class CryptoUtilsEx extends CryptoUtils {

  static const BEGIN_EC_PRIVATE_KEY = '-----BEGIN EC PRIVATE KEY-----';
  static const END_EC_PRIVATE_KEY = '-----END EC PRIVATE KEY-----';

  static const BEGIN_EC_PUBLIC_KEY = '-----BEGIN PUBLIC KEY-----';
  static const END_EC_PUBLIC_KEY = '-----END PUBLIC KEY-----';

  static String encodeEcPrivateKeyToPem(ECPrivateKey ecPrivateKey) {
    var outer = ASN1Sequence();

    BigInt d = ecPrivateKey.d!;

    var version = ASN1Integer(BigInt.from(1));

    var privateKeyAsBytes = _getPrivateKeyBytes(d);

    var privateKey = ASN1OctetString(octets: privateKeyAsBytes);
    var choice = ASN1Sequence(tag: 0xA0);

    choice.add(
        ASN1ObjectIdentifier.fromName(ecPrivateKey.parameters!.domainName));

    ECPoint G = ecPrivateKey.parameters!.G;
    ECPoint? Q = G * d;
    ECPointEx? QE = ECPointEx(Q);

    var publicKey = ASN1Sequence(tag: 0xA1);

    var subjectPublicKey = ASN1BitStringEx(
        stringValues: QE.getEncoded(false));
    publicKey.add(subjectPublicKey);

    outer.add(version);
    outer.add(privateKey);
    outer.add(choice);
    outer.add(publicKey);
    var dataBase64 = base64.encode(outer.encode());
    var chunks = StringUtils.chunk(dataBase64, 64);

    return '$BEGIN_EC_PRIVATE_KEY\n${chunks.join('\n')}\n$END_EC_PRIVATE_KEY';
  }

  static Uint8List _getPrivateKeyBytes(BigInt d) {
    String dhex = d.toRadixString(16);
    while( dhex.length < 2 * 32) {
      dhex = "0" + dhex;
    }
    List<int> decoded = hex.decode(dhex);
    return Uint8List.fromList(decoded);
  }

  static String encodeEcPublicKeyToPem(ECPublicKey publicKey) {
    var outer = ASN1Sequence();
    var algorithm = ASN1Sequence();
    algorithm.add(ASN1ObjectIdentifier.fromName('ecPublicKey'));
    algorithm.add(ASN1ObjectIdentifier.fromName('secp256k1'));
    var encodedBytes = publicKey.Q!.getEncoded(false);

    var subjectPublicKey = ASN1BitString(stringValues: encodedBytes);

    outer.add(algorithm);
    outer.add(subjectPublicKey);
    var dataBase64 = base64.encode(outer.encode());
    var chunks = StringUtils.chunk(dataBase64, 64);

    return '$BEGIN_EC_PUBLIC_KEY\n${chunks.join('\n')}\n$END_EC_PUBLIC_KEY';
  }

  static ECPrivateKey ecPrivateKeyFromPem(String pem) {
    if (pem.isEmpty) {
      throw ArgumentError('Argument must not be null.');
    }
    var bytes = CryptoUtils.getBytesFromPEMString(pem);
    return ecPrivateKeyFromDerBytes(
      bytes,
      pkcs8: pem.startsWith(BEGIN_EC_PRIVATE_KEY),
    );
  }

  static ECPrivateKey ecPrivateKeyFromDerBytes(Uint8List bytes,
      {bool pkcs8 = false}) {
    var asn1Parser = ASN1Parser(bytes);
    var topLevelSeq = asn1Parser.nextObject() as ASN1Sequence;
    var curveName;
    var x;
      var privateKeyAsOctetString =
      topLevelSeq.elements!.elementAt(1) as ASN1OctetString;

      var choice = topLevelSeq.elements!.elementAt(2);
      var s = ASN1Sequence();
      var parser = ASN1Parser(choice.valueBytes);
      while (parser.hasNext()) {
        s.add(parser.nextObject());
      }
      var curveNameOi = s.elements!.elementAt(0) as ASN1ObjectIdentifier;
      var data = ObjectIdentifiers.getIdentifierByIdentifier(
          curveNameOi.objectIdentifierAsString);
      if (data != null) {
        curveName = data['readableName'];
      }
      x = privateKeyAsOctetString.valueBytes!;
      var decoded = List<int>.from(x);
      var dhex = hex.encode(decoded);
      BigInt d = BigInt.parse(dhex,radix: 16);
      return ECPrivateKey(d, ECDomainParameters(curveName));
  }


  static String encrypt(String password, String input) {
    String key = CryptoPack.sha256.convert(ConvertPack.utf8.encode(password)).toString().substring(0, 32);
    EncryptPack.Key keyObj = EncryptPack.Key.fromUtf8(key);
    final encrypter = EncryptPack.Encrypter(EncryptPack.AES(keyObj, mode: EncryptPack.AESMode.cbc));
    var random = Random.secure();
    var values = List<int>.generate(16, (i) =>  random.nextInt(255));
    String iv = hex.encode(values).substring(0, 16);
    EncryptPack.IV ivObj = EncryptPack.IV.fromUtf8(iv);
    Encrypted enctypted = encrypter.encrypt(input, iv: ivObj);
    String enc = base64.encode(enctypted.bytes);
    String enc2 = iv + enc;
    return base64.encode(enc2.codeUnits);
  }

  static String decrypt(String password, String input) {
    String enc2 = String.fromCharCodes(base64.decode(input));
    String iv = enc2.substring(0, 16);
    String enc = enc2.substring(16);
    String key = CryptoPack.sha256.convert(ConvertPack.utf8.encode(password)).toString().substring(0, 32);
    EncryptPack.Key keyObj = EncryptPack.Key.fromUtf8(key);
    final encrypter = EncryptPack.Encrypter(EncryptPack.AES(keyObj, mode: EncryptPack.AESMode.cbc));
    EncryptPack.IV ivObj2 = EncryptPack.IV.fromUtf8(iv);
    String decrypted = encrypter.decrypt(EncryptPack.Encrypted.fromBase64(enc), iv: ivObj2);
    return decrypted;
  }

  static String pem2Coin(String pem) {
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

  static String coin2Pem(String coin, {bool private = true}) {
    List<int> d = Base58Decode(coin);
    String s = base64.encode(d);
    List<String> chunks = StringUtils.chunk(s, 64);
    if(private) {
      chunks.insert(0, "-----BEGIN EC PRIVATE KEY-----");
      chunks.insert(chunks.length, "-----END EC PRIVATE KEY-----");
    }
    return chunks.join("\n");
  }

  static String getAddress(String publicKey) {
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



}

class ASN1BitStringEx extends  ASN1BitString {

  List<int>? stringValues;
  List<ASN1Object>? elements;

  ASN1BitStringEx(
      {this.stringValues, this.elements, int tag = ASN1Tags.BIT_STRING})
      : super(tag: tag);

  ///
  /// Encodes this ASN1Object depending on the given [encodingRule]
  ///
  /// If no [ASN1EncodingRule] is given, ENCODING_DER will be used.
  ///
  /// Supported encoding rules are :
  /// * [ASN1EncodingRule.ENCODING_DER]
  /// * [ASN1EncodingRule.ENCODING_BER_LONG_LENGTH_FORM]
  /// * [ASN1EncodingRule.ENCODING_BER_CONSTRUCTED]
  /// * [ASN1EncodingRule.ENCODING_BER_CONSTRUCTED_INDEFINITE_LENGTH]
  /// * [ASN1EncodingRule.ENCODING_BER_PADDED]
  ///
  /// Throws an [UnsupportedAsn1EncodingRuleException] if the given [encodingRule] is not supported.
  ///
  @override
  Uint8List encode(
      {ASN1EncodingRule encodingRule = ASN1EncodingRule.ENCODING_DER}) {
    switch (encodingRule) {
      case ASN1EncodingRule.ENCODING_BER_PADDED:
      case ASN1EncodingRule.ENCODING_DER:
      case ASN1EncodingRule.ENCODING_BER_LONG_LENGTH_FORM:
        var b = <int>[];
        b.addAll(stringValues!);
        valueBytes = Uint8List.fromList(b);
        break;
      case ASN1EncodingRule.ENCODING_BER_CONSTRUCTED_INDEFINITE_LENGTH:
      case ASN1EncodingRule.ENCODING_BER_CONSTRUCTED:
        valueByteLength = 0;
        if (elements == null) {
          elements = <ASN1Object>[];
          elements!.add(ASN1BitString(stringValues: stringValues));
        }
        valueByteLength = _childLength(
            isIndefinite: encodingRule ==
                ASN1EncodingRule.ENCODING_BER_CONSTRUCTED_INDEFINITE_LENGTH);
        valueBytes = Uint8List(valueByteLength!);
        var i = 0;
        elements!.forEach((obj) {
          var b = obj.encode();
          valueBytes!.setRange(i, i + b.length, b);
          i += b.length;
        });
        break;
    }

    return super.encode(encodingRule: encodingRule);
  }

  ///
  /// Calculate encoded length of all children
  ///
  int _childLength({bool isIndefinite = false}) {
    var l = 0;
    elements!.forEach((ASN1Object obj) {
      l += obj.encode().length;
    });
    if (isIndefinite) {
      return l + 2;
    }
    return l;
  }
}


class ECPointEx extends ecc_fp.ECPoint {
  ECPointEx(ECPoint? ecPoint) : super(ecPoint?.curve as ecc_fp.ECCurve, ecPoint?.x as ecc_fp.ECFieldElement, ecPoint?.y as ecc_fp.ECFieldElement);

  bool _testBit(BigInt i, int n) {
    return i & (BigInt.one << n) != BigInt.zero;
  }

  Uint8List _x9IntegerToBytes(BigInt? s, int qLength) {
    var bytes = Uint8List.fromList(utils.encodeBigInt(s));

    if (qLength < bytes.length) {
      return bytes.sublist(bytes.length - qLength);
    } else if (qLength > bytes.length) {
      return Uint8List(qLength)..setAll(qLength - bytes.length, bytes);
    }

    return bytes;
  }


  @override
  Uint8List getEncoded([bool compressed = true]) {
    if (isInfinity) {
      return Uint8List.fromList([1]);
    }

    var qLength = x!.byteLength;
    if (compressed) {
      int pc;

      if (_testBit(y!.toBigInteger()!, 0)) {
        pc = 0x03;
      } else {
        pc = 0x02;
      }

      var X = _x9IntegerToBytes(x!.toBigInteger(), qLength);
      var po = Uint8List(X.length + 1);

      po[0] = pc.toInt();
      po.setAll(1, X);

      return po;
    } else {
      var X = _x9IntegerToBytes(x!.toBigInteger(), qLength);
      var Y = _x9IntegerToBytes(y!.toBigInteger(), qLength);
      var po = Uint8List(X.length + Y.length + 2);

      po[0] = 0x00;
      po[1] = 0x04;
      po.setAll(2, X);
      po.setAll(X.length + 2, Y);

      return po;
    }
  }
}