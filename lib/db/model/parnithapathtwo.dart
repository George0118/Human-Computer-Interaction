final String tablePP2 = 'ParnithaPath2';

class PP2Fields {

  static final List<String> values = [
    /// Add all fields
    id, username, state,
  ];

  static final String id = "_id";
  static final String username = "Username";
  static final String state = "State";
}

class PP2forUser{
  final int? id;
  final String username;
  final String state;

  const PP2forUser({
    this.id,
    required this.username,
    required this.state,
  });

  Map<String, Object?> toJson() => {
    PP2Fields.id: id,
    PP2Fields.username: username,
    PP2Fields.state: state,
  };

  PP2forUser copy({
    int? id,
    String? username,
    String? state,
  }) => 
      PP2forUser(
        id: id ?? this.id,
        username: username ?? this.username,
        state: state ?? this.state,
      );

  static PP2forUser fromJson(Map<String, Object?> json) => PP2forUser(
        id: json[PP2Fields.id] as int?,
        username: json[PP2Fields.username] as String,
        state: json[PP2Fields.state] as String,
      );
}