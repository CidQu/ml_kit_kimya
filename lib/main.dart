import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'kameraekrani.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final cameras = await availableCameras();
  runApp(MyApp(cameras: cameras));
}

class MyApp extends StatelessWidget {
  final List<CameraDescription> cameras;
  const MyApp({Key? key, required this.cameras}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kimya Tübitak',
      home: CameraScreen(
        cameras: cameras,
      ),
    );
  }
}
