/// status : false
/// data : [{"_id":"63a7d3104ec58b8317e57962","customerId":"63a6d6e1e16607bda59d1d97","vendorId":"6366847aa3845e32ee45550f","items":[{"productId":"63677bc41738398e78afdbfe","quantity":2},{"productId":"63677b9b1738398e78afdbfc","quantity":2}],"totalPrice":140000,"totalItems":2,"totalQuantity":4,"cancellable":true,"serviceFee":0,"deliveryFee":0,"discount":0,"couponDiscount":1000,"couponCode":"test passed","deliveryLocation":{"type":"Point","coordinates":[77.594566,12.971599],"address":"moshi moshi 5th floor","addressType":"office"},"paymentStatus":"not paid","paymentMethod":"cash","totalAmount":139000,"status":["order placed","completed"],"completedAt":null,"rating":4,"isDeleted":false,"createdAt":"2022-12-25T04:35:28.760Z","updatedAt":"2022-12-25T07:41:58.749Z","__v":0}]

class GetOrderModel {
  GetOrderModel({
      bool? status, 
      List<Data>? data,}){
    _status = status;
    _data = data;
}

  GetOrderModel.fromJson(dynamic json) {
    _status = json['status'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
  }
  bool? _status;
  List<Data>? _data;
GetOrderModel copyWith({  bool? status,
  List<Data>? data,
}) => GetOrderModel(  status: status ?? _status,
  data: data ?? _data,
);
  bool? get status => _status;
  List<Data>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// _id : "63a7d3104ec58b8317e57962"
/// customerId : "63a6d6e1e16607bda59d1d97"
/// vendorId : "6366847aa3845e32ee45550f"
/// items : [{"productId":"63677bc41738398e78afdbfe","quantity":2},{"productId":"63677b9b1738398e78afdbfc","quantity":2}]
/// totalPrice : 140000
/// totalItems : 2
/// totalQuantity : 4
/// cancellable : true
/// serviceFee : 0
/// deliveryFee : 0
/// discount : 0
/// couponDiscount : 1000
/// couponCode : "test passed"
/// deliveryLocation : {"type":"Point","coordinates":[77.594566,12.971599],"address":"moshi moshi 5th floor","addressType":"office"}
/// paymentStatus : "not paid"
/// paymentMethod : "cash"
/// totalAmount : 139000
/// status : ["order placed","completed"]
/// completedAt : null
/// rating : 4
/// isDeleted : false
/// createdAt : "2022-12-25T04:35:28.760Z"
/// updatedAt : "2022-12-25T07:41:58.749Z"
/// __v : 0

class Data {
  Data({
      String? id, 
      String? customerId, 
      String? vendorId, 
      List<Items>? items, 
      num? totalPrice, 
      num? totalItems, 
      num? totalQuantity, 
      bool? cancellable, 
      num? serviceFee, 
      num? deliveryFee, 
      num? discount, 
      num? couponDiscount, 
      String? couponCode, 
      DeliveryLocation? deliveryLocation, 
      String? paymentStatus, 
      String? paymentMethod, 
      num? totalAmount, 
      List<String>? status, 
      dynamic completedAt, 
      num? rating, 
      bool? isDeleted, 
      String? createdAt, 
      String? updatedAt, 
      num? v,}){
    _id = id;
    _customerId = customerId;
    _vendorId = vendorId;
    _items = items;
    _totalPrice = totalPrice;
    _totalItems = totalItems;
    _totalQuantity = totalQuantity;
    _cancellable = cancellable;
    _serviceFee = serviceFee;
    _deliveryFee = deliveryFee;
    _discount = discount;
    _couponDiscount = couponDiscount;
    _couponCode = couponCode;
    _deliveryLocation = deliveryLocation;
    _paymentStatus = paymentStatus;
    _paymentMethod = paymentMethod;
    _totalAmount = totalAmount;
    _status = status;
    _completedAt = completedAt;
    _rating = rating;
    _isDeleted = isDeleted;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _v = v;
}

  Data.fromJson(dynamic json) {
    _id = json['_id'];
    _customerId = json['customerId'];
    _vendorId = json['vendorId'];
    if (json['items'] != null) {
      _items = [];
      json['items'].forEach((v) {
        _items?.add(Items.fromJson(v));
      });
    }
    _totalPrice = json['totalPrice'];
    _totalItems = json['totalItems'];
    _totalQuantity = json['totalQuantity'];
    _cancellable = json['cancellable'];
    _serviceFee = json['serviceFee'];
    _deliveryFee = json['deliveryFee'];
    _discount = json['discount'];
    _couponDiscount = json['couponDiscount'];
    _couponCode = json['couponCode'];
    _deliveryLocation = json['deliveryLocation'] != null ? DeliveryLocation.fromJson(json['deliveryLocation']) : null;
    _paymentStatus = json['paymentStatus'];
    _paymentMethod = json['paymentMethod'];
    _totalAmount = json['totalAmount'];
    _status = json['status'] != null ? json['status'].cast<String>() : [];
    _completedAt = json['completedAt'];
    _rating = json['rating'];
    _isDeleted = json['isDeleted'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
    _v = json['__v'];
  }
  String? _id;
  String? _customerId;
  String? _vendorId;
  List<Items>? _items;
  num? _totalPrice;
  num? _totalItems;
  num? _totalQuantity;
  bool? _cancellable;
  num? _serviceFee;
  num? _deliveryFee;
  num? _discount;
  num? _couponDiscount;
  String? _couponCode;
  DeliveryLocation? _deliveryLocation;
  String? _paymentStatus;
  String? _paymentMethod;
  num? _totalAmount;
  List<String>? _status;
  dynamic _completedAt;
  num? _rating;
  bool? _isDeleted;
  String? _createdAt;
  String? _updatedAt;
  num? _v;
Data copyWith({  String? id,
  String? customerId,
  String? vendorId,
  List<Items>? items,
  num? totalPrice,
  num? totalItems,
  num? totalQuantity,
  bool? cancellable,
  num? serviceFee,
  num? deliveryFee,
  num? discount,
  num? couponDiscount,
  String? couponCode,
  DeliveryLocation? deliveryLocation,
  String? paymentStatus,
  String? paymentMethod,
  num? totalAmount,
  List<String>? status,
  dynamic completedAt,
  num? rating,
  bool? isDeleted,
  String? createdAt,
  String? updatedAt,
  num? v,
}) => Data(  id: id ?? _id,
  customerId: customerId ?? _customerId,
  vendorId: vendorId ?? _vendorId,
  items: items ?? _items,
  totalPrice: totalPrice ?? _totalPrice,
  totalItems: totalItems ?? _totalItems,
  totalQuantity: totalQuantity ?? _totalQuantity,
  cancellable: cancellable ?? _cancellable,
  serviceFee: serviceFee ?? _serviceFee,
  deliveryFee: deliveryFee ?? _deliveryFee,
  discount: discount ?? _discount,
  couponDiscount: couponDiscount ?? _couponDiscount,
  couponCode: couponCode ?? _couponCode,
  deliveryLocation: deliveryLocation ?? _deliveryLocation,
  paymentStatus: paymentStatus ?? _paymentStatus,
  paymentMethod: paymentMethod ?? _paymentMethod,
  totalAmount: totalAmount ?? _totalAmount,
  status: status ?? _status,
  completedAt: completedAt ?? _completedAt,
  rating: rating ?? _rating,
  isDeleted: isDeleted ?? _isDeleted,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  v: v ?? _v,
);
  String? get id => _id;
  String? get customerId => _customerId;
  String? get vendorId => _vendorId;
  List<Items>? get items => _items;
  num? get totalPrice => _totalPrice;
  num? get totalItems => _totalItems;
  num? get totalQuantity => _totalQuantity;
  bool? get cancellable => _cancellable;
  num? get serviceFee => _serviceFee;
  num? get deliveryFee => _deliveryFee;
  num? get discount => _discount;
  num? get couponDiscount => _couponDiscount;
  String? get couponCode => _couponCode;
  DeliveryLocation? get deliveryLocation => _deliveryLocation;
  String? get paymentStatus => _paymentStatus;
  String? get paymentMethod => _paymentMethod;
  num? get totalAmount => _totalAmount;
  List<String>? get status => _status;
  dynamic get completedAt => _completedAt;
  num? get rating => _rating;
  bool? get isDeleted => _isDeleted;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  num? get v => _v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    map['customerId'] = _customerId;
    map['vendorId'] = _vendorId;
    if (_items != null) {
      map['items'] = _items?.map((v) => v.toJson()).toList();
    }
    map['totalPrice'] = _totalPrice;
    map['totalItems'] = _totalItems;
    map['totalQuantity'] = _totalQuantity;
    map['cancellable'] = _cancellable;
    map['serviceFee'] = _serviceFee;
    map['deliveryFee'] = _deliveryFee;
    map['discount'] = _discount;
    map['couponDiscount'] = _couponDiscount;
    map['couponCode'] = _couponCode;
    if (_deliveryLocation != null) {
      map['deliveryLocation'] = _deliveryLocation?.toJson();
    }
    map['paymentStatus'] = _paymentStatus;
    map['paymentMethod'] = _paymentMethod;
    map['totalAmount'] = _totalAmount;
    map['status'] = _status;
    map['completedAt'] = _completedAt;
    map['rating'] = _rating;
    map['isDeleted'] = _isDeleted;
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    map['__v'] = _v;
    return map;
  }

}

/// type : "Point"
/// coordinates : [77.594566,12.971599]
/// address : "moshi moshi 5th floor"
/// addressType : "office"

class DeliveryLocation {
  DeliveryLocation({
      String? type, 
      List<num>? coordinates, 
      String? address, 
      String? addressType,}){
    _type = type;
    _coordinates = coordinates;
    _address = address;
    _addressType = addressType;
}

  DeliveryLocation.fromJson(dynamic json) {
    _type = json['type'];
    _coordinates = json['coordinates'] != null ? json['coordinates'].cast<num>() : [];
    _address = json['address'];
    _addressType = json['addressType'];
  }
  String? _type;
  List<num>? _coordinates;
  String? _address;
  String? _addressType;
DeliveryLocation copyWith({  String? type,
  List<num>? coordinates,
  String? address,
  String? addressType,
}) => DeliveryLocation(  type: type ?? _type,
  coordinates: coordinates ?? _coordinates,
  address: address ?? _address,
  addressType: addressType ?? _addressType,
);
  String? get type => _type;
  List<num>? get coordinates => _coordinates;
  String? get address => _address;
  String? get addressType => _addressType;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['type'] = _type;
    map['coordinates'] = _coordinates;
    map['address'] = _address;
    map['addressType'] = _addressType;
    return map;
  }

}

/// productId : "63677bc41738398e78afdbfe"
/// quantity : 2

class Items {
  Items({
      String? productId, 
      num? quantity,}){
    _productId = productId;
    _quantity = quantity;
}

  Items.fromJson(dynamic json) {
    _productId = json['productId'];
    _quantity = json['quantity'];
  }
  String? _productId;
  num? _quantity;
Items copyWith({  String? productId,
  num? quantity,
}) => Items(  productId: productId ?? _productId,
  quantity: quantity ?? _quantity,
);
  String? get productId => _productId;
  num? get quantity => _quantity;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['productId'] = _productId;
    map['quantity'] = _quantity;
    return map;
  }

}