import 'package:flutter/material.dart';

class Kanamalar extends StatefulWidget {
  const Kanamalar({Key key}) : super(key: key);

  @override
  _KanamalarState createState() => _KanamalarState();
}

class _KanamalarState extends State<Kanamalar> {
  TextStyle textStyle = const TextStyle(color: Colors.white);
  List<String> categories = ['İç Kanama', 'Kulak', 'Burun'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            floating: true,
            expandedHeight: 500,
            backgroundColor: Colors.black,
            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.pin,
              background: Container(
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                            "assets/images/AnaResimlerImages/7.jpg"),
                        fit: BoxFit.cover,
                        alignment: Alignment.topCenter)),
                child: Container(
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Colors.black, Colors.transparent],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter)),
                  child: Padding(
                    padding: const EdgeInsets.all(30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Kanamalarda',
                          style: textStyle.copyWith(
                            fontSize: 42,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Text('İlk Yardım',
                            style: textStyle.copyWith(
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                            ))
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            SizedBox(
              height: 30,
              child: ListView.builder(
                  itemCount: categories.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      margin:
                          EdgeInsets.only(left: index == 0 ? 30 : 0, right: 12),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(99),
                          border: Border.all(color: Colors.white, width: 1)),
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
                  Text('Kanama',
                      style: textStyle.copyWith(
                          fontWeight: FontWeight.w700, fontSize: 18)),
                  const SizedBox(
                    height: 4,
                  ),
                  Text('Damar bütünlüğünün bozulması sonucu kanın damar dışına ( vücut içine ya da dışına ) çıkmasına kanama denir.',style: textStyle),
                  Text('Vücutta Kanın Aktığı Bölgeye Göre Kanamalar',style: textStyle),
                  Text('- Dış kanamalar: Kanın vücut dışına doğru akmasıdır.',style: textStyle),
                  Text('- İç kanamalar: Kanın vücut içine akmasıdır.',style: textStyle),
                  Text('- Doğal deliklerden olan kanamalar: Kulak, burun, ağız, anüs(makat) ve üreme organlarından olan kanamalardır.',style: textStyle),
                  const SizedBox(
                    height: 33,
                  ),
                  Text('Dış kanamalarda ilk yardım',
                      style: textStyle.copyWith(
                          fontWeight: FontWeight.w700, fontSize: 18)),
                  const SizedBox(
                    height: 4,
                  ),
                  Text('- Yara üzerine direkt baskı yapılır,',style: textStyle),
                  Text('- Kanama durmazsa ikinci bir bez konarak basınç arttırılır,',style: textStyle),
                  Text('- Gerekirse bandaj ile sarılarak kanlanmış bezler kaldırılmadan basınç arttırılır,',style: textStyle),
                  Text('- Kanayan bölgeye en yakın basınç noktasına bası uygulanır,',style: textStyle),
                  Text('- Kanayan bölge yukarı kaldırılır,',style: textStyle),
                  Text('- Kanama kol veya bacaklardaysa ve kırık şüphesi yoksa kanama bölgesini kalp hizasından yukarıda tutulur,',style: textStyle),
                  Text('- Şok pozisyonu verilir,',style: textStyle),
                  Text('- Sık sık yaşam bulguları kontrol edilir ( 2-3 dk. arayla ).',style: textStyle),
                  const SizedBox(
                    height: 33,
                  ),
                  Text('Turnike Uygulama Koşulları',
                      style: textStyle.copyWith(
                          fontWeight: FontWeight.w700, fontSize: 18)),
                  const SizedBox(
                    height: 4,
                  ),
                  Text('- Uzuv kopmuşsa,',style: textStyle),
                  Text('- Tüm kanama durdurma uygulamaları yetersiz kalıyorsa,',style: textStyle),
                  Text('- Hasta/yaralının uzun mesafede taşınması gerekiyorsa,',style: textStyle),
                  Text('- Çok sayıda hasta/yaralının bulunduğu ortamda tek ilk yardımcı varsa uygulanır.',style: textStyle),
                  const SizedBox(
                    height: 33,
                  ),
                  Text('İç kanmalarda ilk yardım',
                      style: textStyle.copyWith(
                          fontWeight: FontWeight.w700, fontSize: 18)),
                  const SizedBox(
                    height: 4,
                  ),
                  Text('- Hasta/yaralının bilinci ve solunumu değerlendirilir.',style: textStyle),
                  Text('- Üzeri örtülerek ayakları 30 cm. kaldırılır.',style: textStyle),
                  Text('- Asla ağızdan yiyecek içecek VERİLMEZ.',style: textStyle),
                  Text('- Kapalı kırık varsa, kan damarlarının yaralanmasını önlemek ve bir iç kanamaya sebep olmamak için hasta ya da yaralının hareketsiz kalması sağlanır.',style: textStyle),
                  Text('- Hasta/yaralının Şok Pozisyonunda, yaşamsal değişimleri izlenir.',style: textStyle),
                  Text('- 112 aranarak tıbbi yardım istenir',style: textStyle),
                  const SizedBox(
                    height: 33,
                  ),
                  Text('Burun kanamasında ilk yardım',
                      style: textStyle.copyWith(
                          fontWeight: FontWeight.w700, fontSize: 18)),
                  const SizedBox(
                    height: 4,
                  ),
                  Text('- Öncelikle sakin olunmalıdır.',style: textStyle),
                  Text('- Hemen baş öne doğru eğilir. Mümkünse oturtulur.',style: textStyle),
                  Text('- Burun kanatlarını sıkıştırarak iki parmakla sıkılır.',style: textStyle),
                  Text('- Bu işlem yaklaşık 5 dakika kadar devam edilir.',style: textStyle),
                  Text('- Kanamanın durmaması halinde hasta ya da yaralının en yakın sağlık kuruluşuna götürülmesi gerekir.',style: textStyle),
                  const SizedBox(
                    height: 33,
                  ),
                  Text('Kulak Kanamasında İlk Yardım:',
                      style: textStyle.copyWith(
                          fontWeight: FontWeight.w700, fontSize: 18)),
                  const SizedBox(
                    height: 4,
                  ),
                  Text('- Hafifse temiz bir bezle temizlenir.',style: textStyle),
                  Text('Ciddi ise;',style: textStyle),
                  Text('- Kulak tıkanmadan gazlı bezle kapatılır.',style: textStyle),
                  Text('- Hasta/yaralının hareketsiz olarak, kanayan kulak üzerine yan yatması sağlanır.',style: textStyle),
                  Text('- Tıbbi yardım sağlanır.',style: textStyle),
                  Text('- Unutulmamalıdır ki, kulak kanaması olası bir beyin kanamasının habercisi olabilir.',style: textStyle),
                  const SizedBox(
                    height: 22,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 140,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Container(
                    width: 200,
                    margin:
                        EdgeInsets.only(left: index == 0 ? 30 : 0, right: 15),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        image: DecorationImage(
                            image: AssetImage('assets/images/KanamalarImages/${index + 1}.jpg'),
                            fit: BoxFit.cover)),
                  );
                },
              ),
            ),
            const SizedBox(
              height: 55,
            ),
          ]))
        ],
      ),
    );
  }
}