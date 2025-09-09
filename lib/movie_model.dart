class Movie {
  final String judul;
  final String tahun;
  final String genre;
  final String sinopsis;
  final String gambarAsset;
  bool isFavorit; // <-- properti baru

  Movie({
    required this.judul,
    required this.tahun,
    required this.genre,
    required this.sinopsis,
    required this.gambarAsset,
    this.isFavorit = false, // <-- default-nya tidak favorit
  });
}
