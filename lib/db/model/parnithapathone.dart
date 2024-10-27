final String tablePP1 = 'ParnithaPath1';

class PP1Fields {

  static final List<String> values = [
    /// Add all fields
    id, username, state,
  ];

  static final String id = "_id";
  static final String username = "Username";
  static final String state = "State";
}

class PP1forUser{
  final int? id;
  final String username;
  final String state;

  const PP1forUser({
    this.id,
    required this.username,
    required this.state,
  });

  Map<String, Object?> toJson() => {
    PP1Fields.id: id,
    PP1Fields.username: username,
    PP1Fields.state: state,
  };

  PP1forUser copy({
    int? id,
    String? username,
    String? state,
  }) => 
      PP1forUser(
        id: id ?? this.id,
        username: username ?? this.username,
        state: state ?? this.state,
      );

  static PP1forUser fromJson(Map<String, Object?> json) => PP1forUser(
        id: json[PP1Fields.id] as int?,
        username: json[PP1Fields.username] as String,
        state: json[PP1Fields.state] as String,
      );
}