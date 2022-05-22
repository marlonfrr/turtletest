import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:turtletest/core/models/movie.dart';
import 'package:turtletest/core/services/movies_repository.dart';

class MoviesNotifier extends StateNotifier<AsyncValue<List<Movie>>> {
  final MoviesRepository _moviesRepository;
  MoviesNotifier(this._moviesRepository) : super(const AsyncValue.loading()) {
    getMovies();
  }

  Future<void> getMovies() async {
    final result = await _moviesRepository.getMovies();
    if (result != null) {
      state = AsyncValue.data(result);
    } else {
      state = AsyncValue.error('');
    }
  }
}
