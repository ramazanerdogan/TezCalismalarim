import 'package:flutter/material.dart'; //material dart kısmını import ediyoruz.

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MyApp(),
      theme: ThemeData(fontFamily: 'Urbanist'),//tema için atamamızı yapıyoruz.
    ));

class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextStyle textStyle = const TextStyle(color: Colors.white); // uygulama yazı tipini belirliyoruz.
  List<String> categories = ['Action', 'Adventure', 'Fantasy']; // fotoğraf altında bulunacak kategorileri belirliyoruz.

 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, //arka planı siyah yapıyoruz.
      body: CustomScrollView(// ekranın kaydırılması için özelliği veriyoruz.
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            floating: true,
            expandedHeight: 500,
            backgroundColor: Colors.black,//arka planı siyah yapıyoruz.
            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.pin,// modu belirliyoruz.
              background: Container(
                decoration: const BoxDecoration(//kare görünüm veriyoruz.
                    image: DecorationImage(
                        image: AssetImage('assets/images/shangchi.jpg'),// resim için yol veriyoruz.
                        fit: BoxFit.cover,
                        alignment: Alignment.topCenter)),
                child: Container(// kare bir yapı oluşturuyoruz
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Colors.black, Colors.transparent],//renklendirmesini yapıyoruz.
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter)),
                  child: Padding(
                    padding: const EdgeInsets.all(30), // boşluk veriyoruz.
                    child: Column(// tanımlanan satırı sayfaya ortalıyoruz.
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(// hastalık ile bilgi vermek için ismi yazıyoruz
                          'Shang-Chi',
                          //hastalık isminin text ayaranı yapıyoruz.
                          style: textStyle.copyWith(
                            fontSize: 42,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        const SizedBox(// textten sonra boşluk bırakıyoruz.
                          height: 4,
                        ),
                        //hastalık altına alt başlık için text ve ayarlamasını yapıyoruz.
                        Text('and The Legend of The Ten Rings',
                            style: textStyle.copyWith(
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                            ))],),),),),),),
          SliverList(
              delegate: SliverChildListDelegate([
            SizedBox(
              height: 30,
              child: ListView.builder(// list yapısını kullanıyoruz.
                  itemCount: categories.length,
                  // kategori uzunluğu kadar yanyana kare kutu oluşturmak gerekli işlemleri yapıyoruz.
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
                        child: Text(categories[index], style: textStyle),//kategori ismini ve yazı sitilini belirliyoruz.
                      ),
                    );
                  }),
            ),
            Padding(//boşluk veriyoruz
              padding: const EdgeInsets.only(
                  top: 30, left: 30, right: 30, bottom: 15),
              child: Column(
                //hastalığın açıklayıcı metninin düzenlemelerini yapıyoruz.
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      'Shang-Chi, the master of weaponry-based Kung Fu, is forced to confront his past after being drawn into the Ten Rings organization.',
                      style: textStyle),
                  const SizedBox(
                    height: 12,
                  ),
                  // hastalık alt başlığı için text yapısı belirtiyoruz.
                  Text('Director',
                      style: textStyle.copyWith(
                          fontWeight: FontWeight.w700, fontSize: 18)),
                  const SizedBox(
                    height: 4,
                  ),
                  // hastalık alt başlığı için text yapısı belirtiyoruz.
                  Text('Destin Daniel Cretton', style: textStyle),
                  const SizedBox(
                    height: 12,
                  ),
                  // hastalık alt başlığı için text yapısı belirtiyoruz.
                  Text('Writters',
                      style: textStyle.copyWith(
                          fontWeight: FontWeight.w700, fontSize: 18)),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                      'Dave Callaham (screenplay by) . Destin Daniel Cretton (screenplay by) . Andrew Lanham(screenplay by)',
                      style: textStyle),
                  const SizedBox(
                    height: 12,
                  ),
// hastalık alt başlığı için text yapısı belirtiyoruz.
                  Text('Stars',
                      style: textStyle.copyWith(
                          fontWeight: FontWeight.w700, fontSize: 18)),
                  const SizedBox(
                    height: 4,
                  ),
                  Text('Simu Liu, Awkwafina, Tony Chiu-Wai Leung',
                      style: textStyle),
                  const SizedBox(
                    height: 12,
                  ),
// fotoğtaflar.
                  Text('Photos',
                      style: textStyle.copyWith(
                          fontWeight: FontWeight.w700, fontSize: 18)),
                ],),),
            SizedBox(
              height: 140,
              //yazılardan sonra boşluk vererek bilgilendirici resimler için ;resim boyutlarını ve konumlarını ayarlıyoruz.
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Container(
                    width: 200,
                    margin:
                        EdgeInsets.only(left: index == 0 ? 30 : 0, right: 15),
                    decoration: BoxDecoration(// kare düzende olması için alan belirliyoruz.
                        borderRadius: BorderRadius.circular(12),
                        image: DecorationImage(
                            image: AssetImage('assets/images/${index + 1}.jpg'),// indexe göre resmi belirliyoruz
                            fit: BoxFit.cover)),
                  );},),),
            const SizedBox(// son boşluğu vererek tamamlıyoruz.
              height: 30,
            ),]))],),);}}
