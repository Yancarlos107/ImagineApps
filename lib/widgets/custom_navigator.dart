import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/ui_provider.dart';

class CustomNavigatorBar extends StatelessWidget {
  CustomNavigatorBar({Key? key}) : super(key: key);
  final List<String> titles = [
    'Popular',
    'Favoritos',
    'Recomendados',
    'Perfil'
  ];
  @override
  Widget build(BuildContext context) {
    final uiProvider = Provider.of<UiProvider>(context);
    return BottomNavigationBar(
      onTap: (int i) {
        uiProvider.selectMenuOpt = i;
        uiProvider.appbarTitle = titles[i];
      },
      elevation: 0,
      currentIndex: uiProvider.selectMenuOpt,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            icon: Icon(Icons.movie_creation_outlined),
            label: 'Populares',
            backgroundColor: Colors.indigo),
        BottomNavigationBarItem(
            icon: Icon(Icons.star_border_outlined),
            label: 'Favoritas',
            backgroundColor: Colors.indigo),
        BottomNavigationBarItem(
            icon: Icon(Icons.recommend),
            label: 'Recomendadas',
            backgroundColor: Colors.indigo),
        BottomNavigationBarItem(
            icon: Icon(Icons.supervised_user_circle_outlined),
            label: 'Perfil',
            backgroundColor: Colors.indigo)
      ],
    );
  }
}
