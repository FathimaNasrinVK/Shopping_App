
import 'package:fake_store_api/fakestore%20using%20http/using%20http/screens/home/widget/productTile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../../controller/productController.dart';
import '../details/productdetails.dart';


class ProductMainn extends StatelessWidget {
  ProductController productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xCC168A7D),
title:           Text('Shop Your Favourites 🛒🛍️',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 28),),
            centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(height: 10,),
          Expanded(child: Obx((){
            if(productController.isLoading.value){
              return Center(
                child: Lottie.asset("assets/animations/Animation - 1709015208585.json"),
              );
            }else{
              return GridView.builder(
                itemCount: productController.productList.length,

                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: .5,
                      crossAxisCount: 2,crossAxisSpacing:15,mainAxisSpacing: 15 ),
                  itemBuilder: (context,index)=>
                      InkWell(onTap: (){
                        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>ProductDetails(productController.productList[index])));
                      },
                          child: ProductTile(productController.productList[index])));
            }
          }))
        ],
      ),
    );
  }
}

