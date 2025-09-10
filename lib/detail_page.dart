import 'package:flutter/material.dart';
import 'movie_model.dart';

class DetailPage extends StatelessWidget {
  final Movie film;

  const DetailPage({Key? key, required this.film}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFDFDFD),
      appBar: AppBar(
        title: Text(film.judul),
      ),
      body: SingleChildScrollView(
  padding: EdgeInsets.all(16),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(
            film.gambarAsset,
            width: 200,
            fit: BoxFit.cover,
          ),
        ),
      ),
      SizedBox(height: 16),

      // 🎭 Genre dan 📅 Tahun
      Row(
        children: [
          Icon(Icons.calendar_today, size: 16, color: Colors.grey[700]),
          SizedBox(width: 6),
          Text(
            film.tahun,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[800],
            ),
          ),
          SizedBox(width: 16),
          Icon(Icons.movie, size: 16, color: Colors.grey[700]),
          SizedBox(width: 6),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: Color(0xFFC5FAD5), // pastel hijau
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              film.genre,
              style: TextStyle(fontSize: 13, color: Colors.black87),
            ),
          ),
        ],
      ),

      SizedBox(height: 24),

      // 📝 Judul bagian sinopsis
      Text(
        'Sinopsis',
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.black87,
        ),
      ),
      SizedBox(height: 8),
      Text(
        film.sinopsis,
        style: TextStyle(
          fontSize: 16,
          height: 1.6,
          color: Colors.black87,
        ),
        textAlign: TextAlign.justify,
      ),
    ],
  ),
      ),
    );
  }
}

