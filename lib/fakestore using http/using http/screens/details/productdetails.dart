import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../model/productModel.dart';
import '../home/Product_Main.dart';

class ProductDetails extends StatelessWidget {
  final ProductModel productModel;

  ProductDetails(this.productModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
 appBar: AppBar(
   leading: InkWell(
     onTap: (){
       Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>ProductMainn()));
     },
       child: Icon(Icons.arrow_back_ios)),
   title: Text('Details'),
   backgroundColor: Colors.blueGrey[600],
   centerTitle: true,
 ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  //  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(productModel.image!))),
                ),
              ),
              Text(
                productModel.title!,
                style: GoogleFonts.jacquesFrancois(
                    fontWeight: FontWeight.bold, fontSize: 20),
              ),
             const SizedBox(
                height: 10,
              ),
              Text(
                'Price: ${productModel.price!}',
                style: GoogleFonts.jacquesFrancois(
                    fontWeight: FontWeight.bold, fontSize: 18),
              ),
             const SizedBox(
                height: 10,
              ),
              Text(
                productModel.description!,
                style: GoogleFonts.jacquesFrancois(
                    fontWeight: FontWeight.bold, fontSize: 16),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Rating: ⭐⭐⭐⭐${productModel.rating!.rate}',
                style: GoogleFonts.jacquesFrancois(
                    fontWeight: FontWeight.bold, fontSize: 10),
              ),
            ],
          ),
        )
    );
  }
}
