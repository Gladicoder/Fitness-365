import 'dart:async';
import 'dart:convert';

import 'package:exercise_app/Screens/SetUpProfileScreen.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Themes.dart';
import 'TabsScreen.dart';
import '../main.dart';
import 'IntroSlider.dart';
import 'package:exercise_app/CustomWidgets/CustomDialogues.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAndStoreToken();
  }

  findPPIofDevice(){
    setState(() {
      HEIGHT = MediaQuery.of(context).size.height;
      WIDTH = MediaQuery.of(context).size.width;
      print("Height & Width");
      print(HEIGHT);
      print(WIDTH);
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    findPPIofDevice();
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/splash/logo.png",
              fit: BoxFit.cover,
            ),
            customTextWidget.boldText(
                text: "Helping prioritize your health every day",
                color: BLACK,
                size: 16
            )
          ],
        ),
      )
    );
  }

  getAndStoreToken() async {
    SharedPreferences.getInstance().then((value) async{
      //first time
      if(value.getBool("isTokenStored") ?? false){
        print(await FirebaseMessaging.instance.getToken());
        callHomeScreen();
      }
      else if(value.getBool("isTokenStored") == null){
        FirebaseMessaging.instance.getToken().then((value){
          storeToken(value);
        }).catchError((e){
          print("SplashScreen/Token Retrieving Error :"+e.toString());
          value.setBool("isTokenStored", false);
          callIntroSlider();
        });
      }
      else if(value.getBool("isTokenStored") == false){
        FirebaseMessaging.instance.getToken().then((value){
          storeToken(value);
        }).catchError((e){
          print("SplashScreen/Token Retrieving Error :"+e.toString());
          value.setBool("isTokenStored", false);
          callHomeScreen();
        });
      }
    });
  }

  callIntroSlider(){
    Timer(Duration(seconds: 1), (){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => IntroSlider()));
    });
  }

  callHomeScreen() async{
    SharedPreferences sp = await SharedPreferences.getInstance();
    if(sp.getBool("isUserRegistered") ?? false){
      Timer(Duration(seconds: 2), (){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => TabsScreen()));
      });
    }else{
      Timer(Duration(seconds: 2), (){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SetUpProfileScreen()));
      });
    }
  }

  storeToken(token) async{
    print("SplashScreen/$SERVER_ADDRESS/api/tokan_data.php?token=$token&type=android");
    await post("$SERVER_ADDRESS/api/tokan_data.php?token=$token&type=android").then((value){
      final jsonResponse = jsonDecode(value.body);
      print("SplashScreen/"+jsonResponse.toString());
      if(value.statusCode == 200 && jsonResponse['data']['success'] == "1"){

        SharedPreferences.getInstance().then((value){
          value.setBool("isTokenStored", true);
          callIntroSlider();
        });
      }
    }).catchError((e){
      print("SplashScreenError/"+ e.toString());
      SharedPreferences.getInstance().then((value){
        value.setBool("isTokenStored", false);
        callIntroSlider();
      });
    });
  }

}