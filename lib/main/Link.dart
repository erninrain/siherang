import 'package:dlh/animasi/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappbrowser/flutter_inappbrowser.dart';
import 'package:responsive_container/responsive_container.dart';

class LinkPage extends StatefulWidget{
  String ur;
  String tit;
  LinkPage({this.tit, this.ur});
  @override
  _LinkPage createState() => _LinkPage();
}
class _LinkPage extends State<LinkPage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ResponsiveContainer(widthPercent: 60,heightPercent: 4.5, child: Text(widget.tit, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22), textAlign: TextAlign.center,),),
        backgroundColor: ColorPalette.underlineTextField,
      ),
      body: InAppWebView(
        initialUrl: widget.ur,
        onWebViewCreated: (InAppWebViewController controller){},
      ),
    );
  }

}
