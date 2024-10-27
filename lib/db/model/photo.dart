final String tablePhotos = 'Photos';

class PhotoFields {

  static final List<String> values = [
    /// Add all fields
    username, path, photo_name
  ];

  static final String username = "Username";
  static final String path = "Path";
  static final String photo_name = "Photo_name";
}

class Photo{
  final String username;
  final String path;
  final String photo_name;

  const Photo({
    required this.username,
    required this.path,
    required this.photo_name,
  });

  Map<String, Object?> toJson() => {
    PhotoFields.username: username,
    PhotoFields.path: path,
    PhotoFields.photo_name: photo_name,
  };

  Photo copy({
    String? username,
    String? path,
    String? photo_name,
  }) => 
      Photo(
        username: username ?? this.username,
        path: path ?? this.path,
        photo_name: photo_name ?? this.photo_name,
      );

  static Photo fromJson(Map<String, Object?> json) => Photo(
        username: json[PhotoFields.username] as String,
        path: json[PhotoFields.path] as String,
        photo_name: json[PhotoFields.photo_name] as String,
      );
}