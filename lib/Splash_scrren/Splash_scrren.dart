import 'package:flutter/material.dart';

class Splash_scrren extends StatefulWidget {
  const Splash_scrren({Key? key}) : super(key: key);

  @override
  State<Splash_scrren> createState() => _Splash_scrrenState();
}

class _Splash_scrrenState extends State<Splash_scrren> {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3  ), () async {
      await Navigator.pushReplacementNamed(context, "home");
    });
    return Scaffold(
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            Image.asset("assets/image/d1.png"),
              Text("To My Contact Diary", style: TextStyle(
            fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),),
        ],
      ),
    ),);
  }
}
