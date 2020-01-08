import 'package:dlh/animasi/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

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
    return WebviewScaffold(
      url: widget.ur,
      hidden: true,
      appBar: AppBar(title: Text(widget.tit), backgroundColor: ColorPalette.underlineTextField,),
    );
  }

}
