import 'package:flutter/material.dart'; //flutter materail yapısını import ediyoruz.

class KirikCikikBurkulma extends StatefulWidget { //sayfa yapısı için statefulwidget tanımlıyoruz.
  const KirikCikikBurkulma({Key key}) : super(key: key);

  @override
  _KirikCikikBurkulmaState createState() => _KirikCikikBurkulmaState();
}

class _KirikCikikBurkulmaState extends State<KirikCikikBurkulma> {
  TextStyle textStyle = const TextStyle(color: Colors.white);
  List<String> categories = ['Kırık', 'Çıkık', 'Burkulma'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(// sayfa yapısı şeklinde dönüş olmasını istiyoruz
      backgroundColor: Colors.black,
      body: CustomScrollView(//sayfananın aşağı ve yukarı doğru scroll edilmesi için widget tanımı yapıyoruz.
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(// apbar widget tanımını yapıyoruz.
            floating: true,
            expandedHeight: 500,
            //arka plan rengini belirliyoruz
            backgroundColor: Colors.black,
            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.pin,//şifre modundan çalışmasını sağlıyoruz.
              background: Container(// yapıyı sarmalıyoruz.
                decoration: const BoxDecoration(// kutu şeklinde sarmalıyoruz.
                    image: DecorationImage(
                        image: AssetImage(// yapıya üst kısma gelecek şekilde fotoğraf tanımı için yolu veriyoruz.
                            "assets/images/AnaResimlerImages/8.jpg"),
                        fit: BoxFit.cover,
                        alignment: Alignment.bottomCenter)),//resmi ortalıyoruz
                child: Container(// yapıyı sarmalıyoruz
                  decoration: const BoxDecoration(// kutu şeklinde sarmalıyoruz.
                      gradient: LinearGradient(
                          colors: [Colors.black, Colors.transparent],// rengini ayarlıyoruz
                          begin: Alignment.bottomCenter,//yapıyı ortalıyoruz
                          end: Alignment.topCenter)),
                  child: Padding(//sayfa kenarlıklarını veriyoruz
                    padding: const EdgeInsets.all(30),
                    child: Column(// alt alta yapı olması için sütün yapısı veriyoruz.
                    //başlangıç ve bitiş durumlarını ayarlıyoruz.
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //alt alta yazıların yapısı için text yapısı oluşturuyoruz.
                        Text(
                          'Kırık ve Türleri',// ana başlık yapısı giriyoruz ve yazının şekilini yapılandırıyoruz
                          style: textStyle.copyWith(
                            fontSize: 42,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Text('Temel İlk İlkyardım',// alt başlık yapısını giriyoruz ve yazının şekilini yapılandırıyoruz
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
          SliverList( //yapıyı sliverlist ile devam ettiriyoruz
              delegate: SliverChildListDelegate([
            SizedBox(// yapının ayarlamasını yapıyoruz.
              height: 30,
              child: ListView.builder(//kategoriye göre liste yapısı oluşturuyoruz
                  itemCount: categories.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Container(//üst kısımda yazılan kategorileri oval yapıda oluşturuyoruz
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      margin:
                          EdgeInsets.only(left: index == 0 ? 30 : 0, right: 12),
                      decoration: BoxDecoration(// box yapısını oluşturuyoruz ve size ayarlamalarını yapıyoruz.
                          borderRadius: BorderRadius.circular(99),
                          border: Border.all(color: Colors.white, width: 1)),
                      child: Center(// yapıyı ortalıyoruz.
                        child: Text(categories[index], style: textStyle),// text şeklinde yazdırıyoruz
                      ),
                    );
                  }),
            ),
            Padding(//sayfa boşluğunu ayarlıyoruz
              padding: const EdgeInsets.only(// size ayarlamasını yapıyoruz.
                  top: 30, left: 30, right: 30, bottom: 15),
              child: Column(// alt alta gelecek şekilde hastalığın bilgilerini yazıyoruz
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Kırık',// kırık ana başlığı altında yazıyı yazıyoruz
                      style: textStyle.copyWith(
                          fontWeight: FontWeight.w700, fontSize: 18)),
                  const SizedBox(
                    height: 4,
                  ),// kırık yapısı için açıklamaları yazıyoruz.
                  Text('Kemik bütünlüğünün bozulmasıdır. Kırıklar, darbe sonucu ya da kendiliğinden oluşur.',style: textStyle),
                  Text('Kırık çeşitleri',style: textStyle),
                  Text('- Kapalı kırık: Kemik bütünlüğü bozulmuştur. Ancak deri sağlamdır.',style: textStyle),
                  Text('- Açık kırık: Deri bütünlüğü bozulmuştur. Kemik uçları dışarı çıkabilir, beraberinde kanama ve enfeksiyon riski taşırlar.',style: textStyle),
                  Text('- Parçalı kırık: Kemik birden fazla yerden kırılmıştır.',style: textStyle),
                  Text('Kırık belirtileri',style: textStyle),
                  Text('- Bölgenin hareket edilmesi ile artan yoğun ağrı,',style: textStyle),
                  Text('- Şekil bozukluğu ( Diğer sağlam organ ile karşılaştırılır ),',style: textStyle),
                  Text('- Bölgede ödem ve kanama sonucu morarma,',style: textStyle),
                  Text('- İşlev kaybı,',style: textStyle),
                  Text('- Hareketlerde kısıtlama,',style: textStyle),
                  Text('- Şişlik.',style: textStyle),
                  Text('Kırığın yol açabileceği olumsuz durumlar',style: textStyle),
                  Text('- Kırık yakınındaki damar, sinir, kaslarda yaralanma ve sıkışma. ( Kırık bölgede nabız alınamaması, soğukluk, solukluk, aşırı hassasiyet )',style: textStyle),
                  Text('- Parçalı kırıklarda kanamaya bağlı şok.',style: textStyle),
                  Text('- Açık kırıklarda enfeksiyon riski görülebilir.',style: textStyle),
                  Text('Kırıklarda ilk yardım',style: textStyle),
                  Text('- Yaşamı tehdit eden başka yaralanma varsa ona öncelik verilmelidir.',style: textStyle),
                  Text('- Hasta/yaralı hareket ettirilmemelidir.',style: textStyle),
                  Text('- Ani hareketlerden kaçınılmalı, kırık yerine konulmaya çalışılmamalıdır.',style: textStyle),
                  Text('- Kırık kolda ise; ödem oluşacağından yüzük, saat vb. eşyalar çıkartılmalıdır.',style: textStyle),
                  Text('- Kırık olan bölgede hareketi önlemek gerekmektedir.',style: textStyle),
                  Text('- Açık kırık varsa; tespitten önce yara üzeri temiz bir bezle kapatılmalıdır.',style: textStyle),
                  Text('- Kırık olan bölge, bir üst ve bir alt eklemi de içine alacak şekilde karton, tahta vb. sert cisimle tespit edilmelidir.',style: textStyle),
                  Text('- Tespit edilen bölge yukarıda tutularak dinlenmeye alınmalıdır.',style: textStyle),
                  Text('- Kırık bölgede sık aralıklarla nabız, derinin rengi kontrol edilmelidir.',style: textStyle),
                  Text('- Hasta sıcak tutulmalıdır.',style: textStyle),
                  Text('- Tıbbi yardım sağlanmalıdır.',style: textStyle),
                  Text('- Kırık olan bölgenin hareket ettirilmesine izin verilmemelidir.',style: textStyle),
                  
                  const SizedBox(// yazılar arasında boşluk bırakıyoruz.
                    height: 33,
                  ),
                   Text('Burkulma:',// burkulma için başlığı yazdırıyoruz
                      style: textStyle.copyWith(
                          fontWeight: FontWeight.w700, fontSize: 18)),
                  const SizedBox(
                    height: 4,
                  ),//burkulma için açıklama yazısını yazıyoruz
                  Text('Eklem yüzeylerinin anlık olarak ayrılmasıdır',style: textStyle),
                  Text('Burkulmada ilk yardım',style: textStyle),
                  Text('- Sıkıştırıcı bir bandajla burkulan eklem dolaşımı engellemeyecek şekilde tespit edilir.',style: textStyle),
                  Text('- Şişliği azaltmak için bölge yukarı kaldırılır.',style: textStyle),
                  Text('- Soğuk uygulama yapılır.',style: textStyle),
                  Text('- Hareket ettirilmez.',style: textStyle),
                  Text('- Uzun süre geçmiyorsa, tıbbi yardım sağlanır.',style: textStyle),
                  const SizedBox(
                    height: 33,
                  ),
                  Text('Çıkık',// çıkık için büyük fontta başlık oluşturuyoruz.
                      style: textStyle.copyWith(
                          fontWeight: FontWeight.w700, fontSize: 18)),
                  const SizedBox(
                    height: 4,
                  ),// çıkık başlığı için açıklama yapıyoruz
                  Text('- Eklem yüzeylerinin kalıcı olarak ayrılmasıdır',style: textStyle),
                  Text('- Çıkıkta ilk yardım',style: textStyle),
                  Text('- Eklem bulunduğu şekilde tespit edilir.',style: textStyle),
                  Text('- Çıkık yerine asla oturtulmaya çalışılmaz',style: textStyle),
                  Text('- Hasta/yaralıya ağızdan hiçbir şey verilmez.',style: textStyle),
                  Text('- Bölgede; nabız, deri rengi, ısı kontrol edilir.',style: textStyle),
                  Text('- Tıbbi yardım sağlanır. ',style: textStyle),
                  const SizedBox(
                    height: 22,
                  ),
                ],
              ),
            ),
            SizedBox(// yapıyı sarmalıyoruz.
              height: 140,
              child: ListView.builder(//liste yapısı oluşturuyoruz.
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: 3,// yazıların altında bilgilendiri resim olarak 3 adet çıkmasını istiyoruz.
                itemBuilder: (context, index) {
                  return Container(// box şeklinde yapı döndürsün istiyoruz.
                    width: 200,
                    margin:
                        EdgeInsets.only(left: index == 0 ? 30 : 0, right: 15),//resmin ayarlamasını yapıyoruz.
                    decoration: BoxDecoration(//  box şeklinde yapı döndürsün istiyoruz.
                        borderRadius: BorderRadius.circular(12),
                        image: DecorationImage(// resmin yolunu veriyoruz
                            image: AssetImage('assets/images/KirikCikikBurkulmaImages/${index + 1}.jpg'),
                            fit: BoxFit.cover)),
                  );
                },
              ),
            ),
            const SizedBox(//sayfanın alt kısmından boşluk veriyoruz.
              height: 55,
            ),
          ]))
        ],
      ),
    );
  } 
}
