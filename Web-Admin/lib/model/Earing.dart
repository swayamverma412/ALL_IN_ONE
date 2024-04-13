/// status : true
/// data : {"globalIncome":[{"sentTo":"self","amount":25,"date":"Sun Dec 25 2022 10:20:32 GMT+0530 (India Standard Time)"},{"sentTo":"self","amount":25,"date":"Sun Dec 25 2022 12:57:07 GMT+0530 (India Standard Time)"},{"sentTo":"swayam","amount":70,"date":"Sun Dec 25 2022 13:01:20 GMT+0530 (India Standard Time)"},{"sentTo":"swayam","amount":100,"date":"Sun Dec 25 2022 13:04:42 GMT+0530 (India Standard Time)"},{"sentTo":"swayam","amount":100,"date":"Mon Dec 26 2022 19:27:58 GMT+0000 (Coordinated Universal Time)"},{"sentTo":"deepak","amount":2,"date":"Mon Dec 26 2022 19:49:06 GMT+0000 (Coordinated Universal Time)"},{"ReceivedFrom":"deepak","amount":2,"date":"Mon Dec 26 2022 19:49:06 GMT+0000 (Coordinated Universal Time)"},{"sentTo":"self","amount":25,"date":"Tue Dec 27 2022 17:55:13 GMT+0000 (Coordinated Universal Time)"},{"sentTo":"self","amount":25,"date":"Thu Dec 29 2022 17:14:48 GMT+0000 (Coordinated Universal Time)"},{"sentTo":"self","amount":25,"date":"Fri Dec 30 2022 09:20:00 GMT+0000 (Coordinated Universal Time)"},{"sentTo":"self","amount":25,"date":"Fri Dec 30 2022 10:24:23 GMT+0000 (Coordinated Universal Time)"},{"sentTo":"self","amount":25,"date":"Fri Dec 30 2022 10:24:27 GMT+0000 (Coordinated Universal Time)"},{"sentTo":"self","amount":25,"date":"Fri Dec 30 2022 10:24:30 GMT+0000 (Coordinated Universal Time)"},{"sentTo":"self","amount":25,"date":"Fri Dec 30 2022 10:36:01 GMT+0000 (Coordinated Universal Time)"},{"sentTo":"self","amount":25,"date":"Fri Dec 30 2022 10:36:04 GMT+0000 (Coordinated Universal Time)"}],"otherEarnings":[{"_id":"63c7dfa7b82b4cca184212ed","from":9352816598,"to":9352816598,"amount":141,"receipt":"oym6pm","status":"completed","type":"earning","date":"Wed Jan 18 2023 17:31:43 GMT+0530 (India Standard Time)","note":"scratch card reward received","createdAt":"2023-01-18T12:01:43.100Z","updatedAt":"2023-01-18T12:01:43.100Z","__v":0},{"_id":"63ceafe0a180b98df74b44e2","from":9352816598,"to":9352816598,"amount":118,"receipt":"03c8nm","status":"completed","type":"earning","date":"Mon Jan 23 2023 16:03:44 GMT+0000 (Coordinated Universal Time)","note":"scratch card reward received","createdAt":"2023-01-23T16:03:44.676Z","updatedAt":"2023-01-23T16:03:44.676Z","__v":0}]}

class Earinig {
  Earinig({
    bool? status,
    Data? data,}){
    _status = status;
    _data = data;
  }

  Earinig.fromJson(dynamic json) {
    _status = json['status'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? _status;
  Data? _data;
  Earinig copyWith({  bool? status,
    Data? data,
  }) => Earinig(  status: status ?? _status,
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

/// globalIncome : [{"sentTo":"self","amount":25,"date":"Sun Dec 25 2022 10:20:32 GMT+0530 (India Standard Time)"},{"sentTo":"self","amount":25,"date":"Sun Dec 25 2022 12:57:07 GMT+0530 (India Standard Time)"},{"sentTo":"swayam","amount":70,"date":"Sun Dec 25 2022 13:01:20 GMT+0530 (India Standard Time)"},{"sentTo":"swayam","amount":100,"date":"Sun Dec 25 2022 13:04:42 GMT+0530 (India Standard Time)"},{"sentTo":"swayam","amount":100,"date":"Mon Dec 26 2022 19:27:58 GMT+0000 (Coordinated Universal Time)"},{"sentTo":"deepak","amount":2,"date":"Mon Dec 26 2022 19:49:06 GMT+0000 (Coordinated Universal Time)"},{"ReceivedFrom":"deepak","amount":2,"date":"Mon Dec 26 2022 19:49:06 GMT+0000 (Coordinated Universal Time)"},{"sentTo":"self","amount":25,"date":"Tue Dec 27 2022 17:55:13 GMT+0000 (Coordinated Universal Time)"},{"sentTo":"self","amount":25,"date":"Thu Dec 29 2022 17:14:48 GMT+0000 (Coordinated Universal Time)"},{"sentTo":"self","amount":25,"date":"Fri Dec 30 2022 09:20:00 GMT+0000 (Coordinated Universal Time)"},{"sentTo":"self","amount":25,"date":"Fri Dec 30 2022 10:24:23 GMT+0000 (Coordinated Universal Time)"},{"sentTo":"self","amount":25,"date":"Fri Dec 30 2022 10:24:27 GMT+0000 (Coordinated Universal Time)"},{"sentTo":"self","amount":25,"date":"Fri Dec 30 2022 10:24:30 GMT+0000 (Coordinated Universal Time)"},{"sentTo":"self","amount":25,"date":"Fri Dec 30 2022 10:36:01 GMT+0000 (Coordinated Universal Time)"},{"sentTo":"self","amount":25,"date":"Fri Dec 30 2022 10:36:04 GMT+0000 (Coordinated Universal Time)"}]
/// otherEarnings : [{"_id":"63c7dfa7b82b4cca184212ed","from":9352816598,"to":9352816598,"amount":141,"receipt":"oym6pm","status":"completed","type":"earning","date":"Wed Jan 18 2023 17:31:43 GMT+0530 (India Standard Time)","note":"scratch card reward received","createdAt":"2023-01-18T12:01:43.100Z","updatedAt":"2023-01-18T12:01:43.100Z","__v":0},{"_id":"63ceafe0a180b98df74b44e2","from":9352816598,"to":9352816598,"amount":118,"receipt":"03c8nm","status":"completed","type":"earning","date":"Mon Jan 23 2023 16:03:44 GMT+0000 (Coordinated Universal Time)","note":"scratch card reward received","createdAt":"2023-01-23T16:03:44.676Z","updatedAt":"2023-01-23T16:03:44.676Z","__v":0}]

class Data {
  Data({
    List<GlobalIncome>? globalIncome,
    List<OtherEarnings>? otherEarnings,}){
    _globalIncome = globalIncome;
    _otherEarnings = otherEarnings;
  }

  Data.fromJson(dynamic json) {
    if (json['globalIncome'] != null) {
      _globalIncome = [];
      json['globalIncome'].forEach((v) {
        _globalIncome?.add(GlobalIncome.fromJson(v));
      });
    }
    if (json['otherEarnings'] != null) {
      _otherEarnings = [];
      json['otherEarnings'].forEach((v) {
        _otherEarnings?.add(OtherEarnings.fromJson(v));
      });
    }
  }
  List<GlobalIncome>? _globalIncome;
  List<OtherEarnings>? _otherEarnings;
  Data copyWith({  List<GlobalIncome>? globalIncome,
    List<OtherEarnings>? otherEarnings,
  }) => Data(  globalIncome: globalIncome ?? _globalIncome,
    otherEarnings: otherEarnings ?? _otherEarnings,
  );
  List<GlobalIncome>? get globalIncome => _globalIncome;
  List<OtherEarnings>? get otherEarnings => _otherEarnings;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_globalIncome != null) {
      map['globalIncome'] = _globalIncome?.map((v) => v.toJson()).toList();
    }
    if (_otherEarnings != null) {
      map['otherEarnings'] = _otherEarnings?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// _id : "63c7dfa7b82b4cca184212ed"
/// from : 9352816598
/// to : 9352816598
/// amount : 141
/// receipt : "oym6pm"
/// status : "completed"
/// type : "earning"
/// date : "Wed Jan 18 2023 17:31:43 GMT+0530 (India Standard Time)"
/// note : "scratch card reward received"
/// createdAt : "2023-01-18T12:01:43.100Z"
/// updatedAt : "2023-01-18T12:01:43.100Z"
/// __v : 0

class OtherEarnings {
  OtherEarnings({
    String? id,
    num? from,
    num? to,
    num? amount,
    String? receipt,
    String? status,
    String? type,
    String? date,
    String? note,
    String? createdAt,
    String? updatedAt,
    num? v,}){
    _id = id;
    _from = from;
    _to = to;
    _amount = amount;
    _receipt = receipt;
    _status = status;
    _type = type;
    _date = date;
    _note = note;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _v = v;
  }

  OtherEarnings.fromJson(dynamic json) {
    _id = json['_id'];
    _from = json['from'];
    _to = json['to'];
    _amount = json['amount'];
    _receipt = json['receipt'];
    _status = json['status'];
    _type = json['type'];
    _date = json['date'];
    _note = json['note'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
    _v = json['__v'];
  }
  String? _id;
  num? _from;
  num? _to;
  num? _amount;
  String? _receipt;
  String? _status;
  String? _type;
  String? _date;
  String? _note;
  String? _createdAt;
  String? _updatedAt;
  num? _v;
  OtherEarnings copyWith({  String? id,
    num? from,
    num? to,
    num? amount,
    String? receipt,
    String? status,
    String? type,
    String? date,
    String? note,
    String? createdAt,
    String? updatedAt,
    num? v,
  }) => OtherEarnings(  id: id ?? _id,
    from: from ?? _from,
    to: to ?? _to,
    amount: amount ?? _amount,
    receipt: receipt ?? _receipt,
    status: status ?? _status,
    type: type ?? _type,
    date: date ?? _date,
    note: note ?? _note,
    createdAt: createdAt ?? _createdAt,
    updatedAt: updatedAt ?? _updatedAt,
    v: v ?? _v,
  );
  String? get id => _id;
  num? get from => _from;
  num? get to => _to;
  num? get amount => _amount;
  String? get receipt => _receipt;
  String? get status => _status;
  String? get type => _type;
  String? get date => _date;
  String? get note => _note;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  num? get v => _v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    map['from'] = _from;
    map['to'] = _to;
    map['amount'] = _amount;
    map['receipt'] = _receipt;
    map['status'] = _status;
    map['type'] = _type;
    map['date'] = _date;
    map['note'] = _note;
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    map['__v'] = _v;
    return map;
  }

}

/// sentTo : "self"
/// amount : 25
/// date : "Sun Dec 25 2022 10:20:32 GMT+0530 (India Standard Time)"

class GlobalIncome {
  GlobalIncome({
    String? sentTo,
    num? amount,
    String? date,}){
    _sentTo = sentTo;
    _amount = amount;
    _date = date;
  }

  GlobalIncome.fromJson(dynamic json) {
    _sentTo = json['sentTo'];
    _amount = json['amount'];
    _date = json['date'];
  }
  String? _sentTo;
  num? _amount;
  String? _date;
  GlobalIncome copyWith({  String? sentTo,
    num? amount,
    String? date,
  }) => GlobalIncome(  sentTo: sentTo ?? _sentTo,
    amount: amount ?? _amount,
    date: date ?? _date,
  );
  String? get sentTo => _sentTo;
  num? get amount => _amount;
  String? get date => _date;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['sentTo'] = _sentTo;
    map['amount'] = _amount;
    map['date'] = _date;
    return map;
  }

}