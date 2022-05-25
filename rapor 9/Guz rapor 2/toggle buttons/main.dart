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
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'TOGGLE BUTTON'),
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
   var toggledurum=[false,true,false];
   var secilentogindex=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ToggleButtons(
              children: [
                Icon(Icons.looks_one),
                Icon(Icons.looks_two),
                Icon(Icons.looks_3),
              ],
              isSelected: toggledurum,
              color: Colors.yellow,
              selectedColor: Colors.pink,
              fillColor: Colors.blue,
              onPressed: (int secilenindex){

                secilentogindex=secilenindex;
                print("${secilenindex+1}. togg seçildi");

                setState(() {
                  toggledurum[secilenindex]=!toggledurum[secilenindex];
                });
              },
            ),
            RaisedButton(
              child: Text("Göster"),
              onPressed: (){
                print("En son ${secilentogindex+1}. togg seçildi");
              },
            ),
          ],
        ),
      ),

    );
  }
}
