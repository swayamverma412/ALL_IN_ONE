class Data {
  Data({
      this.id, 
      this.categoryName, 
      this.categoryImage, 
      this.description, 
      this.deletedAt, 
      this.isDeleted, 
      this.createdAt, 
      this.updatedAt, 
      this.v,});

  Data.fromJson(dynamic json) {
    id = json['_id'];
    categoryName = json['categoryName'];
    categoryImage = json['categoryImage'];
    if(json["subCategories"] !=null){
      subCategory = [];
      for(int i=0;i<json["subCategories"].length;i++){
        subCategory!.add(SubCategory(json["subCategories"][i]["image"], json["subCategories"][i]["title"]));
      }
      //subCategory=json['subCategories'];
    }
    description = json['description'];
    deletedAt = json['deletedAt'];
    isDeleted = json['isDeleted'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
  }
  String? id;
  String? categoryName;
  String? categoryImage;
  String? description;
  dynamic deletedAt;
  bool? isDeleted;
  String? createdAt;
  String? updatedAt;
  int? v;
  List<SubCategory>? subCategory;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['categoryName'] = categoryName;
    map['categoryImage'] = categoryImage;
    map['description'] = description;
    map['deletedAt'] = deletedAt;
    map['isDeleted'] = isDeleted;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['__v'] = v;
    return map;
  }

}

class SubCategory{
  String? image;
  String? title;
  SubCategory(this.image, this.title);
   SubCategory.fromJson(dynamic json){
     image=json["image"];
     title=json["title"];
   }
}