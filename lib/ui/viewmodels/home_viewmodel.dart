import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:turtletest/core/injector.dart';
import 'package:turtletest/core/models/movie.dart';
import 'package:turtletest/core/services/navigation_servide.dart';
import 'package:turtletest/ui/views/movie/movie.dart';

final homeViewModel = Provider.autoDispose((ref) => HomeViewModel());

class HomeViewModel {
  void selectMovie(Movie movie) {
    // Any business logic or analytics record...

    injector<NavigationService>().push(
      MaterialPageRoute(
          builder: (context) => MovieView(
                movieTitle: movie.title,
              )),
    );
  }
}
