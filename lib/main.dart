import 'package:flutter/material.dart';
import 'movie_model.dart';
import 'home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Movie> favorit = [];

  void tambahKeFavorit(Movie film) {
    setState(() {
      if (!favorit.contains(film)) {
        favorit.add(film);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplikasi Film',
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFFFDFDFD),
        colorScheme: ColorScheme.light(
          primary: Color(0xFFA7C7E7),
          secondary: Color(0xFFF7C8E0),
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xFFA7C7E7),
          foregroundColor: Colors.black,
          elevation: 0,
          centerTitle: true,
        ),
        textTheme: TextTheme(
          titleLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
          bodyMedium: TextStyle(fontSize: 16, color: Colors.black87),
        ),
        cardColor: Color(0xFFF7C8E0),
        useMaterial3: true,
      ),
      home: HomePage(
        favorit: favorit,
        onTambahFavorit: tambahKeFavorit,
      ),
    );
  }
}
