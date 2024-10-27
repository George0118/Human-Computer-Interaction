final String tableHP1 = 'HymettusPath1';

class HP1Fields {

  static final List<String> values = [
    /// Add all fields
    id, username, state,
  ];

  static final String id = "_id";
  static final String username = "Username";
  static final String state = "State";
}

class HP1forUser{
  final int? id;
  final String username;
  final String state;

  const HP1forUser({
    this.id,
    required this.username,
    required this.state,
  });

  Map<String, Object?> toJson() => {
    HP1Fields.id: id,
    HP1Fields.username: username,
    HP1Fields.state: state,
  };

  HP1forUser copy({
    int? id,
    String? username,
    String? state,
  }) => 
      HP1forUser(
        id: id ?? this.id,
        username: username ?? this.username,
        state: state ?? this.state,
      );

  static HP1forUser fromJson(Map<String, Object?> json) => HP1forUser(
        id: json[HP1Fields.id] as int?,
        username: json[HP1Fields.username] as String,
        state: json[HP1Fields.state] as String,
      );
}