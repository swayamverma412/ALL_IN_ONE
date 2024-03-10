/// status : true
/// data : [{"_id":"637dd0b0a07df33bc7ba98ec","categoryName":"tech","categoryImage":"https://res.cloudinary.com/dpjawybyn/image/upload/v1669189806/vendorDocs/iijh8ngzfzztm9wkmp1v.jpg","subCategories":[{"image":"https://res.cloudinary.com/dpjawybyn/image/upload/v1669189807/vendorDocs/oge3ejutnnbcmjtpfxmk.jpg","title":"audio"}],"description":"electronics","deletedAt":null,"isDeleted":false,"createdAt":"2022-11-23T07:50:08.301Z","updatedAt":"2022-11-23T08:17:05.263Z","__v":0}]

class Cat {
  Cat({
      bool? status, 
      List<Data>? data,}){
    _status = status;
    _data = data;
}

  Cat.fromJson(dynamic json) {
    _status = json['status'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        print("1");
        _data?.add(Data.fromJson(v));
      });
    }
  }
  bool? _status;
  List<Data>? _data;
Cat copyWith({  bool? status,
  List<Data>? data,
}) => Cat(  status: status ?? _status,
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

/// _id : "637dd0b0a07df33bc7ba98ec"
/// categoryName : "tech"
/// categoryImage : "https://res.cloudinary.com/dpjawybyn/image/upload/v1669189806/vendorDocs/iijh8ngzfzztm9wkmp1v.jpg"
/// subCategories : [{"image":"https://res.cloudinary.com/dpjawybyn/image/upload/v1669189807/vendorDocs/oge3ejutnnbcmjtpfxmk.jpg","title":"audio"}]
/// description : "electronics"
/// deletedAt : null
/// isDeleted : false
/// createdAt : "2022-11-23T07:50:08.301Z"
/// updatedAt : "2022-11-23T08:17:05.263Z"
/// __v : 0

class Data {
  Data({
      String? id, 
      String? categoryName, 
      String? categoryImage, 
      List<SubCategories>? subCategories, 
      String? description, 
      dynamic deletedAt, 
      bool? isDeleted, 
      String? createdAt, 
      String? updatedAt, 
      num? v,}){
    _id = id;
    _categoryName = categoryName;
    _categoryImage = categoryImage;
    _subCategories = subCategories;
    _description = description;
    _deletedAt = deletedAt;
    _isDeleted = isDeleted;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _v = v;
}

  Data.fromJson(dynamic json) {
    _id = json['_id'];
    _categoryName = json['categoryName'];
    _categoryImage = json['categoryImage'];
    if (json['subCategories'] != null) {
      _subCategories = [];
      json['subCategories'].foreach((v) {
        print(2);
        _subCategories?.add(SubCategories.fromJson(v));
      });
    }
    _description = json['description'];
    _deletedAt = json['deletedAt'];
    _isDeleted = json['isDeleted'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
    _v = json['__v'];
  }
  String? _id;
  String? _categoryName;
  String? _categoryImage;
  List<SubCategories>? _subCategories;
  String? _description;
  dynamic _deletedAt;
  bool? _isDeleted;
  String? _createdAt;
  String? _updatedAt;
  num? _v;
Data copyWith({  String? id,
  String? categoryName,
  String? categoryImage,
  List<SubCategories>? subCategories,
  String? description,
  dynamic deletedAt,
  bool? isDeleted,
  String? createdAt,
  String? updatedAt,
  num? v,
}) => Data(  id: id ?? _id,
  categoryName: categoryName ?? _categoryName,
  categoryImage: categoryImage ?? _categoryImage,
  subCategories: subCategories ?? _subCategories,
  description: description ?? _description,
  deletedAt: deletedAt ?? _deletedAt,
  isDeleted: isDeleted ?? _isDeleted,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  v: v ?? _v,
);
  String? get id => _id;
  String? get categoryName => _categoryName;
  String? get categoryImage => _categoryImage;
  List<SubCategories>? get subCategories => _subCategories;
  String? get description => _description;
  dynamic get deletedAt => _deletedAt;
  bool? get isDeleted => _isDeleted;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  num? get v => _v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    map['categoryName'] = _categoryName;
    map['categoryImage'] = _categoryImage;
    if (_subCategories != null) {
      map['subCategories'] = _subCategories?.map((v) => v.toJson()).toList();
    }
    map['description'] = _description;
    map['deletedAt'] = _deletedAt;
    map['isDeleted'] = _isDeleted;
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    map['__v'] = _v;
    return map;
  }

}

/// image : "https://res.cloudinary.com/dpjawybyn/image/upload/v1669189807/vendorDocs/oge3ejutnnbcmjtpfxmk.jpg"
/// title : "audio"

class SubCategories {
  SubCategories({
      String? image, 
      String? title,}){
    _image = image;
    _title = title;
}

  SubCategories.fromJson(dynamic json) {
    _image = json['image'];
    _title = json['title'];
  }
  String? _image;
  String? _title;
SubCategories copyWith({  String? image,
  String? title,
}) => SubCategories(  image: image ?? _image,
  title: title ?? _title,
);
  String? get image => _image;
  String? get title => _title;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['image'] = _image;
    map['title'] = _title;
    return map;
  }

}