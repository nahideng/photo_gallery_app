import 'package:flutter/material.dart';
import 'package:photo_gallery_app/page/HomePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Photo Gellary Demo',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}