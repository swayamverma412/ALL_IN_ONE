/// status : true
/// count : 2
/// data : [{"_id":"63677bdb1738398e78afdc00","vendorId":"6366870aa3845e32ee45551b","title":"ipad pro","price":95000,"quantity":5,"productImage":"https://res.cloudinary.com/dz55xewlb/image/upload/v1667726297/product_images/taedcomjugurqci7ym38.jpg","category":"tech","subCategory":"tab","status":"Requested","location":{"type":"Point","coordinates":[77.026344,28.457523]},"deletedAt":null,"isDeleted":false,"createdAt":"2022-11-06T09:18:19.555Z","updatedAt":"2022-11-06T09:18:19.555Z","__v":0,"dist":{"calculated":210.55462548192926},"vendorDetails":[{"_id":"6366870aa3845e32ee45551b","vendorName":"megha","businessName":"megha store","number":9856472315,"referredBy":null,"age":32,"pincode":415055,"cityState":"gurgaon, haryana","typeOfStore":"makeup store","aadharFront":"https://res.cloudinary.com/dz55xewlb/image/upload/v1667663617/vendorDocs/tztfhrqupgmqltvlhbig.jpg","aadharBack":"https://res.cloudinary.com/dz55xewlb/image/upload/v1667663619/vendorDocs/xrcoflidin220mxrg5aq.jpg","gst":"https://res.cloudinary.com/dz55xewlb/image/upload/v1667663616/vendorDocs/nzjg7pgw6tz4nwebcanp.jpg","vendorPicture":"https://res.cloudinary.com/dz55xewlb/image/upload/v1667663621/vendorDocs/c6wixlqbmrac3fhhqakx.jpg","shopPicture":"https://res.cloudinary.com/dz55xewlb/image/upload/v1667663625/vendorDocs/cjyxseb86zjlo5o7mzna.jpg","shopAddress":"gurgaon","shopAge":3,"shopTiming":"10am-6pm","deliveryMode":"Pick up","googleMapsLocation":{"coordinates":[77.026344,28.457523],"type":"Point"},"socials":{"instagram":"/megha.gunpal","facebook":"/gunpal.megha"},"password":"$2b$10$NZnmleohiAfBGhDxzObCo.23q8S77WSuE2z8wYMHbdaiAw5T0RLm6","status":"Activated","deletedAt":null,"isDeleted":false,"createdAt":"2022-11-05T15:53:46.800Z","updatedAt":"2022-11-05T15:53:46.800Z","__v":0}]},{"_id":"63677bc41738398e78afdbfe","vendorId":"6366847aa3845e32ee45550f","title":"tab s7","price":60000,"quantity":14,"productImage":"https://res.cloudinary.com/dz55xewlb/image/upload/v1667726274/product_images/aikmxrtsgfc9nqm3ndo6.jpg","category":"tech","subCategory":"tab","status":"Activated","location":{"type":"Point","coordinates":[73.008957,26.263863]},"deletedAt":null,"isDeleted":false,"createdAt":"2022-11-06T09:17:56.499Z","updatedAt":"2022-11-26T18:08:57.911Z","__v":0,"sold":8,"dist":{"calculated":285.2867244561105},"vendorDetails":[{"_id":"6366847aa3845e32ee45550f","vendorName":"Deepak","businessName":"dg store","number":9352117168,"referredBy":null,"age":26,"pincode":342055,"cityState":"jodhpur, rajasthan","typeOfStore":"sports store","gstNo":"654987321586test","aadharFront":"https://res.cloudinary.com/dz55xewlb/image/upload/v1667662956/vendorDocs/ip5jucweirby9cjdrfii.jpg","aadharBack":"https://res.cloudinary.com/dz55xewlb/image/upload/v1667662961/vendorDocs/dmonzl5vvxiqxyiqyxxs.jpg","voter":"https://res.cloudinary.com/dz55xewlb/image/upload/v1667662963/vendorDocs/mubgfwoimzfo9bpocqdn.jpg","gst":"https://res.cloudinary.com/dz55xewlb/image/upload/v1667662955/vendorDocs/exrecwgsqxegwppgww0q.jpg","shopDocs":"https://res.cloudinary.com/dz55xewlb/image/upload/v1667662965/vendorDocs/cfcycqrj8qgti69xsnke.jpg","vendorPicture":"https://res.cloudinary.com/dz55xewlb/image/upload/v1667662967/vendorDocs/uvyoykdeymj1h4ybvpyw.jpg","shopPicture":"https://res.cloudinary.com/dz55xewlb/image/upload/v1667662969/vendorDocs/odd16t9ycglthqchlxdd.jpg","shopAddress":"jodhpur","shopAge":25,"shopTiming":"10am-6pm","deliveryMode":"Pick up","googleMapsLocation":{"coordinates":[73.008957,26.263863],"type":"Point"},"socials":{"instagram":"/deepak.gunpal","facebook":"/gunpal.deepak"},"password":"$2b$10$rzmYFH/BSj.jkjgg38KrWOwH7i3zpzmKleM6WJoLdfoXYwSsy7ty2","status":"Activated","deletedAt":null,"isDeleted":false,"createdAt":"2022-11-05T15:42:50.643Z","updatedAt":"2022-11-17T10:00:05.573Z","__v":0}]}]

class NerabySub {
  NerabySub({
      bool? status, 
      num? count, 
      List<Data>? data,}){
    _status = status;
    _count = count;
    _data = data;
}

  NerabySub.fromJson(dynamic json) {
    _status = json['status'];
    _count = json['count'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
  }
  bool? _status;
  num? _count;
  List<Data>? _data;
NerabySub copyWith({  bool? status,
  num? count,
  List<Data>? data,
}) => NerabySub(  status: status ?? _status,
  count: count ?? _count,
  data: data ?? _data,
);
  bool? get status => _status;
  num? get count => _count;
  List<Data>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['count'] = _count;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// _id : "63677bdb1738398e78afdc00"
/// vendorId : "6366870aa3845e32ee45551b"
/// title : "ipad pro"
/// price : 95000
/// quantity : 5
/// productImage : "https://res.cloudinary.com/dz55xewlb/image/upload/v1667726297/product_images/taedcomjugurqci7ym38.jpg"
/// category : "tech"
/// subCategory : "tab"
/// status : "Requested"
/// location : {"type":"Point","coordinates":[77.026344,28.457523]}
/// deletedAt : null
/// isDeleted : false
/// createdAt : "2022-11-06T09:18:19.555Z"
/// updatedAt : "2022-11-06T09:18:19.555Z"
/// __v : 0
/// dist : {"calculated":210.55462548192926}
/// vendorDetails : [{"_id":"6366870aa3845e32ee45551b","vendorName":"megha","businessName":"megha store","number":9856472315,"referredBy":null,"age":32,"pincode":415055,"cityState":"gurgaon, haryana","typeOfStore":"makeup store","aadharFront":"https://res.cloudinary.com/dz55xewlb/image/upload/v1667663617/vendorDocs/tztfhrqupgmqltvlhbig.jpg","aadharBack":"https://res.cloudinary.com/dz55xewlb/image/upload/v1667663619/vendorDocs/xrcoflidin220mxrg5aq.jpg","gst":"https://res.cloudinary.com/dz55xewlb/image/upload/v1667663616/vendorDocs/nzjg7pgw6tz4nwebcanp.jpg","vendorPicture":"https://res.cloudinary.com/dz55xewlb/image/upload/v1667663621/vendorDocs/c6wixlqbmrac3fhhqakx.jpg","shopPicture":"https://res.cloudinary.com/dz55xewlb/image/upload/v1667663625/vendorDocs/cjyxseb86zjlo5o7mzna.jpg","shopAddress":"gurgaon","shopAge":3,"shopTiming":"10am-6pm","deliveryMode":"Pick up","googleMapsLocation":{"coordinates":[77.026344,28.457523],"type":"Point"},"socials":{"instagram":"/megha.gunpal","facebook":"/gunpal.megha"},"password":"$2b$10$NZnmleohiAfBGhDxzObCo.23q8S77WSuE2z8wYMHbdaiAw5T0RLm6","status":"Activated","deletedAt":null,"isDeleted":false,"createdAt":"2022-11-05T15:53:46.800Z","updatedAt":"2022-11-05T15:53:46.800Z","__v":0}]

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
      Location? location, 
      dynamic deletedAt, 
      bool? isDeleted, 
      String? createdAt, 
      String? updatedAt, 
      num? v, 
      Dist? dist, 
      List<VendorDetails>? vendorDetails,}){
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
    _dist = dist;
    _vendorDetails = vendorDetails;
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
    _location = json['location'] != null ? Location.fromJson(json['location']) : null;
    _deletedAt = json['deletedAt'];
    _isDeleted = json['isDeleted'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
    _v = json['__v'];
    _dist = json['dist'] != null ? Dist.fromJson(json['dist']) : null;
    if (json['vendorDetails'] != null) {
      _vendorDetails = [];
      json['vendorDetails'].forEach((v) {
        _vendorDetails?.add(VendorDetails.fromJson(v));
      });
    }
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
  Dist? _dist;
  List<VendorDetails>? _vendorDetails;
Data copyWith({  String? id,
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
  Dist? dist,
  List<VendorDetails>? vendorDetails,
}) => Data(  id: id ?? _id,
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
  dist: dist ?? _dist,
  vendorDetails: vendorDetails ?? _vendorDetails,
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
  Dist? get dist => _dist;
  List<VendorDetails>? get vendorDetails => _vendorDetails;

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
    if (_dist != null) {
      map['dist'] = _dist?.toJson();
    }
    if (_vendorDetails != null) {
      map['vendorDetails'] = _vendorDetails?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// _id : "6366870aa3845e32ee45551b"
/// vendorName : "megha"
/// businessName : "megha store"
/// number : 9856472315
/// referredBy : null
/// age : 32
/// pincode : 415055
/// cityState : "gurgaon, haryana"
/// typeOfStore : "makeup store"
/// aadharFront : "https://res.cloudinary.com/dz55xewlb/image/upload/v1667663617/vendorDocs/tztfhrqupgmqltvlhbig.jpg"
/// aadharBack : "https://res.cloudinary.com/dz55xewlb/image/upload/v1667663619/vendorDocs/xrcoflidin220mxrg5aq.jpg"
/// gst : "https://res.cloudinary.com/dz55xewlb/image/upload/v1667663616/vendorDocs/nzjg7pgw6tz4nwebcanp.jpg"
/// vendorPicture : "https://res.cloudinary.com/dz55xewlb/image/upload/v1667663621/vendorDocs/c6wixlqbmrac3fhhqakx.jpg"
/// shopPicture : "https://res.cloudinary.com/dz55xewlb/image/upload/v1667663625/vendorDocs/cjyxseb86zjlo5o7mzna.jpg"
/// shopAddress : "gurgaon"
/// shopAge : 3
/// shopTiming : "10am-6pm"
/// deliveryMode : "Pick up"
/// googleMapsLocation : {"coordinates":[77.026344,28.457523],"type":"Point"}
/// socials : {"instagram":"/megha.gunpal","facebook":"/gunpal.megha"}
/// password : "$2b$10$NZnmleohiAfBGhDxzObCo.23q8S77WSuE2z8wYMHbdaiAw5T0RLm6"
/// status : "Activated"
/// deletedAt : null
/// isDeleted : false
/// createdAt : "2022-11-05T15:53:46.800Z"
/// updatedAt : "2022-11-05T15:53:46.800Z"
/// __v : 0

class VendorDetails {
  VendorDetails({
      String? id, 
      String? vendorName, 
      String? businessName, 
      num? number, 
      dynamic referredBy, 
      num? age, 
      num? pincode, 
      String? cityState, 
      String? typeOfStore, 
      String? aadharFront, 
      String? aadharBack, 
      String? gst, 
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
    _aadharFront = aadharFront;
    _aadharBack = aadharBack;
    _gst = gst;
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

  VendorDetails.fromJson(dynamic json) {
    _id = json['_id'];
    _vendorName = json['vendorName'];
    _businessName = json['businessName'];
    _number = json['number'];
    _referredBy = json['referredBy'];
    _age = json['age'];
    _pincode = json['pincode'];
    _cityState = json['cityState'];
    _typeOfStore = json['typeOfStore'];
    _aadharFront = json['aadharFront'];
    _aadharBack = json['aadharBack'];
    _gst = json['gst'];
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
  dynamic _referredBy;
  num? _age;
  num? _pincode;
  String? _cityState;
  String? _typeOfStore;
  String? _aadharFront;
  String? _aadharBack;
  String? _gst;
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
VendorDetails copyWith({  String? id,
  String? vendorName,
  String? businessName,
  num? number,
  dynamic referredBy,
  num? age,
  num? pincode,
  String? cityState,
  String? typeOfStore,
  String? aadharFront,
  String? aadharBack,
  String? gst,
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
}) => VendorDetails(  id: id ?? _id,
  vendorName: vendorName ?? _vendorName,
  businessName: businessName ?? _businessName,
  number: number ?? _number,
  referredBy: referredBy ?? _referredBy,
  age: age ?? _age,
  pincode: pincode ?? _pincode,
  cityState: cityState ?? _cityState,
  typeOfStore: typeOfStore ?? _typeOfStore,
  aadharFront: aadharFront ?? _aadharFront,
  aadharBack: aadharBack ?? _aadharBack,
  gst: gst ?? _gst,
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
  dynamic get referredBy => _referredBy;
  num? get age => _age;
  num? get pincode => _pincode;
  String? get cityState => _cityState;
  String? get typeOfStore => _typeOfStore;
  String? get aadharFront => _aadharFront;
  String? get aadharBack => _aadharBack;
  String? get gst => _gst;
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
    map['aadharFront'] = _aadharFront;
    map['aadharBack'] = _aadharBack;
    map['gst'] = _gst;
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

/// instagram : "/megha.gunpal"
/// facebook : "/gunpal.megha"

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

/// coordinates : [77.026344,28.457523]
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

/// calculated : 210.55462548192926

class Dist {
  Dist({
      num? calculated,}){
    _calculated = calculated;
}

  Dist.fromJson(dynamic json) {
    _calculated = json['calculated'];
  }
  num? _calculated;
Dist copyWith({  num? calculated,
}) => Dist(  calculated: calculated ?? _calculated,
);
  num? get calculated => _calculated;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['calculated'] = _calculated;
    return map;
  }

}

/// type : "Point"
/// coordinates : [77.026344,28.457523]

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