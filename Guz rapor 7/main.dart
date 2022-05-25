import 'package:eyardim/hidden_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_nfc_reader/flutter_nfc_reader.dart';
import 'package:eyardim/hata.dart';
import 'package:eyardim/kart1.dart';
import 'package:eyardim/kart2.dart';
import 'package:eyardim/kart3.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme:ThemeData(brightness: Brightness.dark,
      scaffoldBackgroundColor: Colors.transparent,),
      debugShowCheckedModeBanner: false,
      title: 'E-YARDIM',
      home: HiddenDrawer(),
      
    );
  }
}

class NfcScan extends StatefulWidget {
  NfcScan({Key key}) : super(key: key);

  @override
  _NfcScanState createState() => _NfcScanState();
}

class _NfcScanState extends State<NfcScan> {
  static String myVideoId = '7FjS4pHdSMM';

  YoutubePlayerController _controller = YoutubePlayerController(
    initialVideoId: myVideoId,
    flags: YoutubePlayerFlags(
      autoPlay: true,
      mute: false,
    ),
  );
  String nfcId = "";
  TextStyle textStyle = const TextStyle(color: Colors.white);
  List<String> categories = [
    'Epilepsi',
    'Hemofili',
    'Diyabet',
    'Astım',
    'Anafilaksi',
    'Alerjik Hastalıklar',
    'Aşırı Duyarlılık',
    'Kroner Kemik Hastalığı',
    'Hiper Tansiyon',
    '28. Haftadan Sonra Gebelik',
  ];

  @override
  initState() {
    super.initState();

    FlutterNfcReader.onTagDiscovered().listen((onData) {
      print(onData.id);
      print(onData.content);
      setState(() {
        nfcId = "ID (hex): " + onData.id;
        FlutterNfcReader.read().then((value) => {
              print(value.id),
              setState(() {
                nfcId = "ID (hex): " + onData.id;
                if (onData.id == "0x496cb1b2") {//0x49 0x6C 0xB1 0xB2
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Kart1(),
                    ),
                  );
                } else if (onData.id == "0x236a181e") {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Kart2(),
                    ),
                  );
                } else if (onData.id == "0xcc63e538") {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Kart3(),
                    ),
                  );
                } else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Hata(),
                    ),
                  );
                }
              }),
            });
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(
        
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            floating: true,
            expandedHeight: 623,
            backgroundColor: Colors.black,
            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.pin,
              background: Container(
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/logo.png'),
                        fit: BoxFit.cover,
                        alignment: Alignment.topCenter)),
                child: Container(
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Colors.black54, Colors.transparent],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter)),
                  child: Padding(
                    padding: const EdgeInsets.all(30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 4,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                SizedBox(
                  height: 30,
                  child: ListView.builder(
                      itemCount: categories.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          margin: EdgeInsets.only(
                              left: index == 0 ? 5 : 0, right: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(99),
                              border:
                                  Border.all(color: Colors.blueGrey, width: 1)),
                          child: Center(
                            child: Text(categories[index], style: textStyle),
                          ),
                        );
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 30, left: 30, right: 30, bottom: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('E-YARDIM Uygulaması Ne İşe Yarar ?',
                          style: textStyle.copyWith(
                              fontWeight: FontWeight.w700, fontSize: 15)),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                          'E-YARDIM Uygulaması kart taşıması gereken hastaların acil durum anında çevredeki insanların nfc özellikli telefonları ile olay esnasında en hızlı müdahaleyi yapabilmesi için yanındaki kartların okutulmasıyla hastanın ilk yardım ihtiyacını karşılama acıyla oluşturulmuş bir uygulamadır.',
                          style: textStyle),
                      const SizedBox(
                        height: 40,
                      ),
                      Text('LÜTFEN HASTANIN NFC KARTINI OKUTUNUZ...',
                          style: TextStyle(
                            color: Colors.yellowAccent,
                            fontWeight: FontWeight.w700,
                            fontSize: 14,
                          )),
                      const SizedBox(
                        height: 22,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                YoutubePlayer(
                  controller: _controller,
                  liveUIColor: Colors.amber,
                ),
                const SizedBox(
                  height: 40,
                ),
              ],
            ),
          ),
        ],
      ),
    );
    
  }
}
