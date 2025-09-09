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
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomePage(
        favorit: favorit,
        onTambahFavorit: tambahKeFavorit,
      ),
    );
  }
}
