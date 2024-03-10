/// status : true
/// count : 4
/// Dataproduct : [{"_id":"63677b9b1738398e78afdbfc","vendorId":"6366847aa3845e32ee45550f","title":"samsung m02","price":10000,"quantity":42,"productImage":"https://res.cloudinary.com/dz55xewlb/image/upload/v1667726233/product_images/v3yg84wxyz0wga0yxcpi.jpg","category":"tech","subCategory":"phone","status":"Activated","location":{"type":"Point","coordinates":[73.008957,26.263863]},"deletedAt":null,"isDeleted":false,"createdAt":"2022-11-06T09:17:15.618Z","updatedAt":"2022-12-25T16:26:17.178Z","__v":0,"sold":12},{"_id":"63677bc41738398e78afdbfe","vendorId":"6366847aa3845e32ee45550f","title":"tab s7","price":60000,"quantity":8,"productImage":"https://res.cloudinary.com/dz55xewlb/image/upload/v1667726274/product_images/aikmxrtsgfc9nqm3ndo6.jpg","category":"tech","subCategory":"tab","status":"Activated","location":{"type":"Point","coordinates":[73.008957,26.263863]},"deletedAt":null,"isDeleted":false,"createdAt":"2022-11-06T09:17:56.499Z","updatedAt":"2022-12-25T16:26:17.261Z","__v":0,"sold":14},{"_id":"63677c9f1738398e78afdc04","vendorId":"6366867ca3845e32ee455517","title":"earbuds","price":5000,"quantity":70,"productImage":"https://res.cloudinary.com/dz55xewlb/image/upload/v1667726493/product_images/kq3ft7bkm48kwi09cnqm.jpg","category":"tech","subCategory":"audio","status":"Activated","location":{"type":"Point","coordinates":[72.585022,23.033863]},"deletedAt":null,"isDeleted":false,"createdAt":"2022-11-06T09:21:35.355Z","updatedAt":"2022-11-06T09:21:35.355Z","__v":0},{"_id":"63677b741738398e78afdbfa","vendorId":"636685d8a3845e32ee455513","title":"samsung s1","price":85000,"quantity":10,"productImage":"https://res.cloudinary.com/dz55xewlb/image/upload/v1667726194/product_images/lkhenvafprvfsiu4sr5p.jpg","category":"tech","subCategory":"phone","status":"Activated","location":{"type":"Point","coordinates":[75.778885,26.92207]},"deletedAt":null,"isDeleted":false,"createdAt":"2022-11-06T09:16:36.427Z","updatedAt":"2022-11-06T09:16:36.427Z","__v":0}]

// class AllProduct {
//   AllProduct({
//       bool? status,
//       num? count,
//       List<Dataproduct>? product,}){
//     _status = status;
//     _count = count;
//     _product = product;
// }
//
//   AllProduct.fromJson(dynamic json) {
//     _status = json['status'];
//     _count = json['count'];
//     if (json['Dataproduct'] != null) {
//       _product = [];
//       json['Dataproduct'].forEach((v) {
//         _product?.add(Dataproduct?.fromJson(v));
//       });
//     }
//   }
//   bool? _status;
//   num? _count;
//   List<Dataproduct>? _Dataproduct;
// AllProduct copyWith({  bool? status,
//   num? count,
//   List<Dataproduct>? Dataproduct,
// }) => AllProduct(  status: status ?? _status,
//   count: count ?? _count,
//   Dataproduct: Dataproduct ?? _Dataproduct,
// );
//   bool? get status => _status;
//   num? get count => _count;
//   List<Dataproduct>? get Dataproduct => _Dataproduct;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['status'] = _status;
//     map['count'] = _count;
//     if (_Dataproduct != null) {
//       map['Dataproduct'] = _Dataproduct?.map((v) => v.toJson()).toList();
//     }
//     return map;
//   }
//
// }

/// _id : "63677b9b1738398e78afdbfc"
/// vendorId : "6366847aa3845e32ee45550f"
/// title : "samsung m02"
/// price : 10000
/// quantity : 42
/// productImage : "https://res.cloudinary.com/dz55xewlb/image/upload/v1667726233/product_images/v3yg84wxyz0wga0yxcpi.jpg"
/// category : "tech"
/// subCategory : "phone"
/// status : "Activated"
/// location : {"type":"Point","coordinates":[73.008957,26.263863]}
/// deletedAt : null
/// isDeleted : false
/// createdAt : "2022-11-06T09:17:15.618Z"
/// updatedAt : "2022-12-25T16:26:17.178Z"
/// __v : 0
/// sold : 12

class Dataproduct {
  Dataproduct({
      String? id, 
      String? vendorId, 
      String? title, 
      num? price, 
      num? quantity, 
      String? productImage, 
      String? category, 
      String? subCategory, 
      String? status, 
      Location? location, 
      dynamic deletedAt, 
      bool? isDeleted, 
      String? createdAt, 
      String? updatedAt, 
      num? v, 
      num? sold,}){
    _id = id;
    _vendorId = vendorId;
    _title = title;
    _price = price;
    _quantity = quantity;
    _productImage = productImage;
    _category = category;
    _subCategory = subCategory;
    _status = status;
    _location = location;
    _deletedAt = deletedAt;
    _isDeleted = isDeleted;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _v = v;
    _sold = sold;
}

  Dataproduct.fromJson(dynamic json) {
    _id = json['_id'];
    _vendorId = json['vendorId'];
    _title = json['title'];
    _price = json['price'];
    _quantity = json['quantity'];
    _productImage = json['productImage'];
    _category = json['category'];
    _subCategory = json['subCategory'];
    _status = json['status'];
    _location = json['location'] != null ? Location.fromJson(json['location']) : null;
    _deletedAt = json['deletedAt'];
    _isDeleted = json['isDeleted'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
    _v = json['__v'];
    _sold = json['sold'];
  }
  String? _id;
  String? _vendorId;
  String? _title;
  num? _price;
  num? _quantity;
  String? _productImage;
  String? _category;
  String? _subCategory;
  String? _status;
  Location? _location;
  dynamic _deletedAt;
  bool? _isDeleted;
  String? _createdAt;
  String? _updatedAt;
  num? _v;
  num? _sold;
Dataproduct copyWith({  String? id,
  String? vendorId,
  String? title,
  num? price,
  num? quantity,
  String? productImage,
  String? category,
  String? subCategory,
  String? status,
  Location? location,
  dynamic deletedAt,
  bool? isDeleted,
  String? createdAt,
  String? updatedAt,
  num? v,
  num? sold,
}) => Dataproduct(  id: id ?? _id,
  vendorId: vendorId ?? _vendorId,
  title: title ?? _title,
  price: price ?? _price,
  quantity: quantity ?? _quantity,
  productImage: productImage ?? _productImage,
  category: category ?? _category,
  subCategory: subCategory ?? _subCategory,
  status: status ?? _status,
  location: location ?? _location,
  deletedAt: deletedAt ?? _deletedAt,
  isDeleted: isDeleted ?? _isDeleted,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  v: v ?? _v,
  sold: sold ?? _sold,
);
  String? get id => _id;
  String? get vendorId => _vendorId;
  String? get title => _title;
  num? get price => _price;
  num? get quantity => _quantity;
  String? get productImage => _productImage;
  String? get category => _category;
  String? get subCategory => _subCategory;
  String? get status => _status;
  Location? get location => _location;
  dynamic get deletedAt => _deletedAt;
  bool? get isDeleted => _isDeleted;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  num? get v => _v;
  num? get sold => _sold;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    map['vendorId'] = _vendorId;
    map['title'] = _title;
    map['price'] = _price;
    map['quantity'] = _quantity;
    map['productImage'] = _productImage;
    map['category'] = _category;
    map['subCategory'] = _subCategory;
    map['status'] = _status;
    if (_location != null) {
      map['location'] = _location?.toJson();
    }
    map['deletedAt'] = _deletedAt;
    map['isDeleted'] = _isDeleted;
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    map['__v'] = _v;
    map['sold'] = _sold;
    return map;
  }

}

/// type : "Point"
/// coordinates : [73.008957,26.263863]

class Location {
  Location({
      String? type, 
      List<num>? coordinates,}){
    _type = type;
    _coordinates = coordinates;
}

  Location.fromJson(dynamic json) {
    _type = json['type'];
    _coordinates = json['coordinates'] != null ? json['coordinates'].cast<num>() : [];
  }
  String? _type;
  List<num>? _coordinates;
Location copyWith({  String? type,
  List<num>? coordinates,
}) => Location(  type: type ?? _type,
  coordinates: coordinates ?? _coordinates,
);
  String? get type => _type;
  List<num>? get coordinates => _coordinates;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['type'] = _type;
    map['coordinates'] = _coordinates;
    return map;
  }

}