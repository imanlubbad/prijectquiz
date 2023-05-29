class User {
  int? id;
  late String name;
  late String email;
  late String password;

  User();

  Map<String, dynamic> toMap() {
    return {'name': name, 'email': email, 'password': password};
  }

  User.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    name = map['name'];
    email = map['email'];
    password = map['password'];
  }
}
