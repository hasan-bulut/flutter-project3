import 'package:flutter/material.dart';
import 'package:hasan_bulut/filmPage.dart';
import 'package:hasan_bulut/formPage.dart';
import 'package:hasan_bulut/yemekPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FilmPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
