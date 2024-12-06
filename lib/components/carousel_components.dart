// ignore_for_file: depend_on_referenced_packages
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:screen_lounge/components/details_movie.dart';
import 'package:screen_lounge/models/movies_model.dart';

CarouselSlider carouselCustom(BuildContext context, List movies) {
  return CarouselSlider(
    options: CarouselOptions(
      height: 250,
      autoPlay: true,
      autoPlayInterval: const Duration(
        seconds: 3,
      ),
      autoPlayCurve: Curves.easeInOut,
    ),
    items: movies.map((movie) {
      return InkWell(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (_) => DetailsMovie(movie: movie)));
        },
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 100,
                  height: 70,
                  child: Image.network(
                    movie.poster2,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  movie.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  movie.overView,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 14, color: Colors.grey),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(
                      'Avaliação: ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      movie.vote.toStringAsFixed(2),
                      style: const TextStyle(color: Colors.black87),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    }).toList(),
  );
}

Padding paddingWithTextMoviesInformation(String text) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          text,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ],
    ),
  );
}

// ignore: must_be_immutable
class Search extends StatefulWidget {
  final TextEditingController searchController;
  MoviesModel? movies;
  Search({super.key, required this.searchController, required this.movies});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          suffixIcon: IconButton(
            onPressed: () async {},
            icon: const Icon(Icons.search),
          ),
        ),
        controller: widget.searchController,
      ),
    );
  }
}
