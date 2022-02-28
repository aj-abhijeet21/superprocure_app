class LocalDirections {
  double lat;
  double lng;
  DateTime duration;
  LocalDirections({
    required this.lat,
    required this.lng,
    required this.duration,
  });
  factory LocalDirections.fromJson(Map<String, dynamic> json) {
    return LocalDirections(
      lng: json['point'][0] ?? 0.0,
      lat: json['point'][1] ?? 0.0,
      duration: DateTime.parse(json['t']['recorded']),
    );
  }
}
