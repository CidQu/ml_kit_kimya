import 'dart:convert';
import 'dart:io';
import 'package:camera/camera.dart';
import 'package:camera_app/infoekrani.dart';
import 'package:camera_app/yanlisekran.dart';
import 'package:flutter/material.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:http/http.dart' as http;
import 'bilgiekrani.dart';
import 'package:html/parser.dart';

class CameraScreen extends StatefulWidget {
  final List<CameraDescription> cameras;
  const CameraScreen({
    Key? key,
    required this.cameras,
  }) : super(key: key);

  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  @override
  void initState() {
    initializeCamera(selectedCamera);
    super.initState();
  }

  late CameraController _controller;
  late Future<void> _initializeControllerFuture;
  int selectedCamera = 0;
  List<File> capturedImages = [];
  ImageLabeler imageLabeler = GoogleMlKit.vision.imageLabeler();
  bool isBusy = false;
  CustomPaint? customPaint;

  initializeCamera(int cameraIndex) async {
    _controller = CameraController(
      widget.cameras[cameraIndex],
      ResolutionPreset.medium,
    );
    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  kameraDenetimi(inputImage) async {
    await Future.delayed(Duration(milliseconds: 50));
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("İşleniyor.."), duration: const Duration(seconds: 2)));
    final List<ImageLabel> labels = await imageLabeler.processImage(inputImage);
    isBusy = false;
    for (ImageLabel label in labels) {
      var sonuc = label.label;
      var confidence = label.confidence;
      var oran = confidence.toStringAsFixed(2);
      wikibilgileri(sonuc, oran);
    }
  }

  wikibilgileri(sonuc, oran) async {
    var transurl = Uri.parse(
        'https://translation.googleapis.com/language/translate/v2?key=AIzaSyCZq3sA4fYlXomz9RZx2VjIBey_0TYCKlw');
    var response = await http.post(transurl,
        body: {'q': sonuc, 'source': 'en', 'target': 'tr', 'format': 'text'});
    if (response.statusCode == 200) {
      var harita = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
      var ceviri = harita['data']['translations'].last['translatedText'];
      print(ceviri);
      if (ceviri == "sofra takımı") {
        ceviri == 'Pet Şişe';
        var res = await http.Client()
            .get(Uri.parse('https://sozluk.gov.tr/gts?ara=$ceviri'));
        var body = res.body;
        var decoded = jsonDecode(body);
        var json = decoded[0];
        var sozlukanlam = json["anlamlarListe"][0]["anlam"];
        print(sozlukanlam);
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => BilgiEkraniYanlis(
                    sonuc: ceviri, oran: oran, wikibilgi: sozlukanlam)));
      }
      if (ceviri == 'metal') {
        ceviri == 'metal';
        var res = await http.Client()
            .get(Uri.parse('https://sozluk.gov.tr/gts?ara=$ceviri'));
        var body = res.body;
        var decoded = jsonDecode(body);
        var json = decoded[0];
        var sozlukanlam = json["anlamlarListe"][0]["anlam"];
        print(sozlukanlam);
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => BilgiEkraniYanlis(
                    sonuc: ceviri, oran: oran, wikibilgi: sozlukanlam)));
      }
      var res = await http.Client()
          .get(Uri.parse('https://sozluk.gov.tr/gts?ara=$ceviri'));
      var body = res.body;
      var decoded = jsonDecode(body);
      var json = decoded[0];
      var sozlukanlam = json["anlamlarListe"][0]["anlam"];
      print(sozlukanlam);
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => BilgiEkrani(
                  sonuc: ceviri, oran: oran, wikibilgi: sozlukanlam)));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("GOOGLE TRANSLATE API HATASI"),
          duration: const Duration(seconds: 2)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          FutureBuilder<void>(
            future: _initializeControllerFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return CameraPreview(_controller);
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    if (widget.cameras.length > 1) {
                      setState(() {
                        selectedCamera = selectedCamera == 0 ? 1 : 0;
                        initializeCamera(selectedCamera);
                      });
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text('Ön Kamera Bulunamadı'),
                        duration: const Duration(seconds: 2),
                      ));
                    }
                  },
                  icon: Icon(Icons.switch_camera_rounded, color: Colors.white),
                ),
                GestureDetector(
                  onTap: () async {
                    if (isBusy == false) {
                      await _initializeControllerFuture;
                      var xFile = await _controller.takePicture();
                      capturedImages.add(File(xFile.path));
                      final inputImage = InputImage.fromFile(File(xFile.path));
                      kameraDenetimi(inputImage);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content:
                            Text('Halihazırda bir işlem var lütfen bekleyin.'),
                        duration: const Duration(seconds: 2),
                      ));
                    }
                  },
                  child: Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                  ),
                ),
                IconButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => info()));
                    },
                    icon: Icon(Icons.info_outline),
                    color: Colors.white)
              ],
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
