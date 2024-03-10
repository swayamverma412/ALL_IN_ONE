class Socials {
  Socials({
      this.instagram, 
      this.facebook,});

  Socials.fromJson(dynamic json) {
    instagram = json['instagram'];
    facebook = json['facebook'];
  }
  String? instagram;
  String? facebook;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['instagram'] = instagram;
    map['facebook'] = facebook;
    return map;
  }

}