import 'package:aplikasi_film/movie_list.dart';
import 'package:flutter/material.dart';
import 'home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Aplikasi Film',
      theme: ThemeData(
    scaffoldBackgroundColor: Color(0xFFFFF1F3), // pastel pink background
    primaryColor: Colors.pink[200],
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.pink[200],
      foregroundColor: Colors.white,
    ),
    colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 187, 46, 93)),
      ),
      home: HomePage(daftarFilm: daftarFilm),
    );
  }
}
