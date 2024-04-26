import 'package:flutter/material.dart';

import '../home/Product_Main.dart';
void main(){
  runApp(MaterialApp(debugShowCheckedModeBanner: false,home: SplashScreen(),));
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}


class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 10), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => ProductMainn()),
      );
    });    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xCC168A7D),
      body: Center(child: Text("SHOP ME",style: TextStyle(color: Colors.white,fontSize: 26,fontWeight: FontWeight.bold),)),
    );
  }
}