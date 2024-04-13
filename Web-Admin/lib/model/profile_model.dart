/// status : true
/// data : {"googleMapsLocation":{"coordinates":[73.008957,26.263863],"type":"Point"},"socials":{"instagram":"/deepak.gunpal","facebook":"/gunpal.deepak"},"_id":"6366847aa3845e32ee45550f","vendorName":"Deepak","businessName":"dg store","number":9352117168,"referredBy":"none","age":26,"pincode":342055,"cityState":"jodhpur, rajasthan","typeOfStore":"sports store","gstNo":"654987321586test","aadharFront":"https://res.cloudinary.com/dz55xewlb/image/upload/v1667662956/vendorDocs/ip5jucweirby9cjdrfii.jpg","aadharBack":"https://res.cloudinary.com/dz55xewlb/image/upload/v1667662961/vendorDocs/dmonzl5vvxiqxyiqyxxs.jpg","voter":"https://res.cloudinary.com/dz55xewlb/image/upload/v1667662963/vendorDocs/mubgfwoimzfo9bpocqdn.jpg","gst":"https://res.cloudinary.com/dz55xewlb/image/upload/v1667662955/vendorDocs/exrecwgsqxegwppgww0q.jpg","shopDocs":"https://res.cloudinary.com/dz55xewlb/image/upload/v1667662965/vendorDocs/cfcycqrj8qgti69xsnke.jpg","vendorPicture":"https://res.cloudinary.com/dz55xewlb/image/upload/v1667662967/vendorDocs/uvyoykdeymj1h4ybvpyw.jpg","shopPicture":"https://res.cloudinary.com/dz55xewlb/image/upload/v1667662969/vendorDocs/odd16t9ycglthqchlxdd.jpg","shopAddress":"jodhpur","shopAge":25,"shopTiming":"10am-6pm","deliveryMode":"Pick up","password":"$2b$10$rzmYFH/BSj.jkjgg38KrWOwH7i3zpzmKleM6WJoLdfoXYwSsy7ty2","status":"Activated","deletedAt":null,"isDeleted":false,"createdAt":"2022-11-05T15:42:50.643Z","updatedAt":"2022-12-25T14:37:27.682Z","__v":0}

class ProfileModel {
  ProfileModel({
      bool? status, 
      Data? data,}){
    _status = status;
    _data = data;
}

  ProfileModel.fromJson(dynamic json) {
    _status = json['status'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? _status;
  Data? _data;
ProfileModel copyWith({  bool? status,
  Data? data,
}) => ProfileModel(  status: status ?? _status,
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

/// googleMapsLocation : {"coordinates":[73.008957,26.263863],"type":"Point"}
/// socials : {"instagram":"/deepak.gunpal","facebook":"/gunpal.deepak"}
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
/// password : "$2b$10$rzmYFH/BSj.jkjgg38KrWOwH7i3zpzmKleM6WJoLdfoXYwSsy7ty2"
/// status : "Activated"
/// deletedAt : null
/// isDeleted : false
/// createdAt : "2022-11-05T15:42:50.643Z"
/// updatedAt : "2022-12-25T14:37:27.682Z"
/// __v : 0

class Data {
  Data({
      GoogleMapsLocation? googleMapsLocation, 
      Socials? socials, 
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
      String? password, 
      String? status, 
      dynamic deletedAt, 
      bool? isDeleted, 
      String? createdAt, 
      String? updatedAt, 
      num? v,}){
    _googleMapsLocation = googleMapsLocation;
    _socials = socials;
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
    _password = password;
    _status = status;
    _deletedAt = deletedAt;
    _isDeleted = isDeleted;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _v = v;
}

  Data.fromJson(dynamic json) {
    _googleMapsLocation = json['googleMapsLocation'] != null ? GoogleMapsLocation.fromJson(json['googleMapsLocation']) : null;
    _socials = json['socials'] != null ? Socials.fromJson(json['socials']) : null;
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
    _password = json['password'];
    _status = json['status'];
    _deletedAt = json['deletedAt'];
    _isDeleted = json['isDeleted'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
    _v = json['__v'];
  }
  GoogleMapsLocation? _googleMapsLocation;
  Socials? _socials;
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
  String? _password;
  String? _status;
  dynamic _deletedAt;
  bool? _isDeleted;
  String? _createdAt;
  String? _updatedAt;
  num? _v;
Data copyWith({  GoogleMapsLocation? googleMapsLocation,
  Socials? socials,
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
  String? password,
  String? status,
  dynamic deletedAt,
  bool? isDeleted,
  String? createdAt,
  String? updatedAt,
  num? v,
}) => Data(  googleMapsLocation: googleMapsLocation ?? _googleMapsLocation,
  socials: socials ?? _socials,
  id: id ?? _id,
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
  password: password ?? _password,
  status: status ?? _status,
  deletedAt: deletedAt ?? _deletedAt,
  isDeleted: isDeleted ?? _isDeleted,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  v: v ?? _v,
);
  GoogleMapsLocation? get googleMapsLocation => _googleMapsLocation;
  Socials? get socials => _socials;
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
  String? get password => _password;
  String? get status => _status;
  dynamic get deletedAt => _deletedAt;
  bool? get isDeleted => _isDeleted;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  num? get v => _v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_googleMapsLocation != null) {
      map['googleMapsLocation'] = _googleMapsLocation?.toJson();
    }
    if (_socials != null) {
      map['socials'] = _socials?.toJson();
    }
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