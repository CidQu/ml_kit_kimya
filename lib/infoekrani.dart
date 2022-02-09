import 'dart:io';
import 'package:camera/camera.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class info extends StatefulWidget {
  @override
  _info createState() => _info();
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}

class _info extends State<info> {
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Bilgilendirme',
            style: TextStyle(),
          ),
          backgroundColor: Colors.black,
        ),
        body: Container(
            child: Center(
          child: ScrollConfiguration(
            behavior: MyBehavior(),
            child: ListView(
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    Text(
                      'KVKK',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Center(
                      child: Container(
                        child: Text(
                          "KVKK’nın 5.Maddesinde¹ yer alan bilgiye dayanarak. Herhangi bir kullanıcının verisini o kullanıcıdan habersiz bir şekilde işlemek/internet üzerinde bulundurmak bir suçtur. Yaptığımız uygulama KVKK’nın 5.Maddesine uygun olaraktan hiçbir şekilde kayıt almaz ve tamamen yerel cihazda işleme işlemlerini yapar².\n\nKVKK’nın 8.Maddesinde³ yer alan bilgiye dayanarak. Çekmiş olduğunuz fotoğraflar herhangi bir bulut sistemine/sunucuya/depolama sistemine aktarılmaz, cihazınız işleme işini bitirdikten sonra bir süre cache⁴ olarak telefonda kalır daha sonrasında silinir.",
                          textAlign: TextAlign.center,
                        ),
                        width: 350,
                      ),
                    ),
                    SizedBox(
                      height: 35,
                    ),
                    Text(
                      'Uygulama Nasıl Çalışıyor?',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Center(
                      child: Container(
                        child: Text(
                          "Uygulama'nın ana menüsünde kameranızı göreceksiniz, bu kameraya içinde ne olduğunu merak ettiğiniz herhangi bir eşyayı gösterin, daha sonrasında aşağıdaki beyaz fotoğraf çekme tuşuna bastığınızda yeni açılan ekranda o eşya ile ilgili bilgiler ve doğruluk oranı sizi karşılayacaktır.",
                          textAlign: TextAlign.center,
                        ),
                        width: 350,
                      ),
                    ),
                    SizedBox(
                      height: 35,
                    ),
                    Text(
                      'Nasıl Bir Teknoloji Kullanılıyor?',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Center(
                      child: Container(
                        child: Text(
                          "Fotoğraf çekme tuşuna bastığınız andan itibaren Google Cloud Vision ML Kit kullanılarak gönderdiğiniz fotoğraf sizin kendi cihazınızda işlenir, ve ML Label Kit sayesinde olduğu bulunur. Bu işlem tamamen cihazınızda gerçekleştiği için herhangi bir şekilde hiçbir fotoğrafınız internete yüklenmez, Google servislerince kullanılmaz. İşlendiğiniz fotoğraf tamamen size ait kalır.",
                          textAlign: TextAlign.center,
                        ),
                        width: 350,
                      ),
                    ),
                    SizedBox(
                      height: 35,
                    ),
                    Text(
                      'Doğruluk Oranı Nedir?',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Center(
                      child: Container(
                        child: Text(
                          "Gönderdiğiniz fotoğraflar tamamen sizin cihazınızda işlendiği için Google ML Kit tam gücünü kullanamaz. Bundan dolayı yanlış bir tahmin olma olasılığı doğuyor, bu tahminin yanlış çıkma olasılığını en aza indirmek için telefonunuz Google ile anlık olarak veri alış verişinde bulunur. Bundan dolayı bir doğruluk payı bulunur, bu oran 1.00 ile 0.40 arasında değişir. 0.40'ün altındaki herhangi bir tahmin doğru sayılmadığı için gösterilmez.",
                          textAlign: TextAlign.center,
                        ),
                        width: 350,
                      ),
                    ),
                    SizedBox(
                      height: 35,
                    ),
                    Text(
                      "Kullanılan API'ler",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Center(
                      child: Container(
                        child: Text(
                          "Bulunan Label'ı Türkçeye çevirmek için Google Cloud Translate V2 API'si kullanıyoruz. Daha sonrasında eşya içeriğini ve açıklamasını almak için MediaWiki, Wikipedia API'sini kullanıyoruz. İkisi de tamamen kullanıma açık ve bedavadır, kullanılmasında sorun oluşturacak herhangi bir lisans problemi yoktur. Null Safety ile kurulan bu programda API'ler ile ilgili bir hata oluşursa, depoladığı bilgiler kullanılır veya API hatası net bir şekilde belirtilir.",
                          textAlign: TextAlign.center,
                        ),
                        width: 350,
                      ),
                    ),
                    SizedBox(
                      height: 35,
                    ),
                    Text(
                      "Kullanılan Yazılımlar",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Center(
                      child: Container(
                        child: Text(
                          "Flutter: Uygulama Framework'ü \n\nDart: Yazılım Dili\n\npub.dev/camera: Flutter için kamera plugini\n\npub.dev/google_cloud_ml_kit: Flutter için Google Cloud ML Kit plugini.\n\npub.dev/http: Flutter için API kullanımını sağlayan plugin.\n\nGoogle Play Services: Google ML Kit'in cihazda yerel bir şekilde çalışmasını sağlayan plugin.",
                          textAlign: TextAlign.center,
                        ),
                        width: 350,
                      ),
                    ),
                    SizedBox(
                      height: 35,
                    ),
                    Text(
                      "Lisans",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Center(
                      child: Container(
                        child: Text(
                          "API kullanıımı için, Google Cloud, MediaWiki.",
                          textAlign: TextAlign.center,
                        ),
                        width: 350,
                      ),
                    ),
                    Center(
                      child: Container(
                        child: Text(
                          "Image Labeling için: Google Cloud Vision ML Kit",
                          textAlign: TextAlign.center,
                        ),
                        width: 350,
                      ),
                    ),
                    Center(
                      child: Container(
                        child: Text(
                          "Uygulama Framework'ü ve Yazılım Dili için, Google INC.",
                          textAlign: TextAlign.center,
                        ),
                        width: 350,
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Text(
                      "-\n",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                    Center(
                      child: Container(
                        child: Text(
                          "¹ = KVKK MADDE 5- (1) Kişisel veriler ilgili kişinin açık rızası olmaksızın işlenemez.\n\n² = Bu işleme işlemleri için kullanılan verinin tamamı Google Cloud Services tarafından sağlanır, işleme kısmı tamamen yerel bir şekilde tamamlansa da örnek verilerin alınması için internete ihtiyac duyulması zorunludur.\n\n³ = KVKK MADDE 8- (1) Kişisel veriler, ilgili kişinin açık rızası olmaksızın aktarılamaz.\n\n⁴ = Cihazın kısa süreliğine veriyi kayıtlı tutması.",
                          textAlign: TextAlign.center,
                        ),
                        width: 350,
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                  ],
                ),
              ],
            ),
          ),
        )));
  }
}
