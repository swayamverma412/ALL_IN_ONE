class Dist {
  Dist({
      this.calculated,});

  Dist.fromJson(dynamic json) {
    calculated = json['calculated'];
  }
  int? calculated;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['calculated'] = calculated;
    return map;
  }

}