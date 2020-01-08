import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>  {
  int _counter = 0;
  ScrollController _scrollController = new ScrollController();

  void _incrementCounter() {
    setState(() {
      _counter++;

    });
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
        title: Text('contoh'),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: 10 ,
          scrollDirection: Axis.vertical,
          itemBuilder: (BuildContext context, int index) {
            if( index == 5) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'You have clicked the button this many times:',
                  ),
                  Text(
                    '$_counter',
                    style: Theme
                        .of(context)
                        .textTheme
                        .display1,
                  ),
                ],
              );
            }else{
              return SizedBox(width: 100, height: 80,);
            }
          },
          controller: _scrollController,
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}