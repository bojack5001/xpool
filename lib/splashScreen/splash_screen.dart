import 'dart:async';
import 'package:flutter/material.dart';
import 'package:xpool/Assistants/assitants_methods.dart';
import 'package:xpool/Screens/login_screen.dart';
import 'package:xpool/Screens/main_screen.dart';
import 'package:xpool/global/global.dart';

class splashscreen extends StatefulWidget {
  const splashscreen({super.key});

  @override
  State<splashscreen> createState() => _splashscreenState();
}

class _splashscreenState extends State<splashscreen> {

  startTimer(){
    Timer(Duration(seconds: 2), () async {
      if(await firebaseAuth.currentUser != null) {
        firebaseAuth.currentUser != null ? AssistantMethods.readCurrentOnlineUserInfo() : null;
        Navigator.push(context, MaterialPageRoute(builder: (c) => MainScreen()));
      }
      else{
        Navigator.push(context, MaterialPageRoute(builder: (c) => LoginScreen()));
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'xpool',
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
