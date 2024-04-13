// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:vendor_shopkeeper/base/Perferance.dart';
import 'package:vendor_shopkeeper/base/SnakeBAr.dart';
import 'package:vendor_shopkeeper/data/AppContent.dart';
import 'package:vendor_shopkeeper/screens/choose_image.dart';

import '../base/CommonMethod.dart';
import '../data/apiClient.dart';
import '../repository/Product_repo.dart';

class AddItem extends StatefulWidget {
  AddItem({Key? key}) : super(key: key);

  @override
  State<AddItem> createState() => _AddItemState();
}

class _AddItemState extends State<AddItem> {
  TextEditingController Name=TextEditingController();
  TextEditingController price=TextEditingController();
  TextEditingController Qunatity=TextEditingController();

  XFile? image;
  XFile? image2;
  bool showChooseImage = false;
  bool selectChooseImage = false;
  bool RequestnewImage = false;
 List<String> cateory=[];
 List  datalist=[];
 String? category;
 List<String> subcateorylist=[];
 String? subcategory;
 String? _category;
 String? _subcategory;
 String? id;
 String? imagelink;
 bool click=false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    getcategory();
    getshred();
    super.initState();
  }
  getshred() async{
    id=await SharedPreferenceClass.GetSharedData(AppContent.CUSTOMERID);
    setState(() {
      id=id;
    });
  }
  getcategory(){
    ProductRepo().fecthcategory().then((value) {
      var data=jsonDecode(value.body);
      print("Value>:"+data.toString());
      if(value.statusCode==200  && data["data"].length>0){
        datalist=data["data"];
        for(int i=0;i<data["data"].length;i++){
          cateory.add(data["data"][i]["categoryName"].toString());
        }
        setState(() {});
      }else{
        toastShow("No category", Colors.redAccent);
        print("Error in category");
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    double h(double height) {
      return MediaQuery.of(context).size.height * height;
    }

    double w(double width) {
      return MediaQuery.of(context).size.width * width;
    }

    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: Material(
          color: Colors.red,
          child: InkWell(
            onTap: () {
              if(_formKey.currentState!.validate()) {
                if(RequestnewImage==true){
                  if (image != null) {
                    setState(() {
                      click = true;
                    });
                    addproduct();
                  }
                  else{
                    showCustomSnackBar(message: "Select the image", context: context,isError: true);
                  }
                }else if(selectChooseImage==true){
                  if (image2 != null) {
                    setState(() {
                      click = true;
                    });
                    addproduct();
                  }
                  else{
                    showCustomSnackBar(message: "Select the image", context: context,isError: true);
                  }
                }
              }
            },
            child: SizedBox(
              height: kToolbarHeight,
              width: double.infinity,
              child: Center(
                child:click?CircularProgressIndicator(color: Colors.white,): Text(
                  'Save Changes',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Container(
                  height: h(0.058),
                  decoration: BoxDecoration(
                    boxShadow: kElevationToShadow[4],
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          IconButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            icon: Icon(
                              Icons.arrow_back,
                              size: 30,
                              color: Colors.red,
                            ),
                          ),
                          Text(
                            "Add Item",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 30.0, vertical: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 35.0),
                        child: Text(
                          "Name:",
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      TextFormField(
                        controller: Name,
                        validator: (value) =>
                        value!.isEmpty ? 'Enter name' : null,
                        decoration: InputDecoration(
                          hintText: "Enter the name of the item",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          enabledBorder:OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 20.0),
                        child: Text(
                          "Category",
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          hintText: "Select Category",
                          enabledBorder:OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        hint: Text("Select Category"),
                        value: category,
                        items: cateory.map((String state) {
                          return new DropdownMenuItem<String>(
                            value: state.toString(),
                            child: new Text(state),
                          );
                        }).toList(),
                        onChanged: ( value) {
                          setState(() {
                            _category=value;
                          });
                          getSubcategory(value.toString());
                        },
                        validator: (value) => value!.isEmpty ? 'Select category' : null,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 20.0),
                        child: Text(
                          "Sub Category",
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          hintText: "Select Sub-Category",
                          enabledBorder:OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),

                        value: subcategory,
                        items: subcateorylist.map((String state) {
                          return new DropdownMenuItem<String>(
                            value: state.toString(),
                            child: new Text(state),
                          );
                        }).toList(),
                        onChanged: ( valie) {
                          setState(() {
                            _subcategory=valie;
                          });
                        },
                        validator: (value) =>
                        value!.isEmpty ? 'Select sub-category' : null,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(top: 35.0),
                                child: Text(
                                  "Price:",
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              SizedBox(
                                width: 160,
                                child: TextFormField(
                                  controller: price,
                                  validator: (value) =>
                                  value!.isEmpty ? 'Enter price' : null,
                                  decoration: InputDecoration(
                                    hintText: "Enter price",
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    enabledBorder:OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    disabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(top: 35.0),
                                child: Text(
                                  "Amount:",
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              SizedBox(
                                width: 160,
                                child: TextFormField(
                                  controller: Qunatity,
                                  validator: (value) =>
                                  value!.isEmpty ? 'Enter quantity' : null,
                                  decoration: InputDecoration(
                                    hintText: "Amount of item",
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    enabledBorder:OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    disabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 40.0),
                        child: GestureDetector(
                          onTap: () {
                            showChooseImage = !showChooseImage;
                            setState(() {});
                            print(showChooseImage);
                          },
                          child: Row(
                            children: [
                              Icon(Icons.add_circle_outlined, color: Colors.red),
                              Padding(
                                padding: EdgeInsets.only(left: 12.0),
                                child: Text(
                                  "Add image",
                                  style:
                                      TextStyle(color: Colors.red, fontSize: 17),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      if (showChooseImage)
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: 40,
                                width: 130,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(),
                                ),
                                child: InkWell(
                                  borderRadius: BorderRadius.circular(20),
                                  onTap: () {
                                    setState(() {
                                      RequestnewImage=false;
                                    });
                                    pushNewScreen(
                                      context,
                                      screen: ChooseImage(),
                                      withNavBar: false,
                                    ).then((value) async {
                                      if(value.toString().contains("https")){
                                        imagelink=value.toString();
                                        String img=await downloadandsave(value.toString());
                                        print("Imahe"+img.toString());
                                        XFile file=XFile(img.toString());
                                        setState(() {
                                          imagelink=imagelink;
                                          image2=file;
                                          selectChooseImage=true;
                                        });

                                        print("Image");
                                      }else{
                                        print("No image");
                                      }
                                    });
                                  },
                                  child: Center(
                                    child: Text(
                                      "Choose Image",
                                      style: TextStyle(color: Colors.red),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                height: 40,
                                width: 150,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(),
                                ),
                                child: InkWell(
                                  borderRadius: BorderRadius.circular(20),
                                  onTap: () {
                                    setState(() {
                                      RequestnewImage=true;
                                      selectChooseImage=false;
                                    });
                                  },
                                  child: Center(
                                    child: Text(
                                      "Request New Image",
                                      style: TextStyle(color: Colors.red),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      if(selectChooseImage)
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Container(
                            height: 80,
                            width: 80,
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.3), borderRadius: BorderRadius.circular(4),
                              border: Border.all(width: 1, color: Theme.of(context).primaryColor),
                            ),
                            child:Image.file(File(image2!.path),height: 80,width: 80,),
                          ),
                        ),
                      if (RequestnewImage)
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Column(
                            children: [
                              Text(
                                  "Product Image",
                                  style: TextStyle(color: Colors.red, fontSize: 15)),
                              const SizedBox(
                                height: 10,
                              ),
                              InkWell(
                                onTap: () async {
                                  var file=await pickImage();
                                  setState(() {
                                    image=file;
                                  });
                                },
                                child: image==null?Container(
                                  decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.3), borderRadius: BorderRadius.circular(4),
                                    border: Border.all(width: 1, color: Theme.of(context).primaryColor),
                                  ),
                                  child: Container(
                                    margin: EdgeInsets.all(25),
                                    decoration: BoxDecoration(
                                      border: Border.all(width: 2, color: Colors.white),
                                      shape: BoxShape.circle,
                                    ),
                                    child: Icon(Icons.camera_alt, color: Colors.white),
                                  ),
                                ):Container(
                                  height: 80,
                                  width: 80,
                                  decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.3), borderRadius: BorderRadius.circular(4),
                                    border: Border.all(width: 1, color: Theme.of(context).primaryColor),
                                  ),
                                  child:Image.file(File(image!.path),height: 80,width: 80,),
                                ),

                              ),
                            ],
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
 Future<void> addproduct()async {

    final pramDic={
      "title":Name.text,
      "price":price.text,
      "quantity":Qunatity.text,
      "category":_category.toString(),
      "subCategory":_subcategory.toString()
    };
    List<MultipartBody> listImage=[];
    if(RequestnewImage==true && selectChooseImage==false){
      print("RequestImage");
      pramDic["requestImage"]="true";
      pramDic["imageName"]="${image!.name.toString()}";
   listImage.add(MultipartBody("productImage",image!));
    }else{
      print("get image");
      pramDic["requestImage"]="false";
      pramDic["productImage"]=imagelink.toString();
    }
    setState(() {
    });


   ProductRepo().Addproduct(id!,pramDic,listImage).then((value){
     var data=jsonDecode(value.body);
     print("value-------------"+data.toString());
     if(value.statusCode==201){
       click=false;
       Navigator.of(context).pop();
       toastShow("Product add Successfully",Colors.green);
     }else{
       click=false;
       toastShow(data["message"].toString(),Colors.red);
     }
     setState(() {
     });
   });
 }

  getSubcategory(String cat){
    int index=cateory.indexWhere((element) => element==cat);
    print("ind>>"+index.toString());
    subcateorylist=[];
    for(int i=0;i<datalist[index]["subCategories"].length;i++){
      subcateorylist.add(datalist[index]["subCategories"][i]["title"].toString());
    }
    setState(() {

    });
  }
}
