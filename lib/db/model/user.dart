final String tableUsers = 'users';

class UserFields {

  static final List<String> values = [
    /// Add all fields
    id, username, password, email, curr, fp,
  ];

  static final String id = "_id";
  static final String username = "Username";
  static final String password = "Password";
  static final String email = "Email";
  static final String curr = "Current";
  static final String fp = "Points";
}

class User{
  final int? id;
  final String username;
  final String password;
  final String email;
  final bool curr;
  final bool fp;

  const User({
    this.id,
    required this.username,
    required this.password,
    required this.email,
    required this.curr,
    required this.fp,
  });

  Map<String, Object?> toJson() => {
    UserFields.id: id,
    UserFields.username: username,
    UserFields.password: password,
    UserFields.email: email,
    UserFields.curr: curr ? 1 : 0,
    UserFields.fp: fp? 1 : 0,
  };

  User copy({
    int? id,
    String? username,
    String? password,
    String? email,
    bool? curr,
    bool? fp,
  }) => 
      User(
        id: id ?? this.id,
        username: username ?? this.username,
        password: password ?? this.password,
        email: email ?? this.email,
        curr: curr ?? this.curr,
        fp: fp ?? this.fp,
      );

  static User fromJson(Map<String, Object?> json) => User(
        id: json[UserFields.id] as int?,
        username: json[UserFields.username] as String,
        password: json[UserFields.password] as String,
        email: json[UserFields.email] as String,
        curr: json[UserFields.curr] == 1,
        fp: json[UserFields.fp] == 1,
      );
}