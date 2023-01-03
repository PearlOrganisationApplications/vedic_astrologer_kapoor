import 'package:flutter/material.dart';

import 'main.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  var connectedornot = NetworkStatus.online;
  @override
  void initState() {
    Future.delayed(Duration(milliseconds: 2000),(){
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>Home(connectedornot: connectedornot,)), (route) => false);
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;
    return Scaffold(backgroundColor: Colors.white,
      body:  Column(mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              child: Center(
                child: Container(
                  height:height*0.2 ,
                  child: Image.asset("Assets/logo.png"),
                ),
              ),
            ),
          ),
          SizedBox(
            height: height*0.1,
          ),
          Text(
            "Vedic Astrologer Kapoor",
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: height * 0.03),
          ),
        ],
      ),
    );
  }
}

