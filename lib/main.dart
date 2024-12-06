import 'package:flutter/material.dart';
import 'package:screen_lounge/components/body_movie_page.dart';
import 'package:provider/provider.dart';
import 'package:screen_lounge/models/movies_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => MoviesProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Screen Lounge',
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.blue,
            centerTitle: true,
            titleTextStyle: TextStyle(
              fontSize: 22,
            ),
          ),
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MoviePage(),
      ),
    );
  }
}
