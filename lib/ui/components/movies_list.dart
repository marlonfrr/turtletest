import 'package:flutter/material.dart';
import 'package:turtletest/core/models/movie.dart';
import 'package:turtletest/ui/size_constraints.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:turtletest/ui/viewmodels/home_viewmodel.dart';

class MoviesList extends StatelessWidget {
  final List<Movie> movies;
  const MoviesList({Key? key, required this.movies}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        shrinkWrap: true,
        itemCount: movies.length,
        separatorBuilder: (context, index) => const Divider(height: 4),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => context.read(homeViewModel).selectMovie(movies[index]),
            child: MovieTile(movie: movies[index]),
          );
        });
  }
}

class MovieTile extends StatelessWidget {
  final Movie movie;
  const MovieTile({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: height * 0.02, horizontal: width * 0.05),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(child: Text(movie.title)),
            const Icon(Icons.arrow_forward_ios),
          ],
        ),
      ),
    );
  }
}
