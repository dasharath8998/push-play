import 'dart:math';

import 'package:encrypt/encrypt.dart';
import 'package:pushplay/data/local/manager_preference.dart';

/// data enc / dec algos and AES match used in login
class EncryptData {
//for AES Algorithms
  static Encrypted? encrypted;
  static var decrypted;

  static String encryptAES(plainText, givenKey, givenIv) {
    // final key = Key.fromUtf8('my 32 length key................');
    final key = Key.fromBase64(givenKey);
    // final iv = IV.fromLength(16);
    final iv = IV.fromBase64(givenIv);
    final encrypter = Encrypter(AES(key));
    encrypted = encrypter.encrypt(
      plainText,
      iv: iv,
    );

    return encrypted!.base64;
  }

  static Future<String> decryptAES(givenKey, givenIv) async {
    final key = Key.fromBase64(givenKey);
    final iv = IV.fromBase64(givenIv);
    final encrypter = Encrypter(AES(key));
    if (encrypted == null) {
      String passwordBase64 =
          PreferenceManager.getString(PrefConst.passwordBase64);
      encrypted = Encrypted(Encrypted.fromBase64(passwordBase64).bytes);
    }
    decrypted = encrypter.decrypt(encrypted!, iv: iv);
    return decrypted;
  }

  static String getRandomString(int length) {
    const characters = '+-AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz';
    Random random = Random();
    return String.fromCharCodes(Iterable.generate(length,
        (_) => characters.codeUnitAt(random.nextInt(characters.length))));
  }
}
