/// status : true
/// data : {"_id":"63677bc41738398e78afdbfe","vendorId":"6366847aa3845e32ee45550f","title":"tab s7","price":60000,"quantity":15,"productImage":"https://res.cloudinary.com/dz55xewlb/image/upload/v1667726274/product_images/aikmxrtsgfc9nqm3ndo6.jpg","category":"tech","subCategory":"tab","status":"Activated","deletedAt":null,"isDeleted":false,"createdAt":"2022-11-06T09:17:56.499Z","updatedAt":"2022-11-06T09:17:56.499Z","__v":0}

class Getproductdetails {
  Getproductdetails({
      bool? status, 
      Data? data,}){
    _status = status;
    _data = data;
}

  Getproductdetails.fromJson(dynamic json) {
    _status = json['status'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? _status;
  Data? _data;
Getproductdetails copyWith({  bool? status,
  Data? data,
}) => Getproductdetails(  status: status ?? _status,
  data: data ?? _data,
);
  bool? get status => _status;
  Data? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }

}

/// _id : "63677bc41738398e78afdbfe"
/// vendorId : "6366847aa3845e32ee45550f"
/// title : "tab s7"
/// price : 60000
/// quantity : 15
/// productImage : "https://res.cloudinary.com/dz55xewlb/image/upload/v1667726274/product_images/aikmxrtsgfc9nqm3ndo6.jpg"
/// category : "tech"
/// subCategory : "tab"
/// status : "Activated"
/// deletedAt : null
/// isDeleted : false
/// createdAt : "2022-11-06T09:17:56.499Z"
/// updatedAt : "2022-11-06T09:17:56.499Z"
/// __v : 0

class Data {
  Data({
      String? id, 
      String? vendorId, 
      String? title, 
      num? price, 
      num? quantity, 
      String? productImage, 
      String? category, 
      String? subCategory, 
      String? status, 
      dynamic deletedAt, 
      bool? isDeleted, 
      String? createdAt, 
      String? updatedAt, 
      num? v,}){
    _id = id;
    _vendorId = vendorId;
    _title = title;
    _price = price;
    _quantity = quantity;
    _productImage = productImage;
    _category = category;
    _subCategory = subCategory;
    _status = status;
    _deletedAt = deletedAt;
    _isDeleted = isDeleted;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _v = v;
}

  Data.fromJson(dynamic json) {
    _id = json['_id'];
    _vendorId = json['vendorId'];
    _title = json['title'];
    _price = json['price'];
    _quantity = json['quantity'];
    _productImage = json['productImage'];
    _category = json['category'];
    _subCategory = json['subCategory'];
    _status = json['status'];
    _deletedAt = json['deletedAt'];
    _isDeleted = json['isDeleted'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
    _v = json['__v'];
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
  dynamic _deletedAt;
  bool? _isDeleted;
  String? _createdAt;
  String? _updatedAt;
  num? _v;
Data copyWith({  String? id,
  String? vendorId,
  String? title,
  num? price,
  num? quantity,
  String? productImage,
  String? category,
  String? subCategory,
  String? status,
  dynamic deletedAt,
  bool? isDeleted,
  String? createdAt,
  String? updatedAt,
  num? v,
}) => Data(  id: id ?? _id,
  vendorId: vendorId ?? _vendorId,
  title: title ?? _title,
  price: price ?? _price,
  quantity: quantity ?? _quantity,
  productImage: productImage ?? _productImage,
  category: category ?? _category,
  subCategory: subCategory ?? _subCategory,
  status: status ?? _status,
  deletedAt: deletedAt ?? _deletedAt,
  isDeleted: isDeleted ?? _isDeleted,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  v: v ?? _v,
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
  dynamic get deletedAt => _deletedAt;
  bool? get isDeleted => _isDeleted;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  num? get v => _v;

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
    map['deletedAt'] = _deletedAt;
    map['isDeleted'] = _isDeleted;
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    map['__v'] = _v;
    return map;
  }

}