import 'package:flow_go/data/auth/user/user.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:string_ops/string_ops.dart';

class UserNotifier extends ChangeNotifier implements User {
  UserNotifier._privateConstructor();
  static final _instance = UserNotifier._privateConstructor();
  static UserNotifier get instance => _instance;

  String _firstName = '';
  String _lastName = '';
  String _email = '';
  String _password = '';

  String get firstName => _firstName;
  String get lastName => _lastName;
  String get email => _email;
  String get password => _password;

  set firstName(String firstName) {
    _firstName = firstName.trim();
    notifyListeners();
  }

  set lastName(String lastName) {
    _lastName = lastName.trim();
    notifyListeners();
  }

  set email(String email) {
    _email = email.trim();
    notifyListeners();
  }

  set password(String password) {
    _password = password.trim();
    notifyListeners();
  }

  Map<String, String> toJSON() => {
        'firstName': firstName,
        'lastName': lastName,
        'email': email,
        'password': password,
      };

  static final _validators = {
    'firstName': RegExp(r'^\w+$'),
    'lastName': RegExp(r'^\w+$'),
    'email': RegExp(r'^\S+@\S+\.\w+$'),
    'password': RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{10,}$'),
  };

  UserErrors validate() {
    Map<String, String> errors = {};
    final values = toJSON();
    final fields = values.keys.toList();

    fields.forEach((field) {
      final value = values[field];
      if (value!.isEmpty) {
        final fieldName = field.convertCasing(CasingFormat.scentenceCase);
        errors[field] = '$fieldName is required';
      } else if (!_validators[field]!.hasMatch(value)) {
        final fieldName = field.convertCasing(CasingFormat.lowerCase);
        errors[field] = 'Invalid $fieldName';
      }
    });

    return UserErrors.fromJSON(errors);
  }
}

final userNotifierProvider =
    ChangeNotifierProvider((_) => UserNotifier.instance);
