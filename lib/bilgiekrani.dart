import 'dart:io';
import 'package:camera/camera.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class BilgiEkrani extends StatefulWidget {
  final String sonuc;
  final String oran;
  final String wikibilgi;
  BilgiEkrani(
      {required this.sonuc, required this.oran, required this.wikibilgi});

  @override
  _BilgiEkrani createState() => _BilgiEkrani(sonuc, oran, wikibilgi);
}

class _BilgiEkrani extends State<BilgiEkrani> {
  _BilgiEkrani(String sonuc, String oran, String wikibilgi);
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(widget.sonuc),
      ),
      body: Container(
        child: Column(
          children: [
            SizedBox(height: 25),
            Icon(
              Icons.verified_rounded,
              color: Colors.green,
              size: 150,
            ),
            SizedBox(
              height: 15,
            ),
            Text('Bu madde çevreye zararlı değil!',
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 25,
                )),
            SizedBox(height: 10),
            Text('Doğruluk Oranı: ${widget.oran}'),
            SizedBox(height: 35),
            Text(
              widget.sonuc,
              style: TextStyle(color: Colors.black, fontSize: 22),
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
                        widget.wikibilgi,
                        style: TextStyle(),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    width: 250,
                    height: 250,
                    decoration: BoxDecoration(
                        color: Colors.green.withOpacity(0.5),
                        border: Border.all(
                            color: Colors.greenAccent.withOpacity(0.5)),
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                  ),
                  SizedBox(
                    width: 50,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
