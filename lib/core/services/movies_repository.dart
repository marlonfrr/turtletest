import 'package:dio/dio.dart';
import 'package:turtletest/core/constants/endpoints.dart';
import 'package:turtletest/core/injector.dart';
import 'package:turtletest/core/models/movie.dart';

abstract class MoviesRepository {
  Future<List<Movie>?> getMovies();
}

class MoviesService implements MoviesRepository {
  @override
  Future<List<Movie>?> getMovies() async {
    const url = baseUrl + moviesPath;
    try {
      Response response = await injector<Dio>().get(url);
      List<dynamic> rawMovies = response.data;
      return List.from(rawMovies.map((e) => Movie.fromMap(e)));
    } on DioError catch (_) {
      return null;
    }
  }
}
