import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:responsive_container/responsive_container.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

import 'animasi/animasi.dart';
import 'animasi/constant.dart';
import 'login/login.dart';
import 'login/register.dart';
import 'main/menu.dart';
import 'package:http/http.dart' as http;
void main() {
  runApp(
      MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Login Cogindo",
    home: SplashScreenPage(),
  ));
}

class SplashScreenPage extends StatefulWidget{
  @override
  _SplashScreenPageState createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage>{
  bool autol = false;
  bool isLoading = false;
  String name = '';

  String userId = '';

  @override
  void initState() {
    super.initState();

    startSplashScreen();
    autoLogIn();
  }

  void autoLogIn() async {
    if (!isLoading) {
      setState(() {
        isLoading = true;
      });
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      String userId = prefs.getString('id');
      String userToken = prefs.getString('token');

      if (userId != null) {
        isLoading = false;
        print('auto login ok');
        setState(() {
          autol = true;
          userId = prefs.getString('id');
        });
        return;
      }
    }

  }

  @override
  startSplashScreen() async{
    var durasi = const Duration(seconds: 3);
    return Timer(durasi, (){
      Navigator.of(context).pushReplacement(
        ScaleRoute(page: autol ? HomePage() : Utama()),
      );
    });
  }
  @override

  Widget build(BuildContext context){

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ResponsiveContainer(
              widthPercent: 80,
              heightPercent: 40,
              child: Image.asset(
                "asset/s1.png",
                  fit: BoxFit.cover,
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 15)),
            Text('SI HERANG', textAlign: TextAlign.center, style: TextStyle(fontSize: 28, color: ColorPalette.underlineTextField, fontWeight: FontWeight.bold),),
            Padding(padding: EdgeInsets.only(top: 25)),
            _buildProgressIndicator()
          ],
        ),
      ),
    );
  }

  _buildProgressIndicator() {
    return new Padding(
      padding: const EdgeInsets.all(8.0),
      child: new Center(
        child: new Opacity(
          opacity: 1.0,
          child: new CircularProgressIndicator(),
        ),
      ),
    );
  }

}


class Utama extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: DecoratedBox(
        position: DecorationPosition.background,
        decoration: BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
            image: AssetImage('asset/left.png'),
            alignment: Alignment.bottomLeft,
          ) ,
        ),
        child:ListView(
          children: <Widget>[
            _iconLogin(),
            _buildButton(context)
          ],
        ),
      ),
    ) ;
  }

  Widget _iconLogin(){
    return InkWell(
      child: Container(
        padding: EdgeInsets.only(top:20.0, bottom: 20),
        width: double.infinity,
        height: 300,

        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(bottomLeft: const Radius.circular(70.0) ),
        ),
        child: Image.asset(
          "asset/s1.png",
          width: 250,
        ),
      ),
    );
  }



  Widget _buildButton(BuildContext context){
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 50.0),
        ),
        InkWell(
          onTap:  (){
            Navigator.push(context, SlideLeftRoute(page: LoginPage()));
          },
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 15.0),
            width: 255,
            child: Text(
              "Login",
              style: TextStyle(color: Colors.white, fontSize: 18,),
              textAlign: TextAlign.center,
            ),
            decoration: BoxDecoration(
              color: ColorPalette.underlineTextField,
              borderRadius: BorderRadius.circular(30.0),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 16.0),
        ),
        InkWell(
          onTap: (){
            Navigator.push(context, SlideLeftRoute(page: RegisterPage()));
          },
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 15.0),
            width: 255,
            child: Text(
              "Register",
              style: TextStyle(color: ColorPalette.underlineTextField, fontSize: 18,),
              textAlign: TextAlign.center,
            ),
            decoration: BoxDecoration(
              color: Colors.transparent,
              border: Border.all(color: ColorPalette.underlineTextField),
              borderRadius: BorderRadius.circular(30.0),
            ),
          ),
        ),
      ],
    );
  }

}



