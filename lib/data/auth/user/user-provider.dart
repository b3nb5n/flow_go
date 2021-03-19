import 'package:flow_go/data/auth/user/user.dart';
import 'package:flutter/material.dart';

class UserNotifier extends ChangeNotifier implements User {
  String _firstName = '';
  String _lastName = '';
  String _email = '';
  String _password = '';

  String get firstName => _firstName;
  String get lastName => _lastName;
  String get email => _email;
  String get password => _password;

  set firstName(String firstName) {
    _firstName = firstName;
    notifyListeners();
  }

  set lastName(String lastName) {
    _lastName = lastName;
    notifyListeners();
  }

  set email(String email) {
    _email = email;
    notifyListeners();
  }

  set password(String password) {
    _password = password;
    notifyListeners();
  }

  Map<String, String> toJSON() => {
        'firstName': firstName,
        'lastName': lastName,
        'email': email,
        'password': password,
      };

  String? operator [](String field) {
    final json = toJSON();
    if (json.containsKey(field)) return json[field];
    return null;
  }

  static final _validators = {
    'firstName': RegExp(''),
    'lastName': RegExp(''),
    'email': RegExp(''),
    'password': RegExp(''),
  };

  UserErrors validate() {
    Map<String, String?> errors = {};
    final fields = _validators.keys.toList();

    fields.forEach((field) {
      final value = this[field];
      if (value == null || value.isEmpty) {
        errors[field] = '$field is required';
      }

      if (!_validators[field]!.hasMatch(value!)) {
        errors[field] = 'invalid $field';
      }
    });

    return UserErrors.fromJSON(errors);
  }
}
