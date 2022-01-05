import 'package:demo/core/entities/base_response.dart';
import 'package:demo/core/network/dio_client.dart';
import 'package:demo/data/user/entities/sign_up_response.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Future.delayed(Duration(milliseconds: 1500), () async {
      print("SplashPage");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Image.asset(
          "assets/images/logo.png",
          width: 200,
          height: 100,
        ),
      ),
    );
  }
}
