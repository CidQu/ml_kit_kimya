import 'dart:io';
import 'package:camera/camera.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class BilgiEkrani extends StatefulWidget {
  @override
  _BilgiEkrani createState() => _BilgiEkrani();
}

class _BilgiEkrani extends State<BilgiEkrani> {
  _BilgiEkrani();
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Masa'),
      ),
      body: Container(
        child: ListView(
          children: [
            Column(
              children: [
                SizedBox(height: 25),
                Icon(
                  Icons.cancel,
                  color: Colors.green,
                  size: 150,
                ),
                SizedBox(
                  height: 15,
                ),
                Text('Bu madde çevreye ZARARLI DEĞİL!',
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 25,
                    )),
                SizedBox(height: 10),
                Text('Doğruluk Oranı: 0.67'),
                SizedBox(height: 35),
                Text(
                  'Masa',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                Center(
                  child: Row(
                    children: [
                      SizedBox(
                        width: 80,
                      ),
                      Container(
                        child: Center(
                          child: Text(
                            'Ayaklar veya bir destek üzerine oturtulmuş tabladan oluşan mobilya.',
                            style: TextStyle(),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        width: 250,
                        height: 100,
                        decoration: BoxDecoration(
                            color: Colors.green.withOpacity(0.5),
                            border: Border.all(
                                color: Colors.greenAccent.withOpacity(0.5)),
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                      ),
                      SizedBox(
                        width: 50,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: Text(
                    'İçeriği',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Center(
                  child: Row(
                    children: [
                      SizedBox(
                        width: 80,
                      ),
                      Container(
                        child: Center(
                          child: Text(
                            "Masalar genelde ağaçlardan,metallerden ya da plastikten yapılır. Plastikten yapılan masalar kültürümüzde çok yaygın olarak bulunmazlar, genellikle ahşap masalar tercih edilir. Masanın sağlamlığı için metaller tercih edilirken egzotik açıdan ağaçlar tercih edilir. Ağaç türlerinden yapılması doğa ile geri dönüşüm için çok güzel bir örnektir.",
                            style: TextStyle(),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        width: 250,
                        height: 220,
                        decoration: BoxDecoration(
                            color: Colors.green.withOpacity(0.5),
                            border: Border.all(
                                color: Colors.greenAccent.withOpacity(0.5)),
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                      ),
                      SizedBox(
                        width: 50,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: Text(
                    'Oluşturan Elementler',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Center(
                  child: Row(
                    children: [
                      SizedBox(
                        width: 80,
                      ),
                      Container(
                        child: Center(
                          child: Text(
                            "Tahtanın element içeriklerine göre kimyasal analizi yapıldığında yaklaşık olarak %50 karbon, %42 oksijen, %6 hidrojen, %1 azot (nitrojen) ve %1 oranında diğer elementler (kalsiyum, potasyum, sodyum, magnezyum, demir ve manganez gibi) içerdiği görülür.",
                            style: TextStyle(),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        width: 250,
                        height: 170,
                        decoration: BoxDecoration(
                            color: Colors.green.withOpacity(0.5),
                            border: Border.all(
                                color: Colors.greenAccent.withOpacity(0.5)),
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                      ),
                      SizedBox(
                        width: 50,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
