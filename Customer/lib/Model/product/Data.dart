class Data {
  Data({
      required this.id,
      required this.vendorId,
      required this.title,
      required this.price,
      required this.quantity,
      required this.productImage,
      required this.category,
      required this.subCategory,
      required this.status,
      this.deletedAt, 
      required this.isDeleted,
      required this.createdAt,
      required this.updatedAt,
      required this.v,});

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
    deletedAt = json['deletedAt'];
    isDeleted = json['isDeleted'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
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
  dynamic deletedAt;
  bool? isDeleted;
  String? createdAt;
  String? updatedAt;
  int? v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['vendorId'] = vendorId;
    map['title'] = title;
    map['price'] = price;
    map['quantity'] = quantity;
    map['productImage'] = productImage;
    map['category'] = category;
    map['subCategory'] = subCategory;
    map['status'] = status;
    map['deletedAt'] = deletedAt;
    map['isDeleted'] = isDeleted;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['__v'] = v;
    return map;
  }

}