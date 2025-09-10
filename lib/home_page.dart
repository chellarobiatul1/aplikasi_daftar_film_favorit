import 'package:flutter/material.dart';
import 'movie_model.dart';
import 'detail_page.dart';
import 'favorite_page.dart';

class HomePage extends StatefulWidget {
  final List<Movie> daftarFilm;

  const HomePage({
    Key? key,
    required this.daftarFilm,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void toggleFavorit(Movie film) {
    setState(() {
      film.isFavorit = !film.isFavorit;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Movie> favorit = widget.daftarFilm.where((film) => film.isFavorit).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar Film'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 8),
        color: Color(0xFFFFF1F3), // pastel pink background
        child: ListView.builder(
          itemCount: widget.daftarFilm.length,
          itemBuilder: (context, index) {
            final film = widget.daftarFilm[index];
            return Card(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              elevation: 3,
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
                title: Text(
                  film.judul,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(255, 127, 46, 81),
                  ),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 4),
                    Row(
                      children: [
                        Icon(
                          Icons.calendar_today,
                          size: 14,
                          color: const Color.fromARGB(255, 0, 0, 0),
                        ),
                        SizedBox(width: 4),
                        Text(
                          film.tahun,
                          style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),
                        ),
                      ],
                    ),
                    SizedBox(height: 2),
                    Row(
                      children: [
                        Icon(Icons.movie, size: 14, color: const Color.fromARGB(255, 0, 0, 0)),
                        SizedBox(width: 4),
                        Expanded(
                          child: Text(
                            film.genre,
                            style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                trailing: IconButton(
                  icon: Icon(
                    film.isFavorit ? Icons.favorite : Icons.favorite_border,
                    color: film.isFavorit ? const Color.fromARGB(255, 191, 36, 36) : Colors.grey,
                  ),
                  onPressed: () {
                    toggleFavorit(film);
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
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SizedBox(
          width: double.infinity,
          height: 50,
          child: ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.pink[200],
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            icon: Icon(Icons.favorite),
            label: Text('Lihat Favorit'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FavoritePage(favorit: favorit),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
