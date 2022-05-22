import 'package:turtletest/core/models/movie.dart';
import 'package:turtletest/core/services/movies_repository.dart';

class FakeMoviesRepository implements MoviesRepository {
  final List<Map<String, dynamic>> mockMovies;

  FakeMoviesRepository({required this.mockMovies});

  @override
  Future<List<Movie>?> getMovies() async {
    return Future(() => List.from(mockMovies.map((e) => Movie.fromMap(e))));
  }
}
