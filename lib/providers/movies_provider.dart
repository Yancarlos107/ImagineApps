import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:peliculas/models/now_playing.dart';
import '../models/movie.dart';

class MoviesProvider extends ChangeNotifier {
  final String _baseUrl = 'api.themoviedb.org';
  final String _apiKey = '305dda9a38d756b2b85972bf74e17f2a';
  final String _language = 'es-ES';

  List<Movie> onDisplaysMovies = [];
  List<Movie> onPopularMovies = [];
  int _popularPage = 0;

  MoviesProvider() {
    getNowPlayingMovies();
  }

  Future<String> _getJsonData(String endpoint, [int page = 1]) async {
    var url = Uri.https(_baseUrl, endpoint,
        {'api_key': _apiKey, 'language': _language, 'page': '$page'});
    final response = await http.get(url);
    return response.body;
  }

  //metodo para crear peticionesd get a un api
  getNowPlayingMovies() async {
    final jsonData = await _getJsonData('3/movie/now_playing');
    final nowPlayingResponse = NowPlaying.fromJson(jsonData);
    onDisplaysMovies = nowPlayingResponse.results;
    notifyListeners();
  }
}
