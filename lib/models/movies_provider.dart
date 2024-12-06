import 'package:flutter/material.dart';
import 'movies_model.dart';

class MoviesProvider with ChangeNotifier {
  final List<MoviesModel> _movies = [];

  List<MoviesModel> get movies => _movies;

  void addMovie(MoviesModel movie) {
    _movies.add(movie);
    notifyListeners(); // Notifica os ouvintes para atualizar a UI
  }

  void toggleFavorite(MoviesModel movie) {
    try {
      movie.isFavorte = !movie.isFavorte;
      ChangeNotifier();
      print(movie.isFavorte);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
