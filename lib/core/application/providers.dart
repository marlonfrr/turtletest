import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:turtletest/core/application/movies_notifier.dart';
import 'package:turtletest/core/services/comments_repository.dart';
import 'package:turtletest/core/services/movies_repository.dart';

final moviesRepositoryProvider = Provider<MoviesRepository>((ref) => MoviesService());

final commentsRepositoryProvider = Provider((ref) => CommentsService());

final moviesProvider = StateNotifierProvider<MoviesNotifier>((ref) => MoviesNotifier(ref.watch(moviesRepositoryProvider)));

final commentsStreamProvider = StreamProvider.family((ref, String movieTitle) {
  return ref.read(commentsRepositoryProvider).getComments(movieTitle);
});
