import 'package:turtletest/core/models/movie.dart';

abstract class MoviesRepository {
  List<Movie> getMovies();
}

class MoviesService implements MoviesRepository {
  @override
  List<Movie> getMovies() {
    // TODO: implement getMovies
    throw UnimplementedError();
  }
  
}
