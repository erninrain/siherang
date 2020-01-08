import 'dart:io';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:dlh/animasi/constant.dart';
import 'package:dlh/main/akun.dart';
import 'package:dlh/main/berita.dart';
import 'package:dlh/main/contoh.dart';
import 'package:dlh/main/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ASDF extends StatelessWidget {
  final int index;
  ASDF({this.index});
  @override
  Widget build(BuildContext context) {
    //Navigator.pop(context, SlideLeftRoute(page: CatalogHome()));

    return Container(
      child: Center(
          child: !(index == 0) ? Text("sip ${index}")
              :     InkWell(
              child: Text('logout'),
              onTap: () {

              }
          )
      ),);
  }
}

class HomePage extends StatefulWidget{
  @override
  _BottomNavPageState createState() => _BottomNavPageState();
}

class _BottomNavPageState extends State<HomePage>{
  int _selectedTabIndex = 0;
  void _onNavBarTapped(int index){
    setState(() {
      _selectedTabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context){

    final _listPage = <Widget>[
      Beranda(),
      BeritaPage(),
      MyHomePage(),
      AkunPage()
    ];

    final _bottomNavBarItems = <BottomNavigationBarItem>[
      BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home')),
      BottomNavigationBarItem(icon: Icon(Icons.dashboard), title: Text('Dashboard')),
      BottomNavigationBarItem(icon: Icon(Icons.bookmark), title: Text('RFQ')),
      BottomNavigationBarItem(icon: Icon(Icons.person), title: Text('Account'),),
    ];

    final PageStorageBucket bucket = PageStorageBucket();

    final _bottomNavBar = CurvedNavigationBar(
      backgroundColor: ColorPalette.underlineTextField,
      animationCurve: Curves.fastOutSlowIn,
      height: 55,
      items: <Widget>[
        Icon(Icons.home,size: 30,),
        Icon(Icons.subtitles,size: 30,),
        Icon(Icons.dashboard, size: 30,),
        Icon(Icons.person,size: 30,),
      ],
      onTap: _onNavBarTapped,
    );

    return WillPopScope(child: Scaffold(

      body: Center(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: <Widget>[
            Container(

              child: PageStorage(
                child: _listPage[_selectedTabIndex],
                bucket: bucket,
              ),
            ),
            Container(
              height: 13,
              decoration: BoxDecoration(
                  color: ColorPalette.underlineTextField,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(7), topRight: Radius.circular(7))
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: _bottomNavBar,
    ),onWillPop: () async {
      bool keluar = false;
      await showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: Text("Anda akan keluar"),
            content: Text("Anda yakin untuk keluar?"),
            actions: <Widget>[
              new FlatButton(
                child: new Text(
                    "Ya",
                    style: TextStyle(
                        color: Colors.black38
                    )
                ),
                onPressed: ()=> exit(0),
              ),
              new FlatButton(
                child: new Text("Tidak"),
                onPressed: () {
                  Navigator.pop(context);
                  keluar = false;
                },
              ),

            ],
          )
      );
      return keluar;
    });
  }
}