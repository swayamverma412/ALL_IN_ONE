import 'GoogleMapsLocation.dart';
import 'Socials.dart';

class VendorDetails {
  VendorDetails({
      this.id, 
      this.vendorName, 
      this.businessName, 
      this.number, 
      this.referredBy, 
      this.age, 
      this.pincode, 
      this.cityState, 
      this.typeOfStore, 
      this.aadharFront, 
      this.aadharBack, 
      this.gst, 
      this.vendorPicture, 
      this.shopPicture, 
      this.shopAddress, 
      this.shopAge, 
      this.shopTiming, 
      this.deliveryMode, 
      this.googleMapsLocation, 
      this.socials, 
      this.password, 
      this.status, 
      this.deletedAt, 
      this.isDeleted, 
      this.createdAt, 
      this.updatedAt, 
      this.v,});

  VendorDetails.fromJson(dynamic json) {
    id = json['_id'];
    vendorName = json['vendorName'];
    businessName = json['businessName'];
    number = json['number'];
    referredBy = json['referredBy'];
    age = json['age'];
    pincode = json['pincode'];
    cityState = json['cityState'];
    typeOfStore = json['typeOfStore'];
    aadharFront = json['aadharFront'];
    aadharBack = json['aadharBack'];
    gst = json['gst'];
    vendorPicture = json['vendorPicture'];
    shopPicture = json['shopPicture'];
    shopAddress = json['shopAddress'];
    shopAge = json['shopAge'];
    shopTiming = json['shopTiming'];
    deliveryMode = json['deliveryMode'];
    googleMapsLocation = json['googleMapsLocation'] != null ? GoogleMapsLocation.fromJson(json['googleMapsLocation']) : null;
    socials = json['socials'] != null ? Socials.fromJson(json['socials']) : null;
    password = json['password'];
    status = json['status'];
    deletedAt = json['deletedAt'];
    isDeleted = json['isDeleted'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
  }
  String? id;
  String? vendorName;
  String? businessName;
  int? number;
  dynamic referredBy;
  int? age;
  int? pincode;
  String? cityState;
  String? typeOfStore;
  String? aadharFront;
  String? aadharBack;
  String? gst;
  String? vendorPicture;
  String? shopPicture;
  String? shopAddress;
  int? shopAge;
  String? shopTiming;
  String? deliveryMode;
  GoogleMapsLocation? googleMapsLocation;
  Socials? socials;
  String? password;
  String? status;
  dynamic deletedAt;
  bool? isDeleted;
  String? createdAt;
  String? updatedAt;
  int? v;

  Map<String?, dynamic> toJson() {
    final map = <String?, dynamic>{};
    map['_id'] = id;
    map['vendorName'] = vendorName;
    map['businessName'] = businessName;
    map['number'] = number;
    map['referredBy'] = referredBy;
    map['age'] = age;
    map['pincode'] = pincode;
    map['cityState'] = cityState;
    map['typeOfStore'] = typeOfStore;
    map['aadharFront'] = aadharFront;
    map['aadharBack'] = aadharBack;
    map['gst'] = gst;
    map['vendorPicture'] = vendorPicture;
    map['shopPicture'] = shopPicture;
    map['shopAddress'] = shopAddress;
    map['shopAge'] = shopAge;
    map['shopTiming'] = shopTiming;
    map['deliveryMode'] = deliveryMode;
    if (googleMapsLocation != null) {
      map['googleMapsLocation'] = googleMapsLocation!.toJson();
    }
    if (socials != null) {
      map['socials'] = socials!.toJson();
    }
    map['password'] = password;
    map['status'] = status;
    map['deletedAt'] = deletedAt;
    map['isDeleted'] = isDeleted;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['__v'] = v;
    return map;
  }

}