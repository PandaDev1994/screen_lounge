// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';

import 'package:screen_lounge/models/movies_model.dart';
import 'package:http/http.dart' as http;

class Api {
  final String key = 'cea1cbe3';
  final String key2 = 'd75e3bd19d418d4609699b5aa4befcb2';

  // d75e3bd19d418d4609699b5aa4befcb2
  // eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJkNzVlM2JkMTlkNDE4ZDQ2MDk2OTliNWFhNGJlZmNiMiIsIm5iZiI6MTczMzIzODU1MS4wNTcsInN1YiI6IjY3NGYxZjE3YWE4NDRkYzZlZTk0NjU0NyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.zWgkCxaoZmPJk5-Mn8QaMxIm_jL5UtpYcjBsbPaijOE

  Future<List<MoviesModel>?> moviesListPopular() async {
    final url = Uri.parse(
      // 'https://api.themoviedb.org/3/movie/88?api_key=$key2',
      'https://api.themoviedb.org/3/movie/popular?language=en-US&page=1',
    );

    final response = await http.get(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJkNzVlM2JkMTlkNDE4ZDQ2MDk2OTliNWFhNGJlZmNiMiIsIm5iZiI6MTczMzIzODU1MS4wNTcsInN1YiI6IjY3NGYxZjE3YWE4NDRkYzZlZTk0NjU0NyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.zWgkCxaoZmPJk5-Mn8QaMxIm_jL5UtpYcjBsbPaijOE',
        'accept': 'application/json'
      },
    );
    try {
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);

        if (data['results'] != null) {
          final List<dynamic> results = data['results'];

          return results.map((movie) => MoviesModel.fromJson(movie)).toList();
        }

        return null;
      } else {
        throw Exception(
            'Erro na API: ${response.statusCode} - ${response.reasonPhrase}');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<List<MoviesModel>?> moviesListMostVoted() async {
    final url = Uri.parse(
      // 'https://api.themoviedb.org/3/movie/88?api_key=$key2',
      'https://api.themoviedb.org/3/movie/top_rated?language=en-US&page=1',
    );

    final response = await http.get(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJkNzVlM2JkMTlkNDE4ZDQ2MDk2OTliNWFhNGJlZmNiMiIsIm5iZiI6MTczMzIzODU1MS4wNTcsInN1YiI6IjY3NGYxZjE3YWE4NDRkYzZlZTk0NjU0NyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.zWgkCxaoZmPJk5-Mn8QaMxIm_jL5UtpYcjBsbPaijOE',
        'accept': 'application/json'
      },
    );
    try {
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);

        if (data['results'] != null) {
          final List<dynamic> results = data['results'];

          return results.map((movie) => MoviesModel.fromJson(movie)).toList();
        }

        return null;
      } else {
        throw Exception(
            'Erro na API: ${response.statusCode} - ${response.reasonPhrase}');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<List<MoviesModel>?> upComming() async {
    final url = Uri.parse(
      // 'https://api.themoviedb.org/3/movie/88?api_key=$key2',
      'https://api.themoviedb.org/3/movie/upcoming?language=en-US&page=1',
    );

    final response = await http.get(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJkNzVlM2JkMTlkNDE4ZDQ2MDk2OTliNWFhNGJlZmNiMiIsIm5iZiI6MTczMzIzODU1MS4wNTcsInN1YiI6IjY3NGYxZjE3YWE4NDRkYzZlZTk0NjU0NyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.zWgkCxaoZmPJk5-Mn8QaMxIm_jL5UtpYcjBsbPaijOE',
        'accept': 'application/json'
      },
    );
    try {
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);

        if (data['results'] != null) {
          final List<dynamic> results = data['results'];

          return results.map((movie) => MoviesModel.fromJson(movie)).toList();
        }

        return null;
      } else {
        throw Exception(
            'Erro na API: ${response.statusCode} - ${response.reasonPhrase}');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
