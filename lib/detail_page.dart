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
            Text('Genre: ${film.genre}', style: Theme.of(context).textTheme.bodyMedium),
            Text('Tahun: ${film.tahun}', style: Theme.of(context).textTheme.bodyMedium),
            SizedBox(height: 16),
            Text(film.sinopsis, style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
      ),
    );
  }
}
