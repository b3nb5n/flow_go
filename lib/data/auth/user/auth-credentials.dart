import 'package:flow_go/data/auth/user/user-provider.dart';
import 'package:string_ops/string_ops.dart';

class AuthCredentials {
  String identifier;
  String password;

  AuthCredentials({
    this.identifier = '',
    this.password = '',
  });

  Map<String, String> toJSON() => {
        'identifier': identifier,
        'password': password,
      };

  static final _validators = {
    'identifier': RegExp(r'.'),
    'password': RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{10,}$'),
  };

  AuthCredentialsErrors validate() {
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

    return AuthCredentialsErrors.fromJSON(errors);
  }

  bool login() {
    if (validate().hasErrors) return false;
    // communicate with auth server

    UserNotifier.instance.firstName = 'John'; // result from auth server
    UserNotifier.instance.lastName = 'Doe'; // result from auth server
    UserNotifier.instance.email = identifier;
    UserNotifier.instance.password = password;

    return true;
  }
}

class AuthCredentialsErrors {
  String? identifier;
  String? password;

  AuthCredentialsErrors({
    this.identifier,
    this.password,
  });

  bool get hasErrors =>
      toJSON().values.any((error) => error?.isNotEmpty ?? false);

  Map<String, String?> toJSON() => {
        'identifier': identifier,
        'password': password,
      };

  factory AuthCredentialsErrors.fromJSON(Map<String, String> json) =>
      AuthCredentialsErrors(
        identifier: json['identifier']?.toString(),
        password: json['password']?.toString(),
      );
}
