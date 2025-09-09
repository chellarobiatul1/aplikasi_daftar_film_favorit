import 'package:flutter/material.dart';
import 'movie_model.dart';
import 'detail_page.dart';
import 'movie_list.dart';

class HomePage extends StatelessWidget {
  final List<Movie> favorit;
  final Function(Movie) onTambahFavorit;

  const HomePage({
    Key? key,
    required this.favorit,
    required this.onTambahFavorit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar Film'),
      ),
      body: ListView.builder(
        itemCount: daftarFilm.length,
        itemBuilder: (context, index) {
          final film = daftarFilm[index];
          return Card(
            color: Theme.of(context).cardColor,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            elevation: 2,
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
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
              title: Text(film.judul, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              subtitle: Text('${film.tahun} • ${film.genre}'),
              trailing: IconButton(
                icon: Icon(
                  Icons.favorite,
                  color: favorit.contains(film) ? Colors.red : Colors.grey,
                ),
                onPressed: () {
                  onTambahFavorit(film);
                },
              ),
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
