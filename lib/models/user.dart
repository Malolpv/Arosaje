class User {
  final int id;
  final String uid;
  final String email;
  final String pass;
  final String access;

  const User(this.id, this.uid, this.email, this.pass, this.access);

  User.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        uid = json["uid"],
        email = json["email"],
        pass = json["password"],
        access = json["access"];
}
