import 'package:flutter/material.dart';
import 'movie_model.dart';

class DetailPage extends StatelessWidget {
  final Movie film;
  final bool sudahFavorit;
  final Function(Movie) onTambahFavorit;
  
   DetailPage({
    required this.film,
    required this.sudahFavorit,
    required this.onTambahFavorit,
    Key? key,
  }) : super(key: key);

  final Color backgroundColor = Color(0xFFF7F6F3);
  final Color primaryColor = Color(0xFF6B4C9A);
  final Color textColor = Color(0xFF3E3A45);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
        elevation: 0,
        title: Text(film.judul),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: Image.network(
                  film.gambarUrl,
                  height: 320,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              film.judul,
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: primaryColor,
              ),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                _chipInfo('Tahun', film.tahun),
                SizedBox(width: 10),
                _chipInfo('Genre', film.genre),
              ],
            ),
            SizedBox(height: 25),
            Text(
              'Sinopsis',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
                color: textColor,
              ),
            ),
            SizedBox(height: 8),
            Text(
              film.sinopsis,
              style: TextStyle(
                fontSize: 17,
                height: 1.5,
                color: textColor.withOpacity(0.9),
              ),
            ),
            SizedBox(height: 40),
            Center(
              child: ElevatedButton.icon(
                onPressed: sudahFavorit
                    ? null
                    : () {
                        onTambahFavorit(film);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('${film.judul} berhasil ditambahkan ke favorit!'),
                            backgroundColor: primaryColor.withOpacity(0.8),
                          ),
                        );
                        Navigator.pop(context);
                      },
                icon: Icon(
                  sudahFavorit ? Icons.favorite : Icons.favorite_border,
                  color: Colors.white,
                ),
                label: Text(
                  sudahFavorit ? 'Sudah di Favorit' : 'Tambah ke Favorit',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 14),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _chipInfo(String label, String value) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 6, horizontal: 16),
      decoration: BoxDecoration(
        color: primaryColor.withOpacity(0.15),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        '$label: $value',
        style: TextStyle(
          color: primaryColor,
          fontWeight: FontWeight.w600,
          fontSize: 14,
        ),
      ),
    );
  }
}
