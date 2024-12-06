import 'package:flutter/material.dart';
import 'package:screen_lounge/api/api.dart';
import 'package:screen_lounge/components/carousel_components.dart';
import 'package:screen_lounge/models/movies_model.dart';

class MoviePage extends StatefulWidget {
  const MoviePage({super.key});

  @override
  State<MoviePage> createState() => _MoviePageState();
}

final searchController = TextEditingController();

bool isLoading = true;

MoviesModel? movies;

List<MoviesModel> popularMoviesList = [];
List<MoviesModel> moviesMostVotedList = [];
List<MoviesModel> upCommingList = [];

class _MoviePageState extends State<MoviePage> {
  @override
  void initState() {
    loadingPopularMovies();
    loadingMostVotedMovies();
    loadinUpComming();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ScreenLounge'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Search(searchController: searchController, movies: movies),
            paddingWithTextMoviesInformation('Populares'),
            carouselCustom(context, popularMoviesList),
            paddingWithTextMoviesInformation('Melhores avaliações'),
            carouselCustom(context, moviesMostVotedList),
            paddingWithTextMoviesInformation('Breve'),
            carouselCustom(context, upCommingList),
          ],
        ),
      ),
    );
  }

  Future loadingPopularMovies() async {
    // final movie = await Api().moviesList();
    final popularMovies = await Api().moviesListPopular();

    try {
      setState(() {
        popularMoviesList = popularMovies!;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      throw Exception(e.toString());
    }
  }

  Future loadingMostVotedMovies() async {
    // final movie = await Api().moviesList();
    final moviesMostVoted = await Api().moviesListMostVoted();

    try {
      setState(() {
        moviesMostVotedList = moviesMostVoted!;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      throw Exception(e.toString());
    }
  }

  Future loadinUpComming() async {
    // final movie = await Api().moviesList();
    final upComming = await Api().upComming();

    try {
      setState(() {
        upCommingList = upComming!;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      throw Exception(e.toString());
    }
  }
}
