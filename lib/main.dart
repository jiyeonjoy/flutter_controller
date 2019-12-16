import 'package:flutter/material.dart';
import 'package:flutter_exam1212/base/file_lagger.dart';
import 'package:flutter_exam1212/base/logger.dart';
import 'package:flutter_exam1212/menu.dart';


void main() => runApp(MyApp());




class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Menu(),
    );
  }
}


class MyHomePage extends StatefulWidget {


  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int _counter = 0;
  Logger logger;


 //LoggerPrint logger = LoggerPrint();

  void _incrementCounter() {
    setState(() {
     // logger.logPrint('main', '잘되나?');
      _counter++;
    });
  }
  @override
  void initState() {
    //logger = Logger(context);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
//    logger.d('dddddddddddddddddddddd');
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            child: new Column(
              children: <Widget>[
                SizedBox(
//                  height: SizeConfig.safeBlock,
                ),
              ],
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
