import 'Location.dart';
import 'Dist.dart';
import 'VendorDetails.dart';

class Data {
  Data({
      this.id, 
      this.vendorId, 
      this.title, 
      this.price, 
      this.quantity, 
      this.productImage, 
      this.category, 
      this.subCategory, 
      this.status, 
      this.location, 
      this.deletedAt, 
      this.isDeleted, 
      this.createdAt, 
      this.updatedAt, 
      this.v, 
      this.dist, 
      this.vendorDetails,});

  Data.fromJson(dynamic json) {
    id = json['_id'];
    vendorId = json['vendorId'];
    title = json['title'];
    price = json['price'];
    quantity = json['quantity'];
    productImage = json['productImage'];
    category = json['category'];
    subCategory = json['subCategory'];
    status = json['status'];
    location = json['location'] != null ? Location.fromJson(json['location']) : null;
    deletedAt = json['deletedAt'];
    isDeleted = json['isDeleted'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
    dist = json['dist'] != null ? Dist.fromJson(json['dist']) : null;
    if (json['vendorDetails'] != null) {
      vendorDetails = [];
      json['vendorDetails'].forEach((v) {
        vendorDetails!.add(VendorDetails.fromJson(v));
      });
    }
  }
  String? id;
  String? vendorId;
  String? title;
  int? price;
  int? quantity;
  String? productImage;
  String? category;
  String? subCategory;
  String? status;
  Location? location;
  dynamic deletedAt;
  bool? isDeleted;
  String? createdAt;
  String? updatedAt;
  int? v;
  Dist? dist;
  List<VendorDetails>? vendorDetails;

  Map<String?, dynamic> toJson() {
    final map = <String?, dynamic>{};
    map['_id'] = id;
    map['vendorId'] = vendorId;
    map['title'] = title;
    map['price'] = price;
    map['quantity'] = quantity;
    map['productImage'] = productImage;
    map['category'] = category;
    map['subCategory'] = subCategory;
    map['status'] = status;
    if (location != null) {
      map['location'] = location!.toJson();
    }
    map['deletedAt'] = deletedAt;
    map['isDeleted'] = isDeleted;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['__v'] = v;
    if (dist != null) {
      map['dist'] = dist!.toJson();
    }
    if (vendorDetails != null) {
      map['vendorDetails'] = vendorDetails!.map((v) => v.toJson()).toList();
    }
    return map;
  }

}