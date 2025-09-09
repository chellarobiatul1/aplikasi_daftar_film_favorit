import 'package:flutter/material.dart';
import 'movie_model.dart';
import 'movie_list.dart';
import 'detail_page.dart';

class HomePage extends StatelessWidget {
  final List<Movie> favorit;
  final Function(Movie) onTambahFavorit;

   HomePage({
    required this.favorit,
    required this.onTambahFavorit,
    Key? key,
  }) : super(key: key);

  final Color backgroundColor = Color(0xFFF7F6F3);
  final Color cardColor = Color(0xFFF0E6F6);
  final Color primaryColor = Color(0xFF6B4C9A);
  final Color textColor = Color(0xFF3E3A45);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
        elevation: 0,
        title: Text(
          'Daftar Film Favorit',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 22,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        itemCount: daftarFilm.length,
        itemBuilder: (context, index) {
          final film = daftarFilm[index];
          return Container(
            margin: EdgeInsets.only(bottom: 16),
            child: Material(
              color: cardColor,
              borderRadius: BorderRadius.circular(20),
              elevation: 3,
              child: InkWell(
                borderRadius: BorderRadius.circular(20),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => DetailPage(
                        film: film,
                        sudahFavorit: favorit.contains(film),
                        onTambahFavorit: onTambahFavorit,
                      ),
                    ),
                  );
                },
                child: Padding(
                  padding: EdgeInsets.all(12),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.network(
                          film.gambarUrl,
                          width: 80,
                          height: 120,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(width: 20),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              film.judul,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: textColor,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              'Tahun: ${film.tahun}',
                              style: TextStyle(
                                fontSize: 16,
                                color: textColor.withOpacity(0.7),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: primaryColor.withOpacity(0.7),
                        size: 20,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
