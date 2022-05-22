import 'package:flutter/material.dart';//flutter materail yapısını import ediyoruz.

class Kart1 extends StatefulWidget {//sayfa yapısı için statefulwidget tanımlıyoruz.
  const Kart1({Key key}) : super(key: key);

  @override
  _Kart1State createState() => _Kart1State();
}

class _Kart1State extends State<Kart1> {
  TextStyle textStyle = const TextStyle(color: Colors.white);// yazınının tipini rengini oluşturuyoruz.
  List<String> categories = ['Ahmet Demir', '0 Rh+', '21 Yaş'];// hastanın bilgilendirme amaçlı yaş,kan ve isim soyisimini ekrana yazıyoruz.

  @override
  Widget build(BuildContext context) {
    return Scaffold(// sayfa yapısı şeklinde dönüş olmasını istiyoruz.
      backgroundColor: Colors.black,
      body: CustomScrollView(//sayfananın aşağı ve yukarı doğru scroll edilmesi için widget tanımı yapıyoruz.
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(// silverapbar widget tanımını yapıyoruz.
            floating: true,
            expandedHeight: 500,//yükselik boşluğunu ayarlıyoruz.
            backgroundColor: Colors.black,//arka plan rengini belirliyoruz
            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.pin,//şifre modundan çalışmasını sağlıyoruz.
              background: Container(// yapıyı conteiner sarmalıyoruz.
                decoration: const BoxDecoration(// kutu şeklinde sarmalayıp oluşmasını istiyoruz.
                    image: DecorationImage(// yapıya üst kısma gelecek şekilde fotoğraf tanımı için yolu veriyoruz.
                        image: NetworkImage(
                            "https://travma.gen.tr/images/beyin-travmasi.jpg"),//resmin yolunu veriyoruz.
                        fit: BoxFit.cover,//resmi ortalıyoruz.
                        alignment: Alignment.topCenter)),//resmin ortalanmasını istiyoruz.
                child: Container(// yapıyı conteiner sarmalıyoruz
                  decoration: const BoxDecoration(// kutu şeklinde oluşmasını isityoruz.
                      gradient: LinearGradient(
                          colors: [Colors.black, Colors.transparent],// rengini transparan olarak ayarlıyoruz.
                          begin: Alignment.bottomCenter,// yapıyı ortalıyoruz.
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
                          'Epilepsi',// ana başlık yapısı giriyoruz ve yazının şekilini yapılandırıyoruz
                          style: textStyle.copyWith(
                            fontSize: 42,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Text('Diğer adıyla Sara',///alt başlık yapısını giriyoruz ve yazının şekilini yapılandırıyoruz.
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
            SizedBox(// yapının sizedbox ile devam ettiriyoruz.
              height: 30,// yüksekliği veriyoruz.
              child: ListView.builder(//hasta bilgilerine göre liste yapısı oluşturuyoruz
                  itemCount: categories.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Container(//üst kısımda yazılan kategorileri oval yapıda oluşturuyoruz
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      margin:
                          EdgeInsets.only(left: index == 0 ? 30 : 0, right: 12),//size ayarlıyoruz.
                      decoration: BoxDecoration(// box yapısını oluşturuyoruz ve size ayarlamalarını yapıyoruz.
                          borderRadius: BorderRadius.circular(99),
                          border: Border.all(color: Colors.white, width: 1)),//box yapısının rengini ayarlıyoruz
                      child: Center(//yapıyı ortalıyoruz.
                        child: Text(categories[index], style: textStyle),//verilen bilgileri yazdırıyoruz.
                      ),
                    );
                  }),
            ),
            Padding(//sayfa boşluğunu ayarlıyoruz.
              padding: const EdgeInsets.only(// size ayarlamasını yapıyoruz.
                  top: 30, left: 30, right: 30, bottom: 15),
              child: Column(// alt alta gelecek şekilde hastalığın bilgilerini yazıyoruz.
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Nedir ?',// hastalık ile açıklama ana başlığı altında yazıyı yazıyoruz.
                      style: textStyle.copyWith(//yazının görsel öğelerini ayarlıyoruz.
                          fontWeight: FontWeight.w700, fontSize: 18)),
                  const SizedBox(//başlık ile açıklama arasında boşluk oluşturuyoruz.
                    height: 4,
                  ),
                  Text( //hastalığa ait açıklama kısmını oluşturuyoruz.
                      'Epilepsi halk arasında sara hastalığı olarak da bilinen kronik (uzun süreli) bir hastalıktır. Epilepside beyinde bulunan nöronlarda ani ve kontrolsüz boşalmalar (deşarjlar) olur. Bunun sonucunda hastada istemsiz kasılmalar, duyusal değişiklikler ve bilinç değişiklikleri meydana gelir. Epilepsi nöbetler halinde olan bir hastalıktır. Nöbet aralarında hasta sağlıklıdır. Hayatında yalnızca bir nöbet geçiren hasta, epilepsi hastası olarak kabul edilmez.',
                      style: textStyle),
                  const SizedBox(//başlık ile açıklama arasında boşluk oluşturuyoruz.
                    height: 33,
                  ),
                  Text('İlk Yardım',// nasıl ilk yardım yapılacağına dair ana başlığı oluşturuyoruz.
                      style: textStyle.copyWith(
                          fontWeight: FontWeight.w700, fontSize: 18)),
                  const SizedBox(//başlık ile açıklama arasında boşluk oluşturuyoruz.
                    height: 4,
                  ),
                  Text(// başlığın açıklamasını ayarlıyoruz.
                      'Büyük nöbet denen jeneralize kasılmalı, sıçramalı nöbette, nöbet geçiren kişi ayakta ise yere düşerken kafası yere çarpmasın diye koltuğa doğru iterek veya başına destek vererek yumuşak şekilde yere düşmesi sağlanabilir. Yerde hastanın başını bir yana çevirmek gereklidir. Başı yan çevirmek kişinin kusması durumunda akciğerlerine kusmuğunun kaçmasını önler.',
                      style: textStyle),
                  const SizedBox(//başlık ile açıklama arasında boşluk oluşturuyoruz.
                    height: 22,
                  ),
                ],
              ),
            ),
            SizedBox(// yapıyı sizedebox ile sarmalıyoruz.
              height: 140,// yüksekliği ayarlıyoruz.
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
                        image: DecorationImage(
                            image: AssetImage('assets/images/Kart1Images/${index + 1}.jpg'),// resmin yolunu veriyoruz
                            fit: BoxFit.cover)),
                  );
                },
              ),
            ),
            const SizedBox(// sayfa sonu ve resimler arasında boşluk oluşturuyoruz.
              height: 55,
            ),
          ]))
        ],
      ),
    );
  }
}
