class GoogleMapsLocation {
  GoogleMapsLocation({
      this.coordinates, 
      this.type,});

  GoogleMapsLocation.fromJson(dynamic json) {
    coordinates = json['coordinates'] != null ? json['coordinates'].cast<double>() : [];
    type = json['type'];
  }
  List<double>? coordinates;
  String? type;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['coordinates'] = coordinates;
    map['type'] = type;
    return map;
  }

}