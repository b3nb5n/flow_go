abstract class User {
  String firstName = '';
  String lastName = '';
  String email = '';
  String password = '';
}

class UserErrors {
  String? firstName;
  String? lastName;
  String? email;
  String? password;

  UserErrors({
    this.firstName,
    this.lastName,
    this.email,
    this.password,
  });

  Map<String, String?> toJSON() => {
        'firstName': firstName,
        'lastName': lastName,
        'email': email,
        'password': password,
      };

  factory UserErrors.fromJSON(Map<String, String?> json) => UserErrors(
        firstName: json['firstName']?.toString(),
        lastName: json['lastName']?.toString(),
        email: json['email']?.toString(),
        password: json['password'].toString(),
      );
}
