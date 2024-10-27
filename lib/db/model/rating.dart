final String tableRatings = 'Ratings';

class RatingFields {

  static final List<String> values = [
    /// Add all fields
    username, path, rate
  ];

  static final String username = "Username";
  static final String path = "Path";
  static final String rate = "Rate";
}

class Rating{
  final String username;
  final String path;
  final double rate;

  const Rating({
    required this.username,
    required this.path,
    required this.rate,
  });

  Map<String, Object?> toJson() => {
    RatingFields.username: username,
    RatingFields.path: path,
    RatingFields.rate: rate,
  };

  Rating copy({
    String? username,
    String? path,
    double? rate,
  }) => 
      Rating(
        username: username ?? this.username,
        path: path ?? this.path,
        rate: rate ?? this.rate,
      );

  static Rating fromJson(Map<String, Object?> json) => Rating(
        username: json[RatingFields.username] as String,
        path: json[RatingFields.path] as String,
        rate: json[RatingFields.rate] as double,
      );
}