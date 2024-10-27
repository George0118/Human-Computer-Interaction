final String tableHP2 = 'HymettusPath2';

class HP2Fields {

  static final List<String> values = [
    /// Add all fields
    id, username, state,
  ];

  static final String id = "_id";
  static final String username = "Username";
  static final String state = "State";
}

class HP2forUser{
  final int? id;
  final String username;
  final String state;

  const HP2forUser({
    this.id,
    required this.username,
    required this.state,
  });

  Map<String, Object?> toJson() => {
    HP2Fields.id: id,
    HP2Fields.username: username,
    HP2Fields.state: state,
  };

  HP2forUser copy({
    int? id,
    String? username,
    String? state,
  }) => 
      HP2forUser(
        id: id ?? this.id,
        username: username ?? this.username,
        state: state ?? this.state,
      );

  static HP2forUser fromJson(Map<String, Object?> json) => HP2forUser(
        id: json[HP2Fields.id] as int?,
        username: json[HP2Fields.username] as String,
        state: json[HP2Fields.state] as String,
      );
}