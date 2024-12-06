import 'package:flutter/material.dart';

class MoviesModel with ChangeNotifier {
  final int? id;
  final String title;
  final String overView;
  final String poster2;
  final double vote;
  final String date;
  bool isFavorte;

  MoviesModel({
    this.id,
    required this.title,
    required this.overView,
    required this.poster2,
    required this.vote,
    required this.date,
    this.isFavorte = false,
  });

  void toogleFavorite() {
    isFavorte = !isFavorte;
    notifyListeners();
  }

  factory MoviesModel.fromJson(Map<String, dynamic> json) {
    return MoviesModel(
      id: json['id'] ?? 0,
      title: json['original_title'] ?? '',
      overView: json['overview'] ?? '',
      poster2: json['poster_path'] != null
          ? 'https://image.tmdb.org/t/p/w200${json['poster_path']}'
          : '',
      vote: json['vote_average'] ?? '',
      date: json['release_date'] ?? '',
    );
  }
}
