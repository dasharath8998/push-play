import 'package:pushplay/utils/strings.dart';

/// Validations
class ValidationUtils {
  // Validation of Email Field
  static String? validateEmail(String? value) {
    RegExp? regex = RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');

    if ((value ?? '').trim().isEmpty) {
      return Strings.emailRequired;
    } else if (!regex.hasMatch((value ?? '').trim())) {
      return Strings.emailValidRequired;
    }
    return null;
  }

  /// Validation of Password
  static String? validatePassword(String? value) {
    if ((value ?? '').trim().isEmpty) {
      return Strings.passRequired;
    } else if ((value ?? '').trim().length < 6) {
      return Strings.passValidationRequired;
    }
    return null;
  }

  /// Validation of confirm password
  static String? validateConfirmPassword(String value, String createPassword) {
    if (value.trim().isEmpty) {
      return Strings.pleaseEnterPassword;
    } else if (createPassword != value) {
      return Strings.confirmPasswordNotMatch;
    }
    return null;
  }

  /// validation of phone
  static String? validatePhone(value) {
    if (value == "") {
      return Strings.enterPhone;
    } else if (value.length < 10) {
      return Strings.enterValidPhone;
    }
    return null;
  }

  /// validation of zip
  static String? validateZip(value) {
    if (value == "") {
      return Strings.enterZip;
    } else if (value.length < 5) {
      return Strings.enterValidZip;
    }
    return null;
  }

  /// check whether give url is valid or not
  static String? hasValidUrl(String value, {bool isUrlRequired = true}) {
    String pattern2 =
        r'(([\w]+:)?//)?(([\d\w]|%[a-fA-f\d]{2,2})+(:([\d\w]|%[a-fA-f\d]{2,2})+)?@)?([\d\w][-\d\w]{0,253}[\d\w]\.)+[\w]{2,63}(:[\d]+)?(/([-+_~.\d\w]|%[a-fA-f\d]{2,2})*)*(\?(&?([-+_~.\d\w]|%[a-fA-f\d]{2,2})=?)*)?(#([-+_~.\d\w]|%[a-fA-f\d]{2,2})*)?';
    //only supports www
    String pattern =
        r'((([A-Za-z]{3,9}:(?:\/\/)?)(?:[-;:&=\+\$,\w]+@)?[A-Za-z0-9.-]+(:[0-9]+)?|(?:www.|[-;:&=\+\$,\w]+@)[A-Za-z0-9.-]+)((?:\/[\+~%\/.\w-_]*)?\??(?:[-\+=&;%@.\w_]*)#?(?:[\w]*))?)';
    RegExp regExp = RegExp(pattern);
    if (value.isEmpty && isUrlRequired) {
      return 'The input for \'URL\' is required. Please add a url.';
    } else if (!regExp.hasMatch(value) && isUrlRequired) {
      return 'The input for \'URL\' is invalid. Please add valid url.';
    }
    return null;
  }

  /// Validation of empty Field
  static String? validateValue(String value, String errorMessage) {
    if (value.trim().isEmpty) {
      return errorMessage;
    }
    return null;
  }
}
