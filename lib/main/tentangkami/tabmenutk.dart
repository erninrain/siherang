import 'package:dlh/animasi/animasi.dart';
import 'package:dlh/animasi/constant.dart';
import 'package:dlh/main/contoh.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:responsive_container/responsive_container.dart';
import 'package:vertical_tabs/vertical_tabs.dart';

class MenuTk extends StatefulWidget {

  @override
  _MenuTk createState() => _MenuTk();
}

class _MenuTk extends State<MenuTk>  {
  int _counter = 0;
  bool hil = false;
  ScrollController _scrollController = new ScrollController();

  void _incrementCounter() {
    setState(() {
      _counter++;

    });
  }

  void _go(){}

  void _jmlh() {
    Navigator.of(context).pushNamed('/jmlhpnsthl');
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController.addListener((){
      if(_scrollController.position.pixels == _scrollController.position.maxScrollExtent)
        _incrementCounter();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ResponsiveContainer(widthPercent: 60,heightPercent: 4.5, child: Text('Tentang Kami', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22), textAlign: TextAlign.center,),),
        elevation: 0,
        backgroundColor: ColorPalette.underlineTextField,
      ),
      body:_menu(), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
  _menu(){
  return VerticalTabs(
    tabsWidth: 100,
    tabs: <Tab>[
      Tab(child: Text('Dasar Hukum')),
      Tab(child: Text('Visi & Misi')),
      Tab(child: Text('Sejarah')),
      Tab(child: InkWell(child: Text('Struktur Bidang'), onTap: (){
        Navigator.push(context, SlideRightRoute(page: MyHomePage()));
      },
        )),
      Tab(child: Text('Struktur Organisasi')),
    ],
    contents: <Widget>[
      ListView(children: <Widget>[
      HtmlWidget(
      '''
        <h2 >Dasar Hukum</h2>
  <table border="0" cellpadding="0" style="width:100%; text-align: justify; ">
  <br>
  <br>
  <tbody>
  <tr>
      <td >
      <p>Dinas Lingkungan Hidup (DLH) Kota Serang dibentuk berdasarkan Peraturan Walikota Serang Nomor 15 Tahun 2017 Tentang Perubahan Kedudukan, Susunan Organisasi, Tugas dan Fungsi serta Tata kerja Dinas Lingkungan Hidup (DLH)  Kota Serang Pasal 3 yang menyebutkan bahwa :</p>
    </td>
    </tr>
    <tr>
    <td >
    <p>Dinas Lingkungan Hidup melaksanakan urusan pemerintahan daerah dibidang lingkungan hidup sesuai dengan visi, misi dan program Walikota sebagaimana terjabarkan dalam Rencana Pembangunan Jangka Menengah Daerah.</p>
    </td>
    </tr>
    </tbody>
    </table>''',
      webView: true,
      ),
      ], padding: EdgeInsets.all(10)),
      ListView(children: <Widget>[
        HtmlWidget(
          '''
          <table border="0" cellpadding="0">
                <tr>
                  <td>
                  <h2>Visi</h2>
                  </td>
                </tr>
                <tr>
                    <td colspan="2" align="left">
                        <p>Bersama Menjaga Kualitas Lingkungan Hidup Kota Serang</p></td>

                </tr>
                <tr>
                    <td colspan="2" align="center"><h2 >Misi</h2></td>
                </tr>
                <tr>
                    <td align="left">
                        <p style="text-align: justify">Meningkatkan kapasitas dan akuntabilitas.</p></td>

                </tr>
                <tr>
                    <td align="left">
                        <p style="text-align: justify">Meningkatkan kualitas lingkungan hidup dan pengelolaan sumberdaya alam</p></td>

                </tr>
                 <tr>
                    <td align="left">
                        <p style="text-align: justify">Meningkatkan kemampuan, kesadaran, kepedulian, dan partisipasi para pemangku kepentingan terhadap fungsi lingkungan hidup </p></td>

                </tr>
                       </table>            
          ''',
          webView: true,
          unsupportedWebViewWorkaroundForIssue37: true,
        )
      ], padding: EdgeInsets.all(10)),
      ListView(children: <Widget>[
        HtmlWidget(
          '''
          <h2 class="hero-heading wow fadeInDown animated animated" data-wow-duration="0.6s" style="visibility: visible; animation-duration: 0.6s;">SEJARAH</h2>
                <table border="0" cellpadding="10" class="hero-text wow bounceInUp animated animated" data-wow-duration="0.9s" data-wow-delay="0.2s" style="visibility: visible; animation-duration: 0.9s; animation-delay: 0.2s;">
                    
                    <tr>
                        <td align="left">
                        <p style="text-align: justify">Dengan diberlakukannya Undang-undang Nomor 22 Tahun 1999 tentang Pemerintahan Daerah dan Peraturan Pemerintah Nomor 25 Tahun 2000 tentang Kewenangan Pemerintah dan Kewenangan Provinsi sebagai Daerah Otonom.
                        Untuk melaksanakan kegiatan pembangunan pada bidang pelestarian  lingkungan hidup, berdasarkan Peraturan Daerah Nomor 10 Tahun 2008 tentang Susunan Organisasi  Lembaga Teknis Daerah Kota Serang yang kemudian diubah dengan Peraturan Daerah Kota Serang
                        Nomor 18 Tahun 2011 tentang Perubahan atas Peraturan Daerah Kota Serang Nomor 10 Tahun 2008 tentang Pembentukan dan Susunan Organisasi Lembaga Teknis Daerah Kota Serang.</p></td>
                    </tr>
                    <tr>
                        <td align="left">
                        <p style="text-align: justify">Pada Tahun 2004 , Undang-Undang Nomor 22 Tahun 1999 tentang Pemerintahan Daerah diganti dengan Undang-Undang Nomor 32 Tahun 2004 tentang Pemerintahan Daerah (Lembaran Negara Republik Indonesia Tahun 2004 Nomor 125,
                        Tambahan Lembaran Negara Republik Indonesia Nomor 4437) sebagaimana telah diubah dengan Undang-Undang Nomor 2 Tahun 2008 tentang tentang Perubahan Kedua Atas Undang-Undang Nomor 32 Tahun 2004 tentang Pemerintahan Daerah (Lembaran Negara Republik Indonesia Tahun 2008 Nomor 59,
                        Tambahan Lembaran Negara Republik Indonesia Nomor 4844) dan berdasarkan Peraturan Pemerintah Nomor 41 Tahun 2007 tentang  Organisasi Perangkat Daerah (Lembaran Negara Republik Indonesia Tahun 2007 Nomor 89, Tambahan Lembaran Negara Republik Indonesia Nomor 4741) . Pada Tahun 2011,
                        nomenklator Kantor Lingkungan Hidup Kota Serang diubah menjadi Badan Lingkungan Hidup Kota Serang berdasarkan Peraturan Daerah Nomor 18 Tahun 2011. Sedangkan Tupoksi diatur pada Peraturan Walikota Nomor 18 tahun 2011 tentang Perubahan atas Peraturan Walikota Nomor 38 Tahun 2008 tentang Tugas Pokok dan Fungsi Lembaga Teknis Daerah Kota Serang.</p></td>
                    </tr>
                </table>
          ''',
          webView: true,
        )
      ], padding: EdgeInsets.all(10)),
      Container(child: Text(''), padding: EdgeInsets.all(20)),
      ListView(children: <Widget>[
        HtmlWidget(
          '''
          <h2 class="hero-heading wow fadeInDown animated animated" data-wow-duration="0.6s" style="visibility: visible; animation-duration: 0.6s;">STRUKTUR ORGANISASI</h2>
            <table border="0" cellpadding="10" class="hero-text wow bounceInUp animated animated" data-wow-duration="0.9s" data-wow-delay="0.2s" style="visibility: visible; animation-duration: 0.9s; animation-delay: 0.2s;">
                <br>
                <br>
                <tr>
                    <td align="left">
                        <img src="https://dlh-serangkota.com/image-resources/dlh/strukdlh.png">
                    </td>
                </tr>

            </table>
          ''',
        )
      ], padding: EdgeInsets.all(10)),
    ],
  );
  }
}