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