import 'package:flutter/material.dart';
import 'movie_model.dart';
import 'detail_page.dart';

class FavoritePage extends StatelessWidget {
  final List<Movie> favorit;

  const FavoritePage({Key? key, required this.favorit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Film Favorit'),
      ),
      body: favorit.isEmpty
          ? Center(
              child: Text(
                'Belum ada film favorit.',
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            )
          : ListView.builder(
              itemCount: favorit.length,
              itemBuilder: (context, index) {
                final film = favorit[index];
                return Card(
                  color: Colors.white,
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                  child: ListTile(
                    contentPadding: EdgeInsets.all(12),
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        film.gambarAsset,
                        width: 60,
                        height: 90,
                        fit: BoxFit.cover,
                      ),
                    ),
                    title: Text(film.judul,
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Text('${film.tahun} • ${film.genre}'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailPage(film: film),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
    );
  }
}
