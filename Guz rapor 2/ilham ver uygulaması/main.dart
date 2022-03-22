import 'package:flutter/material.dart';
void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'İlham Ver'),
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
  @override
  Widget build(BuildContext context) {
    var ekranbilgisi=MediaQuery.of(context);
    final double ekranyuksekligi=ekranbilgisi.size.height;
    final double ekrangenisligi=ekranbilgisi.size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body:
     Column(
    children: [
      Padding(
        padding:  EdgeInsets.only(top:ekranyuksekligi/100,bottom: ekranyuksekligi/100),
        child: SizedBox(
            width: ekrangenisligi/4,
            child: Image.asset("resimler/resim.jpg")
        ),
      ),
      Text("Coğrafya",
      style: TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
        fontSize: ekrangenisligi/25,
      ),
      ),
      Spacer(),
      Text("Coğrafya Kaderdir.",
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: ekrangenisligi/25,
      ),
      ),
      Spacer(),
      Padding(
        padding:  EdgeInsets.only(bottom: ekranyuksekligi/100),
        child: SizedBox(
          width: ekrangenisligi/2,
          height: ekranyuksekligi/15,
          child: RaisedButton(
            child: Text("ILHAM VER",
              style: TextStyle(
    fontSize: ekrangenisligi/25,
    ),
            ),
            onPressed: (){
              print("İlham verildi");
            },
            color: Colors.blue,
            textColor: Colors.white,
          ),
        ),
      ),
    ],
     ),
    );
  }
}
