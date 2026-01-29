class User {
  String name;
  String? id;
  String? password;
  String email;

  User({
    required this.email,
    required this.name,
    required this.password,
    this.id,
  });

  Map<String, dynamic> toMap() {
    return {'id': id, 'name': name, 'email': email};
  }

  factory User.fromMap(Map<String, dynamic> json) {
    return User(
      email: json['email'],
      name: json['name'],
      password: json['password'],
    );
  }
}
