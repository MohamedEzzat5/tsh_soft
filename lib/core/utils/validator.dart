import 'package:flutter/material.dart';
import 'package:tsh_soft/config/locale/app_localizations.dart';

abstract class Validator {
  static String? call({
    required String? value,
    required ValidatorType type,
    required BuildContext context,
  }) {
    String? validateNotEmpty = _notEmpty(value, context);
    if (validateNotEmpty == null) {
      return type.condition.call(value, context) ?? validateNotEmpty;
    }
    return validateNotEmpty;
  }

  static String? _notEmpty(String? value, BuildContext context) {
    if (value != null && value.trim().isEmpty) {
      return 'error_field_required'.tr(context);
    }
    return null;
  }

  static String? _name(String? value, BuildContext context) {
    if (value == null || value.trim().split(' ').length < 2) {
      return 'error_valid_name'.tr(context);
    }
    return null;
  }

  static String? _phone(String? value, BuildContext context) {
    if (value == null || value.isEmpty)
      return 'error_field_required'.tr(context);

    const pattern = r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$';
    final regExp = RegExp(pattern);
    if (!regExp.hasMatch(value)) {
      return 'error_valid_phone_number'.tr(context);
    }
    return null;
  }

  static String? _email(String? value, BuildContext context) {
    if (value == null || value.isEmpty)
      return 'error_field_required'.tr(context);

    const pattern =
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
    final regExp = RegExp(pattern);
    if (!regExp.hasMatch(value)) {
      return 'error_valid_email'.tr(context);
    }
    return null;
  }

  static String? _textOnly(String? value, BuildContext context) {
    if (value == null || value.isEmpty)
      return 'error_field_required'.tr(context);

    const pattern = r'^[a-zA-Z\s]+$';
    final regExp = RegExp(pattern);
    if (!regExp.hasMatch(value)) {
      return 'error_valid_text'.tr(context);
    }
    return null;
  }

  static String? _numbersOnly(String? value, BuildContext context) {
    if (value == null || value.isEmpty)
      return 'error_field_required'.tr(context);

    final int? number = int.tryParse(value);
    if (number == null) {
      return 'error_valid_numbers'.tr(context);
    }
    return null;
  }

  static String? _password(String? password, BuildContext context) {
    if (password == null || password.isEmpty) {
      return 'error_valid_password'.tr(context);
    }

    bool hasDigits = password.contains(RegExp(r'[0-9]'));
    bool hasMinLength = password.length > 7;

    bool isValid = hasDigits && hasMinLength;
    return isValid ? null : 'error_valid_password'.tr(context);
  }

}

enum ValidatorType {
  standard,
  name,
  email,
  phone,
  textOnly,
  numbersOnly,
  password,
  confirmPassword,
}

extension ValidatorTypeExtension on ValidatorType {
  String? Function(String?, BuildContext) get condition {
    switch (this) {
      case ValidatorType.standard:
        return Validator._notEmpty;
      case ValidatorType.name:
        return Validator._name;
      case ValidatorType.email:
        return Validator._email;
      case ValidatorType.phone:
        return Validator._phone;
      case ValidatorType.textOnly:
        return Validator._textOnly;
      case ValidatorType.numbersOnly:
        return Validator._numbersOnly;
      case ValidatorType.password:
        return Validator._password;
      case ValidatorType.confirmPassword:
        return (value, context) => null;
    }
  }
}
