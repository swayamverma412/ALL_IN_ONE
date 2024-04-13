import 'dart:convert';

import 'package:flutter/material.dart';

import '../base/SnakeBAr.dart';
import '../model/AllProduct.dart';
import '../repository/Product_repo.dart';

class UpdateProduct extends StatefulWidget {
  Dataproduct? _dataproduct;
  String? id;

  UpdateProduct(this._dataproduct,this.id);

  @override
  State<UpdateProduct> createState() => _UpdateProductState();
}

class _UpdateProductState extends State<UpdateProduct> {

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _quantityController = TextEditingController();
  final TextEditingController _categoryshopController = TextEditingController();
  final TextEditingController _subcategoryController = TextEditingController();
  bool click=false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  void initState() {
   setState(() {
     setdata();
   });
    super.initState();
  }
  setdata(){
    _titleController.text=widget._dataproduct!.title.toString();
    _priceController.text=widget._dataproduct!.price.toString();
    _quantityController.text=widget._dataproduct!.quantity.toString();
    _categoryshopController.text=widget._dataproduct!.category.toString();
    _subcategoryController.text=widget._dataproduct!.subCategory.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      bottomNavigationBar: Material(
        color: Colors.red,
        child: InkWell(
          onTap: () {
            if(_formKey.currentState!.validate()){
              setState(() {
                click=true;
              });
              getupdate();
            }
          },
          child:SizedBox(
            height: kToolbarHeight,
            width: double.infinity,
            child: Center(
              child:click?CircularProgressIndicator(color: Colors.white,):Text(
                'Continue',
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
          child: Padding(
            padding: const EdgeInsets.only(left: 10,right:10,top: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 30,
                ),
                Container(
                  decoration: BoxDecoration(
                    boxShadow: kElevationToShadow[4],
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Row(
                    children: <Widget>[
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.arrow_back,
                          size: 20,
                          color: Colors.red,
                        ),
                      ),
                      const Text(
                        "Update Product",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                const Text(
                  "Product Name",
                  style: TextStyle(color: Colors.red, fontSize: 15),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: _titleController,
                  validator: (value) =>
                  value!.isEmpty ? 'Enter Product name' : null,
                  style: const TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.only(
                          left: 15, bottom: 11, top: 11, right: 15),
                      hintText: "Enter Product name",
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Colors.black, width: 2.0),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(25.0),
                      ) ,
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(25.0),
                      )),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Price",
                  style: TextStyle(color: Colors.red, fontSize: 15),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: _priceController,
                  validator: (value) =>
                  value!.isEmpty ? 'Enter your price' : null,
                  style: const TextStyle(color: Colors.black),
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.only(
                          left: 15, bottom: 11, top: 11, right: 15),
                      hintText: "Enter your price",
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Colors.black, width: 2.0),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(25.0),
                      ) ,
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(25.0),
                      )),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Product Quantity",
                  style: TextStyle(color: Colors.red, fontSize: 15),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: _quantityController,
                  validator: (value) =>
                  value!.isEmpty ? 'Enter Quantity' : null,
                  style: const TextStyle(color: Colors.black),
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.only(
                          left: 15, bottom: 11, top: 11, right: 15),
                      hintText: "Enter your Quantity",
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Colors.black, width: 2.0),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(25.0),
                      ) ,
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(25.0),
                      )),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Category",
                  style: TextStyle(color: Colors.red, fontSize: 15),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: _categoryshopController,
                  enabled: false,
                  validator: (value) =>
                  value!.isEmpty ? 'Enter your price' : null,
                  style: const TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.only(
                          left: 15, bottom: 11, top: 11, right: 15),
                      hintText: "Enter your price",
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Colors.black, width: 2.0),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(25.0),
                      ) ,
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(25.0),
                      )),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Sub-Category",
                  style: TextStyle(color: Colors.red, fontSize: 15),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: _subcategoryController,
                  enabled: false,
                  validator: (value) =>
                  value!.isEmpty ? 'Enter your' : null,
                  style: const TextStyle(color: Colors.black),
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.only(
                          left: 15, bottom: 11, top: 11, right: 15),
                      hintText: "Enter your price",
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Colors.black, width: 2.0),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(25.0),
                      ) ,
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(25.0),
                      )),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> getupdate()async {
    final paramDic={
      "title":_titleController.text,
      "price":_priceController.text,
      "quantity":_quantityController.text,
      "category":_categoryshopController.text,
      "subCategory":_subcategoryController.text,
      "productId":widget._dataproduct!.id.toString(),
    };
    ProductRepo().UpdateProduct(paramDic, widget.id.toString()).then((value){
      var data=jsonDecode(value.body);
      print("value-------------"+data.toString());
      if(value.statusCode==200){
        click=false;
        Navigator.of(context).pop();
        toastShow(data["message"].toString(),Colors.green);
          //print(get_category!.toJson().toString());
      }else{
        click=false;
        toastShow(data["message"].toString(),Colors.red);
      }
      setState(() {

      });
    });
  }
}
