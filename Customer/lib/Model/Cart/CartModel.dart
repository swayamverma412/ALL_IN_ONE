/// status : true
/// message : "Cart details"
/// data : [{"_id":"63a70598400f08f9eab66a28","customerId":"63a6d6e1e16607bda59d1d97","vendorId":"6366847aa3845e32ee45550f","items":[{"productId":"63677b9b1738398e78afdbfc","quantity":3},{"productId":"63677bc41738398e78afdbfe","quantity":3}],"totalPrice":210000,"totalItems":2,"serviceFee":0,"deliveryFee":0,"discount":0,"couponDiscount":0,"couponCode":null,"createdAt":"2022-12-24T13:58:48.093Z","updatedAt":"2022-12-24T14:18:31.403Z","__v":2,"vendor":{"_id":"6366847aa3845e32ee45550f","vendorName":"Deepak","businessName":"dg store","number":9352117168,"referredBy":"none","age":26,"pincode":342055,"cityState":"jodhpur, rajasthan","typeOfStore":"sports store","gstNo":"654987321586test","aadharFront":"https://res.cloudinary.com/dz55xewlb/image/upload/v1667662956/vendorDocs/ip5jucweirby9cjdrfii.jpg","aadharBack":"https://res.cloudinary.com/dz55xewlb/image/upload/v1667662961/vendorDocs/dmonzl5vvxiqxyiqyxxs.jpg","voter":"https://res.cloudinary.com/dz55xewlb/image/upload/v1667662963/vendorDocs/mubgfwoimzfo9bpocqdn.jpg","gst":"https://res.cloudinary.com/dz55xewlb/image/upload/v1667662955/vendorDocs/exrecwgsqxegwppgww0q.jpg","shopDocs":"https://res.cloudinary.com/dz55xewlb/image/upload/v1667662965/vendorDocs/cfcycqrj8qgti69xsnke.jpg","vendorPicture":"https://res.cloudinary.com/dz55xewlb/image/upload/v1667662967/vendorDocs/uvyoykdeymj1h4ybvpyw.jpg","shopPicture":"https://res.cloudinary.com/dz55xewlb/image/upload/v1667662969/vendorDocs/odd16t9ycglthqchlxdd.jpg","shopAddress":"jodhpur","shopAge":25,"shopTiming":"10am-6pm","deliveryMode":"Pick up","googleMapsLocation":{"coordinates":[73.008957,26.263863],"type":"Point"},"socials":{"instagram":"/deepak.gunpal","facebook":"/gunpal.deepak"},"password":"$2b$10$rzmYFH/BSj.jkjgg38KrWOwH7i3zpzmKleM6WJoLdfoXYwSsy7ty2","status":"Activated","deletedAt":null,"isDeleted":false,"createdAt":"2022-11-05T15:42:50.643Z","updatedAt":"2022-12-18T14:15:59.295Z","__v":0},"products":[{"_id":"63677b9b1738398e78afdbfc","vendorId":"6366847aa3845e32ee45550f","title":"samsung m02","price":10000,"quantity":48,"productImage":"https://res.cloudinary.com/dz55xewlb/image/upload/v1667726233/product_images/v3yg84wxyz0wga0yxcpi.jpg","category":"tech","subCategory":"phone","status":"Activated","location":{"type":"Point","coordinates":[73.008957,26.263863]},"deletedAt":null,"isDeleted":false,"createdAt":"2022-11-06T09:17:15.618Z","updatedAt":"2022-11-26T18:08:57.807Z","__v":0,"sold":6},{"_id":"63677bc41738398e78afdbfe","vendorId":"6366847aa3845e32ee45550f","title":"tab s7","price":60000,"quantity":14,"productImage":"https://res.cloudinary.com/dz55xewlb/image/upload/v1667726274/product_images/aikmxrtsgfc9nqm3ndo6.jpg","category":"tech","subCategory":"tab","status":"Activated","location":{"type":"Point","coordinates":[73.008957,26.263863]},"deletedAt":null,"isDeleted":false,"createdAt":"2022-11-06T09:17:56.499Z","updatedAt":"2022-11-26T18:08:57.911Z","__v":0,"sold":8}]}]

class CartModel {
  CartModel({
      bool? status, 
      String? message, 
      List<Data>? data,}){
    _status = status;
    _message = message;
    _data = data;
}

  CartModel.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
  }
  bool? _status;
  String? _message;
  List<Data>? _data;
CartModel copyWith({  bool? status,
  String? message,
  List<Data>? data,
}) => CartModel(  status: status ?? _status,
  message: message ?? _message,
  data: data ?? _data,
);
  bool? get status => _status;
  String? get message => _message;
  List<Data>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// _id : "63a70598400f08f9eab66a28"
/// customerId : "63a6d6e1e16607bda59d1d97"
/// vendorId : "6366847aa3845e32ee45550f"
/// items : [{"productId":"63677b9b1738398e78afdbfc","quantity":3},{"productId":"63677bc41738398e78afdbfe","quantity":3}]
/// totalPrice : 210000
/// totalItems : 2
/// serviceFee : 0
/// deliveryFee : 0
/// discount : 0
/// couponDiscount : 0
/// couponCode : null
/// createdAt : "2022-12-24T13:58:48.093Z"
/// updatedAt : "2022-12-24T14:18:31.403Z"
/// __v : 2
/// vendor : {"_id":"6366847aa3845e32ee45550f","vendorName":"Deepak","businessName":"dg store","number":9352117168,"referredBy":"none","age":26,"pincode":342055,"cityState":"jodhpur, rajasthan","typeOfStore":"sports store","gstNo":"654987321586test","aadharFront":"https://res.cloudinary.com/dz55xewlb/image/upload/v1667662956/vendorDocs/ip5jucweirby9cjdrfii.jpg","aadharBack":"https://res.cloudinary.com/dz55xewlb/image/upload/v1667662961/vendorDocs/dmonzl5vvxiqxyiqyxxs.jpg","voter":"https://res.cloudinary.com/dz55xewlb/image/upload/v1667662963/vendorDocs/mubgfwoimzfo9bpocqdn.jpg","gst":"https://res.cloudinary.com/dz55xewlb/image/upload/v1667662955/vendorDocs/exrecwgsqxegwppgww0q.jpg","shopDocs":"https://res.cloudinary.com/dz55xewlb/image/upload/v1667662965/vendorDocs/cfcycqrj8qgti69xsnke.jpg","vendorPicture":"https://res.cloudinary.com/dz55xewlb/image/upload/v1667662967/vendorDocs/uvyoykdeymj1h4ybvpyw.jpg","shopPicture":"https://res.cloudinary.com/dz55xewlb/image/upload/v1667662969/vendorDocs/odd16t9ycglthqchlxdd.jpg","shopAddress":"jodhpur","shopAge":25,"shopTiming":"10am-6pm","deliveryMode":"Pick up","googleMapsLocation":{"coordinates":[73.008957,26.263863],"type":"Point"},"socials":{"instagram":"/deepak.gunpal","facebook":"/gunpal.deepak"},"password":"$2b$10$rzmYFH/BSj.jkjgg38KrWOwH7i3zpzmKleM6WJoLdfoXYwSsy7ty2","status":"Activated","deletedAt":null,"isDeleted":false,"createdAt":"2022-11-05T15:42:50.643Z","updatedAt":"2022-12-18T14:15:59.295Z","__v":0}
/// products : [{"_id":"63677b9b1738398e78afdbfc","vendorId":"6366847aa3845e32ee45550f","title":"samsung m02","price":10000,"quantity":48,"productImage":"https://res.cloudinary.com/dz55xewlb/image/upload/v1667726233/product_images/v3yg84wxyz0wga0yxcpi.jpg","category":"tech","subCategory":"phone","status":"Activated","location":{"type":"Point","coordinates":[73.008957,26.263863]},"deletedAt":null,"isDeleted":false,"createdAt":"2022-11-06T09:17:15.618Z","updatedAt":"2022-11-26T18:08:57.807Z","__v":0,"sold":6},{"_id":"63677bc41738398e78afdbfe","vendorId":"6366847aa3845e32ee45550f","title":"tab s7","price":60000,"quantity":14,"productImage":"https://res.cloudinary.com/dz55xewlb/image/upload/v1667726274/product_images/aikmxrtsgfc9nqm3ndo6.jpg","category":"tech","subCategory":"tab","status":"Activated","location":{"type":"Point","coordinates":[73.008957,26.263863]},"deletedAt":null,"isDeleted":false,"createdAt":"2022-11-06T09:17:56.499Z","updatedAt":"2022-11-26T18:08:57.911Z","__v":0,"sold":8}]

class Data {
  Data({
      String? id, 
      String? customerId, 
      String? vendorId, 
      List<Items>? items, 
      num? totalPrice, 
      num? totalItems, 
      num? serviceFee, 
      num? deliveryFee, 
      num? discount, 
      num? couponDiscount, 
      dynamic couponCode, 
      String? createdAt, 
      String? updatedAt, 
      num? v, 
      Vendor? vendor, 
      List<Products>? products,}){
    _id = id;
    _customerId = customerId;
    _vendorId = vendorId;
    _items = items;
    _totalPrice = totalPrice;
    _totalItems = totalItems;
    _serviceFee = serviceFee;
    _deliveryFee = deliveryFee;
    _discount = discount;
    _couponDiscount = couponDiscount;
    _couponCode = couponCode;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _v = v;
    _vendor = vendor;
    _products = products;
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
    _serviceFee = json['serviceFee'];
    _deliveryFee = json['deliveryFee'];
    _discount = json['discount'];
    _couponDiscount = json['couponDiscount'];
    _couponCode = json['couponCode'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
    _v = json['__v'];
    _vendor = json['vendor'] != null ? Vendor.fromJson(json['vendor']) : null;
    if (json['products'] != null) {
      _products = [];
      json['products'].forEach((v) {
        _products?.add(Products.fromJson(v));
      });
    }
  }
  String? _id;
  String? _customerId;
  String? _vendorId;
  List<Items>? _items;
  num? _totalPrice;
  num? _totalItems;
  num? _serviceFee;
  num? _deliveryFee;
  num? _discount;
  num? _couponDiscount;
  dynamic _couponCode;
  String? _createdAt;
  String? _updatedAt;
  num? _v;
  Vendor? _vendor;
  List<Products>? _products;
Data copyWith({  String? id,
  String? customerId,
  String? vendorId,
  List<Items>? items,
  num? totalPrice,
  num? totalItems,
  num? serviceFee,
  num? deliveryFee,
  num? discount,
  num? couponDiscount,
  dynamic couponCode,
  String? createdAt,
  String? updatedAt,
  num? v,
  Vendor? vendor,
  List<Products>? products,
}) => Data(  id: id ?? _id,
  customerId: customerId ?? _customerId,
  vendorId: vendorId ?? _vendorId,
  items: items ?? _items,
  totalPrice: totalPrice ?? _totalPrice,
  totalItems: totalItems ?? _totalItems,
  serviceFee: serviceFee ?? _serviceFee,
  deliveryFee: deliveryFee ?? _deliveryFee,
  discount: discount ?? _discount,
  couponDiscount: couponDiscount ?? _couponDiscount,
  couponCode: couponCode ?? _couponCode,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  v: v ?? _v,
  vendor: vendor ?? _vendor,
  products: products ?? _products,
);
  String? get id => _id;
  String? get customerId => _customerId;
  String? get vendorId => _vendorId;
  List<Items>? get items => _items;
  num? get totalPrice => _totalPrice;
  num? get totalItems => _totalItems;
  num? get serviceFee => _serviceFee;
  num? get deliveryFee => _deliveryFee;
  num? get discount => _discount;
  num? get couponDiscount => _couponDiscount;
  dynamic get couponCode => _couponCode;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  num? get v => _v;
  Vendor? get vendor => _vendor;
  List<Products>? get products => _products;

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
    map['serviceFee'] = _serviceFee;
    map['deliveryFee'] = _deliveryFee;
    map['discount'] = _discount;
    map['couponDiscount'] = _couponDiscount;
    map['couponCode'] = _couponCode;
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    map['__v'] = _v;
    if (_vendor != null) {
      map['vendor'] = _vendor?.toJson();
    }
    if (_products != null) {
      map['products'] = _products?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// _id : "63677b9b1738398e78afdbfc"
/// vendorId : "6366847aa3845e32ee45550f"
/// title : "samsung m02"
/// price : 10000
/// quantity : 48
/// productImage : "https://res.cloudinary.com/dz55xewlb/image/upload/v1667726233/product_images/v3yg84wxyz0wga0yxcpi.jpg"
/// category : "tech"
/// subCategory : "phone"
/// status : "Activated"
/// location : {"type":"Point","coordinates":[73.008957,26.263863]}
/// deletedAt : null
/// isDeleted : false
/// createdAt : "2022-11-06T09:17:15.618Z"
/// updatedAt : "2022-11-26T18:08:57.807Z"
/// __v : 0
/// sold : 6

class Products {
  Products({
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

  Products.fromJson(dynamic json) {
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
Products copyWith({  String? id,
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
}) => Products(  id: id ?? _id,
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

/// _id : "6366847aa3845e32ee45550f"
/// vendorName : "Deepak"
/// businessName : "dg store"
/// number : 9352117168
/// referredBy : "none"
/// age : 26
/// pincode : 342055
/// cityState : "jodhpur, rajasthan"
/// typeOfStore : "sports store"
/// gstNo : "654987321586test"
/// aadharFront : "https://res.cloudinary.com/dz55xewlb/image/upload/v1667662956/vendorDocs/ip5jucweirby9cjdrfii.jpg"
/// aadharBack : "https://res.cloudinary.com/dz55xewlb/image/upload/v1667662961/vendorDocs/dmonzl5vvxiqxyiqyxxs.jpg"
/// voter : "https://res.cloudinary.com/dz55xewlb/image/upload/v1667662963/vendorDocs/mubgfwoimzfo9bpocqdn.jpg"
/// gst : "https://res.cloudinary.com/dz55xewlb/image/upload/v1667662955/vendorDocs/exrecwgsqxegwppgww0q.jpg"
/// shopDocs : "https://res.cloudinary.com/dz55xewlb/image/upload/v1667662965/vendorDocs/cfcycqrj8qgti69xsnke.jpg"
/// vendorPicture : "https://res.cloudinary.com/dz55xewlb/image/upload/v1667662967/vendorDocs/uvyoykdeymj1h4ybvpyw.jpg"
/// shopPicture : "https://res.cloudinary.com/dz55xewlb/image/upload/v1667662969/vendorDocs/odd16t9ycglthqchlxdd.jpg"
/// shopAddress : "jodhpur"
/// shopAge : 25
/// shopTiming : "10am-6pm"
/// deliveryMode : "Pick up"
/// googleMapsLocation : {"coordinates":[73.008957,26.263863],"type":"Point"}
/// socials : {"instagram":"/deepak.gunpal","facebook":"/gunpal.deepak"}
/// password : "$2b$10$rzmYFH/BSj.jkjgg38KrWOwH7i3zpzmKleM6WJoLdfoXYwSsy7ty2"
/// status : "Activated"
/// deletedAt : null
/// isDeleted : false
/// createdAt : "2022-11-05T15:42:50.643Z"
/// updatedAt : "2022-12-18T14:15:59.295Z"
/// __v : 0

class Vendor {
  Vendor({
      String? id, 
      String? vendorName, 
      String? businessName, 
      num? number, 
      String? referredBy, 
      num? age, 
      num? pincode, 
      String? cityState, 
      String? typeOfStore, 
      String? gstNo, 
      String? aadharFront, 
      String? aadharBack, 
      String? voter, 
      String? gst, 
      String? shopDocs, 
      String? vendorPicture, 
      String? shopPicture, 
      String? shopAddress, 
      num? shopAge, 
      String? shopTiming, 
      String? deliveryMode, 
      GoogleMapsLocation? googleMapsLocation, 
      Socials? socials, 
      String? password, 
      String? status, 
      dynamic deletedAt, 
      bool? isDeleted, 
      String? createdAt, 
      String? updatedAt, 
      num? v,}){
    _id = id;
    _vendorName = vendorName;
    _businessName = businessName;
    _number = number;
    _referredBy = referredBy;
    _age = age;
    _pincode = pincode;
    _cityState = cityState;
    _typeOfStore = typeOfStore;
    _gstNo = gstNo;
    _aadharFront = aadharFront;
    _aadharBack = aadharBack;
    _voter = voter;
    _gst = gst;
    _shopDocs = shopDocs;
    _vendorPicture = vendorPicture;
    _shopPicture = shopPicture;
    _shopAddress = shopAddress;
    _shopAge = shopAge;
    _shopTiming = shopTiming;
    _deliveryMode = deliveryMode;
    _googleMapsLocation = googleMapsLocation;
    _socials = socials;
    _password = password;
    _status = status;
    _deletedAt = deletedAt;
    _isDeleted = isDeleted;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _v = v;
}

  Vendor.fromJson(dynamic json) {
    _id = json['_id'];
    _vendorName = json['vendorName'];
    _businessName = json['businessName'];
    _number = json['number'];
    _referredBy = json['referredBy'];
    _age = json['age'];
    _pincode = json['pincode'];
    _cityState = json['cityState'];
    _typeOfStore = json['typeOfStore'];
    _gstNo = json['gstNo'];
    _aadharFront = json['aadharFront'];
    _aadharBack = json['aadharBack'];
    _voter = json['voter'];
    _gst = json['gst'];
    _shopDocs = json['shopDocs'];
    _vendorPicture = json['vendorPicture'];
    _shopPicture = json['shopPicture'];
    _shopAddress = json['shopAddress'];
    _shopAge = json['shopAge'];
    _shopTiming = json['shopTiming'];
    _deliveryMode = json['deliveryMode'];
    _googleMapsLocation = json['googleMapsLocation'] != null ? GoogleMapsLocation.fromJson(json['googleMapsLocation']) : null;
    _socials = json['socials'] != null ? Socials.fromJson(json['socials']) : null;
    _password = json['password'];
    _status = json['status'];
    _deletedAt = json['deletedAt'];
    _isDeleted = json['isDeleted'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
    _v = json['__v'];
  }
  String? _id;
  String? _vendorName;
  String? _businessName;
  num? _number;
  String? _referredBy;
  num? _age;
  num? _pincode;
  String? _cityState;
  String? _typeOfStore;
  String? _gstNo;
  String? _aadharFront;
  String? _aadharBack;
  String? _voter;
  String? _gst;
  String? _shopDocs;
  String? _vendorPicture;
  String? _shopPicture;
  String? _shopAddress;
  num? _shopAge;
  String? _shopTiming;
  String? _deliveryMode;
  GoogleMapsLocation? _googleMapsLocation;
  Socials? _socials;
  String? _password;
  String? _status;
  dynamic _deletedAt;
  bool? _isDeleted;
  String? _createdAt;
  String? _updatedAt;
  num? _v;
Vendor copyWith({  String? id,
  String? vendorName,
  String? businessName,
  num? number,
  String? referredBy,
  num? age,
  num? pincode,
  String? cityState,
  String? typeOfStore,
  String? gstNo,
  String? aadharFront,
  String? aadharBack,
  String? voter,
  String? gst,
  String? shopDocs,
  String? vendorPicture,
  String? shopPicture,
  String? shopAddress,
  num? shopAge,
  String? shopTiming,
  String? deliveryMode,
  GoogleMapsLocation? googleMapsLocation,
  Socials? socials,
  String? password,
  String? status,
  dynamic deletedAt,
  bool? isDeleted,
  String? createdAt,
  String? updatedAt,
  num? v,
}) => Vendor(  id: id ?? _id,
  vendorName: vendorName ?? _vendorName,
  businessName: businessName ?? _businessName,
  number: number ?? _number,
  referredBy: referredBy ?? _referredBy,
  age: age ?? _age,
  pincode: pincode ?? _pincode,
  cityState: cityState ?? _cityState,
  typeOfStore: typeOfStore ?? _typeOfStore,
  gstNo: gstNo ?? _gstNo,
  aadharFront: aadharFront ?? _aadharFront,
  aadharBack: aadharBack ?? _aadharBack,
  voter: voter ?? _voter,
  gst: gst ?? _gst,
  shopDocs: shopDocs ?? _shopDocs,
  vendorPicture: vendorPicture ?? _vendorPicture,
  shopPicture: shopPicture ?? _shopPicture,
  shopAddress: shopAddress ?? _shopAddress,
  shopAge: shopAge ?? _shopAge,
  shopTiming: shopTiming ?? _shopTiming,
  deliveryMode: deliveryMode ?? _deliveryMode,
  googleMapsLocation: googleMapsLocation ?? _googleMapsLocation,
  socials: socials ?? _socials,
  password: password ?? _password,
  status: status ?? _status,
  deletedAt: deletedAt ?? _deletedAt,
  isDeleted: isDeleted ?? _isDeleted,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  v: v ?? _v,
);
  String? get id => _id;
  String? get vendorName => _vendorName;
  String? get businessName => _businessName;
  num? get number => _number;
  String? get referredBy => _referredBy;
  num? get age => _age;
  num? get pincode => _pincode;
  String? get cityState => _cityState;
  String? get typeOfStore => _typeOfStore;
  String? get gstNo => _gstNo;
  String? get aadharFront => _aadharFront;
  String? get aadharBack => _aadharBack;
  String? get voter => _voter;
  String? get gst => _gst;
  String? get shopDocs => _shopDocs;
  String? get vendorPicture => _vendorPicture;
  String? get shopPicture => _shopPicture;
  String? get shopAddress => _shopAddress;
  num? get shopAge => _shopAge;
  String? get shopTiming => _shopTiming;
  String? get deliveryMode => _deliveryMode;
  GoogleMapsLocation? get googleMapsLocation => _googleMapsLocation;
  Socials? get socials => _socials;
  String? get password => _password;
  String? get status => _status;
  dynamic get deletedAt => _deletedAt;
  bool? get isDeleted => _isDeleted;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  num? get v => _v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    map['vendorName'] = _vendorName;
    map['businessName'] = _businessName;
    map['number'] = _number;
    map['referredBy'] = _referredBy;
    map['age'] = _age;
    map['pincode'] = _pincode;
    map['cityState'] = _cityState;
    map['typeOfStore'] = _typeOfStore;
    map['gstNo'] = _gstNo;
    map['aadharFront'] = _aadharFront;
    map['aadharBack'] = _aadharBack;
    map['voter'] = _voter;
    map['gst'] = _gst;
    map['shopDocs'] = _shopDocs;
    map['vendorPicture'] = _vendorPicture;
    map['shopPicture'] = _shopPicture;
    map['shopAddress'] = _shopAddress;
    map['shopAge'] = _shopAge;
    map['shopTiming'] = _shopTiming;
    map['deliveryMode'] = _deliveryMode;
    if (_googleMapsLocation != null) {
      map['googleMapsLocation'] = _googleMapsLocation?.toJson();
    }
    if (_socials != null) {
      map['socials'] = _socials?.toJson();
    }
    map['password'] = _password;
    map['status'] = _status;
    map['deletedAt'] = _deletedAt;
    map['isDeleted'] = _isDeleted;
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    map['__v'] = _v;
    return map;
  }

}

/// instagram : "/deepak.gunpal"
/// facebook : "/gunpal.deepak"

class Socials {
  Socials({
      String? instagram, 
      String? facebook,}){
    _instagram = instagram;
    _facebook = facebook;
}

  Socials.fromJson(dynamic json) {
    _instagram = json['instagram'];
    _facebook = json['facebook'];
  }
  String? _instagram;
  String? _facebook;
Socials copyWith({  String? instagram,
  String? facebook,
}) => Socials(  instagram: instagram ?? _instagram,
  facebook: facebook ?? _facebook,
);
  String? get instagram => _instagram;
  String? get facebook => _facebook;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['instagram'] = _instagram;
    map['facebook'] = _facebook;
    return map;
  }

}

/// coordinates : [73.008957,26.263863]
/// type : "Point"

class GoogleMapsLocation {
  GoogleMapsLocation({
      List<num>? coordinates, 
      String? type,}){
    _coordinates = coordinates;
    _type = type;
}

  GoogleMapsLocation.fromJson(dynamic json) {
    _coordinates = json['coordinates'] != null ? json['coordinates'].cast<num>() : [];
    _type = json['type'];
  }
  List<num>? _coordinates;
  String? _type;
GoogleMapsLocation copyWith({  List<num>? coordinates,
  String? type,
}) => GoogleMapsLocation(  coordinates: coordinates ?? _coordinates,
  type: type ?? _type,
);
  List<num>? get coordinates => _coordinates;
  String? get type => _type;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['coordinates'] = _coordinates;
    map['type'] = _type;
    return map;
  }

}

/// productId : "63677b9b1738398e78afdbfc"
/// quantity : 3

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