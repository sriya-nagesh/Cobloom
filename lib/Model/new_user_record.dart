//Sriya Nagesh (SUKD1902368) BIT-UCLAN
//passes these values into database from login and registration
class NewUserRecord {
  late String username;
  late String email;
  late String password;

  NewUserRecord(this.username, this.email, this.password);

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'user_name': username,
      'email': email,
      'password': password
    };
    return map;
  }

  NewUserRecord.fromMap(Map<String, dynamic> map) {
    username = map['user_name'];
    email = map['email'];
    password = map['password'];
  }
}
