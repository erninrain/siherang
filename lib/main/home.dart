import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:dlh/animasi/animasi.dart';
import 'package:dlh/animasi/constant.dart';
import 'package:dlh/main/akun.dart';
import 'package:dlh/main/berita.dart';
import 'package:dlh/main/Link.dart';
import 'package:dlh/main/contoh.dart';
import 'package:dlh/main/dokling/amdal.dart';
import 'package:dlh/main/dokling/sppl.dart';
import 'package:dlh/main/dokling/ukl.dart';
import 'package:dlh/main/informasi_data/infodata.dart';
import 'package:dlh/main/pengaduan/pengaduan.dart';
import 'package:dlh/main/sipal/sipal.dart';
import 'package:dlh/main/tentangkami/tabmenutk.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_container/responsive_container.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:http/http.dart' as http;

import 'artikelpage.dart';
class Beranda extends StatefulWidget{
    _Beranda createState() => _Beranda();
}

class _Beranda extends State<Beranda>{
  bool loading=false;
  String Judul = '';
  String nmmenu ='';
  List total = new List();
  var ikon;
  var tujuan;
  @override
  void initState() {
    super.initState();
    kaon();
  }
  Future<void> kaon() async {
      setState(() {
        loading=true;
      });
      final response = await http.get(linknya.urlbase + "app/artikel?page=1" );
      var jsson = jsonDecode(response.body);
      var data = jsson['data']['data'];
      print('home');
      setState(() {
        loading = false;
        total.addAll(data);
      });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        leading: Padding(padding: EdgeInsets.only(left: 0),),
        iconTheme: IconThemeData(color: ColorPalette.underlineTextField),
        title: ResponsiveContainer(widthPercent: 60,heightPercent: 4.5, child: Text('Beranda', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22), textAlign: TextAlign.center,),),
        backgroundColor: ColorPalette.underlineTextField,
      ),
      body:loading == true ? _buildProgressIndicator(): RefreshIndicator(
        child:  ResponsiveContainer(
          widthPercent: 100,
          heightPercent: 100,
          child: ListView(
            children: <Widget>[
              _body()
            ],
          ),
        ),
        onRefresh: kaon,
      ),
    );


  }

  _body(){
    return Column(
        children: <Widget>[
          Padding(padding: EdgeInsets.only(top: 10),),
          _slider(),
              _tentang()
        ],
    );
  }

  _padding(){
    return Padding(
      padding: EdgeInsets.only(top: 20),
    );
  }

  _tentang(){
    return ResponsiveContainer(
      widthPercent: 100,
      heightPercent: 60,
      padding: EdgeInsets.only(top:20,left: 20,right: 20),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                onPressed: ()async{
                  Navigator.push(context, SlideRightRoute(page: MenuTk()));
                },
                padding: EdgeInsets.all(0),
                child: _menu(ikon=Icons.supervisor_account,nmmenu='Tentang Kami'),
              ),
              FlatButton(
                onPressed: ()async{
                  Navigator.push(context, SlideRightRoute(page: LinkPage(ur: 'https://dlh-serangkota.com/mobile/cilowong', tit: 'Cilowong',)));
                },
                padding: EdgeInsets.all(0),
                child: _menu(ikon=Icons.restore_from_trash,nmmenu='TPAS Cilowong'),
              ),
              FlatButton(
                onPressed: ()async{
                  Navigator.push(context, SlideRightRoute(page: InfoData()));
                },
                padding: EdgeInsets.all(0),
                child: _menu(ikon=Icons.library_books,nmmenu='Informasi Data'),
              )
            ],
          ),
          _padding(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                onPressed: ()async{
                  Navigator.push(context, SlideRightRoute(page: SpplPage(ur: 'https://dlh-serangkota.com/mobile/sppl', tit: 'SPPL')));
                },
                padding: EdgeInsets.all(0),
                child: _menu(ikon=Icons.border_color,nmmenu='SPPL'),
              ),
              FlatButton(
                onPressed: ()async{
                  Navigator.push(context, SlideRightRoute(page: uklPage(ur: 'https://dlh-serangkota.com/mobile/uklupl', tit: 'UKL UPL',)));
                },
                padding: EdgeInsets.all(0),
                child: _menu(ikon=Icons.view_list,nmmenu='UKL UPL'),
              ),
              FlatButton(
                onPressed: ()async{
                  Navigator.push(context, SlideRightRoute(page: amdalPage(ur: 'https://dlh-serangkota.com/mobile/amdal', tit: 'AMDAL',)));
                },
                padding: EdgeInsets.all(0),
                child: _menu(ikon=Icons.wb_auto,nmmenu='AMDAL'),
              )
            ],
          ),
          _padding(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                onPressed: ()async{
                  Navigator.push(context, SlideRightRoute(page: PengaduanMaps()));
                },
                padding: EdgeInsets.all(0),
                child: _menu(ikon=Icons.assignment,nmmenu='Pengaduan'),
              ),
              FlatButton(
                onPressed: ()async{
                  Navigator.push(context, SlideRightRoute(page: sipalPage()));
                },
                padding: EdgeInsets.all(0),
                child: _menu(ikon=Icons.textsms,nmmenu='SIPAL'),
              ),
            ],
          )
        ],
      ),
    );
  }

  _menu(IconData iconData, String s){
    return ResponsiveContainer(
      widthPercent: 29,
      heightPercent: 15,
      padding: EdgeInsets.only(left: 5,right: 5),
      child: Container(
        padding: EdgeInsets.all(2),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow:[ BoxShadow(color: Colors.grey, spreadRadius: 0.5,offset: Offset(3.0,4.0), blurRadius: 5)],
          border: Border.all(color: ColorPalette.underlineTextField, width: 3),
          borderRadius: BorderRadius.circular(10),
        ),
        child:Column(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            Icon(ikon, color: ColorPalette.underlineTextField, size: 50,),
            AutoSizeText(nmmenu,maxFontSize:12, minFontSize: 11,style: TextStyle(color: ColorPalette.underlineTextField, fontWeight: FontWeight.bold), textAlign: TextAlign.center,)
          ],
        ),
      ),
    );
  }
  _slider(){
    return CarouselSlider.builder(
      itemCount: 4,
      enableInfiniteScroll: true,
      reverse: false,
      autoPlay: true,
      autoPlayInterval: Duration(seconds: 3),
      autoPlayAnimationDuration: Duration(milliseconds: 800),
      aspectRatio: 16/9,
      viewportFraction: 0.8,
      enlargeCenterPage: true,
      itemBuilder: (BuildContext context, int itemIndex) =>
          InkWell(
            onTap: () {
              Navigator.push(context, SlideRightRoute(page: ArtikelPage(
                  id: total[itemIndex]['id'],
                  judul: Judul = 'Pojok Warta LH',
                  tipe: 1)));
              print('ok');
            },
            child: ResponsiveContainer(
                widthPercent: 78,
                heightPercent: 5,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                          color: ColorPalette.underlineTextField,
                          border: Border.all(color: ColorPalette.underlineTextField, width: 3),
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                              image: NetworkImage('http://dlh-serangkota.com/upload/artikel/' +
                                  total[itemIndex]['foto']),
                              fit: BoxFit.cover
                          )
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
                          color: ColorPalette.underlineTextField
                      ),
                      child: AutoSizeText(total[itemIndex]['judul'], textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
                    )
                  ],
                )
            ),
          ),
    );
  }
  _buildProgressIndicator() {
    return new Padding(
      padding: const EdgeInsets.all(8.0),
      child: new Center(
        child: new Opacity(
          opacity: loading == true ? 1.0:0,
          child: new CircularProgressIndicator(),
        ),
      ),
    );
  }

}