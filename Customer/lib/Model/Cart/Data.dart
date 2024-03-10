import 'Items.dart';

class Data {
  Data({
      this.id, 
      this.customerId, 
      this.vendorId, 
      this.items, 
      this.totalPrice, 
      this.totalItems, 
      this.createdAt, 
      this.updatedAt, 
      this.v,});

  Data.fromJson(dynamic json) {
    id = json['_id'];
    customerId = json['customerId'];
    vendorId = json['vendorId'];
    if (json['items'] != null) {
      items = [];
      json['items'].forEach((v) {
        items!.add(Items.fromJson(v));
      });
    }
    totalPrice = json['totalPrice'];
    totalItems = json['totalItems'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
  }
  String? id;
  String? customerId;
  String? vendorId;
  List<Items>? items;
  int? totalPrice;
  int? totalItems;
  String? createdAt;
  String? updatedAt;
  int? v;

  Map<String?, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['customerId'] = customerId;
    map['vendorId'] = vendorId;
    if (items != null) {
      map['items'] = items!.map((v) => v.toJson()).toList();
    }
    map['totalPrice'] = totalPrice;
    map['totalItems'] = totalItems;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['__v'] = v;
    return map;
  }

}