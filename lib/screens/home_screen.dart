import 'package:flutter/material.dart';
import 'package:peliculas/screens/favorites.dart';
import 'package:peliculas/screens/popular_page.dart';
import 'package:peliculas/screens/profile.dart';
import 'package:peliculas/screens/recom_page.dart';
import 'package:peliculas/widgets/custom_navigator.dart';
import 'package:provider/provider.dart';

import '../providers/movies_provider.dart';
import '../providers/ui_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context);
    final uiProvider = Provider.of<UiProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(uiProvider.appbarTitle),
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (_) {
                      return AlertDialog(
                        title: const Text('Desea salir ahora?'),
                        actions: [
                          TextButton(
                              onPressed: () => Navigator.of(context).pop(),
                              child: const Text('Si, deseo salir')),
                          TextButton(
                              onPressed: () => Navigator.of(context).pop(),
                              child: const Text('No, aun no'))
                        ],
                      );
                    });
              },
              icon: const Icon(Icons.close_rounded))
        ],
      ),
      body: const _HomeScreenBody(),
      bottomNavigationBar: CustomNavigatorBar(),
    );
  }
}

class _HomeScreenBody extends StatelessWidget {
  const _HomeScreenBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final uiProvider = Provider.of<UiProvider>(context);
    final currentIndex = uiProvider.selectMenuOpt;

    switch (currentIndex) {
      case 0:
        return const PopularScreen();
      case 1:
        return const FavoriteScreen();
      case 2:
        return const RecommendScreen();
      case 3:
        return const ProfileScreen();
      default:
        return const PopularScreen();
    }
  }
}
