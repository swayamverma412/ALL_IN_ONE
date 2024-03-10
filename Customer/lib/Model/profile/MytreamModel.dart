/// status : true
/// data : [{"_id":"63a6d6e1e16607bda59d1d97","name":"deepak gunpal","email":"gunpaldeepak@gmail.com","referredBy":"y0vmyn","address":[{"location":"moshi moshi 3rd floor","addressType":"other","type":"Point","coordinates":[77.594566,12.971599],"_id":"63a6fae725ad72bca3ba7918"},{"location":"GR TowerGR TowerSahibzada Ajit Singh Nagar","addressType":"home","type":"Point","coordinates":[76.6927117,30.6995987],"_id":"63a6fb5e25ad72bca3ba7940"},{"location":"202Sector 118Sahibzada Ajit Singh Nagar","addressType":"office","type":"Point","coordinates":[76.6841543,30.7341974],"_id":"63a6fb80707c013faf2fd617"},{"location":"Google Building 40Google Building 40Mountain View","addressType":"work","type":"Point","coordinates":[-122.084,37.4219983],"_id":"63a7fde7480a33a8390d9fc4"}],"number":9352816598,"password":"$2b$10$UswqbKQZR31gyPGKFde8qOCrydUeAQ2gwk8fKXTr8uZPzDQ3QpNKe","createdAt":"2022-12-24T10:39:29.116Z","updatedAt":"2022-12-27T04:57:45.715Z","__v":0,"isDeleted":false}]

class MytreamModel {
  MytreamModel({
      bool? status, 
      List<Data>? data,}){
    _status = status;
    _data = data;
}

  MytreamModel.fromJson(dynamic json) {
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
MytreamModel copyWith({  bool? status,
  List<Data>? data,
}) => MytreamModel(  status: status ?? _status,
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

/// _id : "63a6d6e1e16607bda59d1d97"
/// name : "deepak gunpal"
/// email : "gunpaldeepak@gmail.com"
/// referredBy : "y0vmyn"
/// address : [{"location":"moshi moshi 3rd floor","addressType":"other","type":"Point","coordinates":[77.594566,12.971599],"_id":"63a6fae725ad72bca3ba7918"},{"location":"GR TowerGR TowerSahibzada Ajit Singh Nagar","addressType":"home","type":"Point","coordinates":[76.6927117,30.6995987],"_id":"63a6fb5e25ad72bca3ba7940"},{"location":"202Sector 118Sahibzada Ajit Singh Nagar","addressType":"office","type":"Point","coordinates":[76.6841543,30.7341974],"_id":"63a6fb80707c013faf2fd617"},{"location":"Google Building 40Google Building 40Mountain View","addressType":"work","type":"Point","coordinates":[-122.084,37.4219983],"_id":"63a7fde7480a33a8390d9fc4"}]
/// number : 9352816598
/// password : "$2b$10$UswqbKQZR31gyPGKFde8qOCrydUeAQ2gwk8fKXTr8uZPzDQ3QpNKe"
/// createdAt : "2022-12-24T10:39:29.116Z"
/// updatedAt : "2022-12-27T04:57:45.715Z"
/// __v : 0
/// isDeleted : false

class Data {
  Data({
      String? id, 
      String? name, 
      String? email, 
      String? referredBy, 
      List<Address>? address, 
      num? number, 
      String? password, 
      String? createdAt, 
      String? updatedAt, 
      num? v, 
      bool? isDeleted,}){
    _id = id;
    _name = name;
    _email = email;
    _referredBy = referredBy;
    _address = address;
    _number = number;
    _password = password;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _v = v;
    _isDeleted = isDeleted;
}

  Data.fromJson(dynamic json) {
    _id = json['_id'];
    _name = json['name'];
    _email = json['email'];
    _referredBy = json['referredBy'];
    if (json['address'] != null) {
      _address = [];
      json['address'].forEach((v) {
        _address?.add(Address.fromJson(v));
      });
    }
    _number = json['number'];
    _password = json['password'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
    _v = json['__v'];
    _isDeleted = json['isDeleted'];
  }
  String? _id;
  String? _name;
  String? _email;
  String? _referredBy;
  List<Address>? _address;
  num? _number;
  String? _password;
  String? _createdAt;
  String? _updatedAt;
  num? _v;
  bool? _isDeleted;
Data copyWith({  String? id,
  String? name,
  String? email,
  String? referredBy,
  List<Address>? address,
  num? number,
  String? password,
  String? createdAt,
  String? updatedAt,
  num? v,
  bool? isDeleted,
}) => Data(  id: id ?? _id,
  name: name ?? _name,
  email: email ?? _email,
  referredBy: referredBy ?? _referredBy,
  address: address ?? _address,
  number: number ?? _number,
  password: password ?? _password,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  v: v ?? _v,
  isDeleted: isDeleted ?? _isDeleted,
);
  String? get id => _id;
  String? get name => _name;
  String? get email => _email;
  String? get referredBy => _referredBy;
  List<Address>? get address => _address;
  num? get number => _number;
  String? get password => _password;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  num? get v => _v;
  bool? get isDeleted => _isDeleted;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    map['name'] = _name;
    map['email'] = _email;
    map['referredBy'] = _referredBy;
    if (_address != null) {
      map['address'] = _address?.map((v) => v.toJson()).toList();
    }
    map['number'] = _number;
    map['password'] = _password;
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    map['__v'] = _v;
    map['isDeleted'] = _isDeleted;
    return map;
  }

}

/// location : "moshi moshi 3rd floor"
/// addressType : "other"
/// type : "Point"
/// coordinates : [77.594566,12.971599]
/// _id : "63a6fae725ad72bca3ba7918"

class Address {
  Address({
      String? location, 
      String? addressType, 
      String? type, 
      List<num>? coordinates, 
      String? id,}){
    _location = location;
    _addressType = addressType;
    _type = type;
    _coordinates = coordinates;
    _id = id;
}

  Address.fromJson(dynamic json) {
    _location = json['location'];
    _addressType = json['addressType'];
    _type = json['type'];
    _coordinates = json['coordinates'] != null ? json['coordinates'].cast<num>() : [];
    _id = json['_id'];
  }
  String? _location;
  String? _addressType;
  String? _type;
  List<num>? _coordinates;
  String? _id;
Address copyWith({  String? location,
  String? addressType,
  String? type,
  List<num>? coordinates,
  String? id,
}) => Address(  location: location ?? _location,
  addressType: addressType ?? _addressType,
  type: type ?? _type,
  coordinates: coordinates ?? _coordinates,
  id: id ?? _id,
);
  String? get location => _location;
  String? get addressType => _addressType;
  String? get type => _type;
  List<num>? get coordinates => _coordinates;
  String? get id => _id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['location'] = _location;
    map['addressType'] = _addressType;
    map['type'] = _type;
    map['coordinates'] = _coordinates;
    map['_id'] = _id;
    return map;
  }

}