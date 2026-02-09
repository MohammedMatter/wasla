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
}
