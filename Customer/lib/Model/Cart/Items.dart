class Items {
  Items({
      this.productId, 
      this.quantity,});

  Items.fromJson(dynamic json) {
    productId = json['productId'];
    quantity = json['quantity'];
  }
  String? productId;
  int? quantity;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['productId'] = productId;
    map['quantity'] = quantity;
    return map;
  }

}