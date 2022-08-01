import 'package:flutter/material.dart';

import 'package:peliculas/widgets/widgets.dart';
import 'package:provider/provider.dart';

import '../providers/movies_provider.dart';

class PopularScreen extends StatelessWidget {
  const PopularScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context);

    return SingleChildScrollView(
      child: Column(
        children: [
          //Tarjetas principales
          CardSwiper(movies: moviesProvider.onDisplaysMovies),
          //Slider de peliculas
        ],
      ),
    );
  }
}
