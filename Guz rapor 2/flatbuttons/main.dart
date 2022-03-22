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
      home: MyHomePage(title: 'Flutter Demo Home Page'),
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
   var ulkeler=["TÜRKİYE","ALMANYA","İTALYA","RUSYA","ÇİN"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: GridView.builder(

        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2/1,

        ),

        itemCount: ulkeler.length,
        itemBuilder: (context,indeks){
          return GestureDetector(
            onTap: (){
              print("${ulkeler[indeks]} seçildi.");
            },
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                        onTap: (){
                          print("Text ile ${ulkeler[indeks]} seçildi.");
                        },
                        child: Text(ulkeler[indeks])),
                    Spacer(),
                    FlatButton(
                      child: Text("Ülke Seç"),
                      textColor: Colors.red,
                      onPressed: (){
                        print("Button ile ${ulkeler[indeks]} seçildi.");
                      },
                    ),
                  ],
                ),
              ),
            ),
          );

        },
      ),
    );
  }
}
