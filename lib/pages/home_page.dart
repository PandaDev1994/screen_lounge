import 'package:flutter/material.dart';
import 'package:screen_lounge/components/body_movie_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Screen Lounge'),
      ),
      body: const Column(
        children: [
          SizedBox(
            height: 50,
          ),
          MoviePage()
        ],
      ),
    );
  }
}
