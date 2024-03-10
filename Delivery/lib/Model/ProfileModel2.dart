/// status : true
/// data : {"_id":"63b47cc9aae701ea94668e26","name":"app","number":9417424109,"referredBy":"y0vmyn","image":"https://res.cloudinary.com/dpjawybyn/image/upload/v1672772808/riderDocs/znxw2obeezbpiop1k3qr.jpg","age":45,"pincode":145623,"cityState":"abv","vehicalNumber":"mh0211562","available":"no","status":"requested","aadharFront":"https://res.cloudinary.com/dpjawybyn/image/upload/v1672772804/riderDocs/otpev03zfdppayebf1uu.webp","aadharBack":"https://res.cloudinary.com/dpjawybyn/image/upload/v1672772806/riderDocs/nlewbz9ov0mgsbljjspf.jpg","password":"$2b$10$GS/JvYLDqN4LpcAHo1SDNeRotzKywqUsQV7Q.bmGj6OmHxNSedgYi","createdAt":"2023-01-03T19:06:49.534Z","updatedAt":"2023-01-03T20:01:34.529Z","__v":0}

class ProfileModel2 {
  ProfileModel2({
      bool? status, 
      Data? data,}){
    _status = status;
    _data = data;
}

  ProfileModel2.fromJson(dynamic json) {
    _status = json['status'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? _status;
  Data? _data;
ProfileModel2 copyWith({  bool? status,
  Data? data,
}) => ProfileModel2(  status: status ?? _status,
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

/// _id : "63b47cc9aae701ea94668e26"
/// name : "app"
/// number : 9417424109
/// referredBy : "y0vmyn"
/// image : "https://res.cloudinary.com/dpjawybyn/image/upload/v1672772808/riderDocs/znxw2obeezbpiop1k3qr.jpg"
/// age : 45
/// pincode : 145623
/// cityState : "abv"
/// vehicalNumber : "mh0211562"
/// available : "no"
/// status : "requested"
/// aadharFront : "https://res.cloudinary.com/dpjawybyn/image/upload/v1672772804/riderDocs/otpev03zfdppayebf1uu.webp"
/// aadharBack : "https://res.cloudinary.com/dpjawybyn/image/upload/v1672772806/riderDocs/nlewbz9ov0mgsbljjspf.jpg"
/// password : "$2b$10$GS/JvYLDqN4LpcAHo1SDNeRotzKywqUsQV7Q.bmGj6OmHxNSedgYi"
/// createdAt : "2023-01-03T19:06:49.534Z"
/// updatedAt : "2023-01-03T20:01:34.529Z"
/// __v : 0

class Data {
  Data({
      String? id, 
      String? name, 
      num? number, 
      String? referredBy, 
      String? image, 
      num? age, 
      num? pincode, 
      String? cityState, 
      String? vehicalNumber, 
      String? available, 
      String? status, 
      String? aadharFront, 
      String? aadharBack, 
      String? password, 
      String? createdAt, 
      String? updatedAt, 
      num? v,}){
    _id = id;
    _name = name;
    _number = number;
    _referredBy = referredBy;
    _image = image;
    _age = age;
    _pincode = pincode;
    _cityState = cityState;
    _vehicalNumber = vehicalNumber;
    _available = available;
    _status = status;
    _aadharFront = aadharFront;
    _aadharBack = aadharBack;
    _password = password;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _v = v;
}

  Data.fromJson(dynamic json) {
    _id = json['_id'];
    _name = json['name'];
    _number = json['number'];
    _referredBy = json['referredBy'];
    _image = json['image'];
    _age = json['age'];
    _pincode = json['pincode'];
    _cityState = json['cityState'];
    _vehicalNumber = json['vehicalNumber'];
    _available = json['available'];
    _status = json['status'];
    _aadharFront = json['aadharFront'];
    _aadharBack = json['aadharBack'];
    _password = json['password'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
    _v = json['__v'];
  }
  String? _id;
  String? _name;
  num? _number;
  String? _referredBy;
  String? _image;
  num? _age;
  num? _pincode;
  String? _cityState;
  String? _vehicalNumber;
  String? _available;
  String? _status;
  String? _aadharFront;
  String? _aadharBack;
  String? _password;
  String? _createdAt;
  String? _updatedAt;
  num? _v;
Data copyWith({  String? id,
  String? name,
  num? number,
  String? referredBy,
  String? image,
  num? age,
  num? pincode,
  String? cityState,
  String? vehicalNumber,
  String? available,
  String? status,
  String? aadharFront,
  String? aadharBack,
  String? password,
  String? createdAt,
  String? updatedAt,
  num? v,
}) => Data(  id: id ?? _id,
  name: name ?? _name,
  number: number ?? _number,
  referredBy: referredBy ?? _referredBy,
  image: image ?? _image,
  age: age ?? _age,
  pincode: pincode ?? _pincode,
  cityState: cityState ?? _cityState,
  vehicalNumber: vehicalNumber ?? _vehicalNumber,
  available: available ?? _available,
  status: status ?? _status,
  aadharFront: aadharFront ?? _aadharFront,
  aadharBack: aadharBack ?? _aadharBack,
  password: password ?? _password,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  v: v ?? _v,
);
  String? get id => _id;
  String? get name => _name;
  num? get number => _number;
  String? get referredBy => _referredBy;
  String? get image => _image;
  num? get age => _age;
  num? get pincode => _pincode;
  String? get cityState => _cityState;
  String? get vehicalNumber => _vehicalNumber;
  String? get available => _available;
  String? get status => _status;
  String? get aadharFront => _aadharFront;
  String? get aadharBack => _aadharBack;
  String? get password => _password;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  num? get v => _v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    map['name'] = _name;
    map['number'] = _number;
    map['referredBy'] = _referredBy;
    map['image'] = _image;
    map['age'] = _age;
    map['pincode'] = _pincode;
    map['cityState'] = _cityState;
    map['vehicalNumber'] = _vehicalNumber;
    map['available'] = _available;
    map['status'] = _status;
    map['aadharFront'] = _aadharFront;
    map['aadharBack'] = _aadharBack;
    map['password'] = _password;
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    map['__v'] = _v;
    return map;
  }

}