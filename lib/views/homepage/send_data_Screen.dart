import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:first_api_project/models/product.dart';
import 'package:first_api_project/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class SendDataScreen extends StatefulWidget {
  const SendDataScreen({super.key});

  @override
  State<SendDataScreen> createState() => _SendDataScreenState();
}

class _SendDataScreenState extends State<SendDataScreen> {
  TextEditingController tfIdTextEditingController = TextEditingController();
  TextEditingController tfTitleTextEditingController = TextEditingController();
  TextEditingController tfDiscriptionTextEditingController =
      TextEditingController();
  TextEditingController tfPriceTextEditingController = TextEditingController();
  TextEditingController tfPercentageTextEditingController =
      TextEditingController();
  TextEditingController tfRatingTextEditingController = TextEditingController();
  TextEditingController tfStockTextEditingController = TextEditingController();
  TextEditingController tfIdThumbnailEditingController =
      TextEditingController();
  TextEditingController tfBrandTextEditingController = TextEditingController();
  TextEditingController tfCategoryTextEditingController =
      TextEditingController();
  TextEditingController tfImage1URLTextEditingController =
      TextEditingController();
  TextEditingController tfImage2URLTextEditingController =
      TextEditingController();
  TextEditingController tfImage3URLTextEditingController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
            onPressed: postData, child: const Icon(Icons.send_rounded)),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: ListView(children: [
            const Text("Data"),
            CustomTextField(
                label: "ID",
                hint: "Enter ID",
                controller: tfIdTextEditingController),
            const SizedBox(height: 10),
            CustomTextField(
                label: "Title",
                hint: "Enter Title",
                controller: tfTitleTextEditingController),
            const SizedBox(height: 10),
            CustomTextField(
                label: "Disciption",
                hint: "Enter Disciption",
                controller: tfDiscriptionTextEditingController),
            const SizedBox(height: 10),
            CustomTextField(
                label: "Price",
                hint: "Enter Price",
                controller: tfPriceTextEditingController),
            const SizedBox(height: 10),
            CustomTextField(
                label: "Discount Percentage",
                hint: "Enter ID",
                controller: tfPercentageTextEditingController),
            const SizedBox(height: 10),
            CustomTextField(
                label: "Rating",
                hint: "Enter Rating",
                controller: tfRatingTextEditingController),
            const SizedBox(height: 10),
            CustomTextField(
                label: "Stock",
                hint: "Enter Stock",
                controller: tfStockTextEditingController),
            const SizedBox(height: 10),
            CustomTextField(
                label: "thumbnail",
                hint: "Enter thumbnail",
                controller: tfIdThumbnailEditingController),
            const SizedBox(height: 10),
            CustomTextField(
                label: "Brand Name",
                hint: "Enter Brand Name Here",
                controller: tfBrandTextEditingController),
            const SizedBox(height: 10),
            CustomTextField(
                label: "category",
                hint: "Enter category",
                controller: tfCategoryTextEditingController),
            const SizedBox(height: 10),
            CustomTextField(
                label: "image 1 URL",
                hint: "Enter First Image URL ",
                controller: tfImage1URLTextEditingController),
            const SizedBox(height: 10),
            CustomTextField(
                label: "image 2 URL",
                hint: "Enter First Image URL ",
                controller: tfImage2URLTextEditingController),
            const SizedBox(height: 10),
            CustomTextField(
                label: "image 3 URL",
                hint: "Enter First Image URL ",
                controller: tfImage3URLTextEditingController),
            const SizedBox(height: 10),
          ]),
        ),
      ),
    );
  }

  void postData() async {
    String productId = tfIdTextEditingController.text.trim();
    String productTitle = tfTitleTextEditingController.text.trim();
    String productDisciption = tfDiscriptionTextEditingController.text.trim();
    String productPrice = tfPriceTextEditingController.text.trim();
    String productPercentage = tfPercentageTextEditingController.text.trim();
    String productRating = tfRatingTextEditingController.text.trim();
    String productStock = tfStockTextEditingController.text.trim();
    String productthumbnail = tfIdThumbnailEditingController.text.trim();
    String productBrandName = tfBrandTextEditingController.text.trim();
    String productCategory = tfCategoryTextEditingController.text.trim();
    String productimage1Url = tfImage1URLTextEditingController.text.trim();
    String productimage2Url = tfImage2URLTextEditingController.text.trim();
    String productimage3Url = tfImage3URLTextEditingController.text.trim();

    if (productId.isEmpty) {
      showToast(context, "ID Can't Be Empty");
    } else if (productTitle.isEmpty) {
      showToast(context, "Title Can't Be Empty");
    } else if (productDisciption.isEmpty) {
      showToast(context, "Discription Can't Be Empty");
    } else if (productPrice.isEmpty) {
      showToast(context, "Price Can't Be Empty");
    } else if (productPercentage.isEmpty) {
      showToast(context, "Percntage Can't Be Empty");
    } else if (productRating.isEmpty) {
      showToast(context, "Rating Can't Be Empty");
    } else if (productStock.isEmpty) {
      showToast(context, "Stock Can't Be Empty");
    } else if (productthumbnail.isEmpty) {
      showToast(context, "Thumbnail Can't Be Empty");
    } else if (productBrandName.isEmpty) {
      showToast(context, "Brand Name Can't Be Empty");
    } else if (productCategory.isEmpty) {
      showToast(context, "Category Can't Be Empty");
    } else if (productimage1Url.isEmpty) {
      showToast(context, "Category Can't Be Empty");
    } else if (productimage2Url.isEmpty) {
      showToast(context, "Category Can't Be Empty");
    } else if (productimage3Url.isEmpty) {
      showToast(context, "Category Can't Be Empty");
    } else {
      List<String> imageList = [
        productimage1Url,
        productimage2Url,
        productimage3Url
      ];
      Product product = Product.addData(
          id: productId,
          title: productTitle,
          description: productDisciption,
          price: productPrice,
          discountPercentage: productPercentage,
          rating: productRating,
          stock: productStock,
          brand: productBrandName,
          category: productCategory,
          images: imageList);
      // product.display();

      var url = "https://dummyjson.com/products/add";
      var uri = Uri.parse(url);
      final response = await http.post(
        uri,
        body: json.encode(product.toJson()),
        headers: {'Content-Type': 'application/json'},
      );
      if (response.statusCode == 200) {
        showToast(context, "successfully Data Post");
      }
      print("Requst Code : ${response.statusCode}");
      print(response.body);
    }
  }

  void showToast(BuildContext context, String text) {
    var scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(SnackBar(
      content: Text(text),
      behavior: SnackBarBehavior.floating,
      action: SnackBarAction(
        label: "Okay",
        onPressed: scaffold.hideCurrentSnackBar,
      ),
    ));
  }
}
