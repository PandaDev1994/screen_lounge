// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:screen_lounge/models/movies_model.dart';
import 'package:intl/intl.dart';

class DetailsMovie extends StatefulWidget {
  final MoviesModel movie;
  const DetailsMovie({super.key, required this.movie});

  @override
  State<DetailsMovie> createState() => _DetailsMovieState();
}

class _DetailsMovieState extends State<DetailsMovie> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.movie.title,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 3,
          left: 3,
          right: 3,
        ),
        child: Column(
          children: [
            Container(
              height: 300,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                      widget.movie.poster2,
                    ),
                    fit: BoxFit.cover),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              widget.movie.overView,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                const Text(
                  'Data de lançamento : ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  convertDate(
                    widget.movie.date,
                  ),
                  style: const TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const Spacer(),
            Row(
              children: [
                const Text(
                  'Avaliação : ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  widget.movie.vote.toStringAsFixed(1),
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {
                    setState(() {
                      widget.movie.toogleFavorite();
                    });
                  },
                  icon: Icon(
                    widget.movie.isFavorte ? Icons.star : Icons.star_border,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  convertDate(String date) {
    try {
      DateTime parserDate = DateTime.parse(date);

      return DateFormat('dd/MM/yyyy').format(parserDate);
    } catch (e) {
      return 'Data inválida';
    }
  }
}
