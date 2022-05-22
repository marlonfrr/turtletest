import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:turtletest/core/application/providers.dart';
import 'package:turtletest/ui/components/movies_list.dart';
import 'package:turtletest/ui/size_constraints.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(title: const Text("Movies")),
        body: SafeArea(
          child: Consumer(
            builder: (context, watch, child) {
              final moviesState = watch(moviesProvider.state);
              return moviesState.when(data: (movies) {
                return MoviesList(movies: movies);
              }, loading: () {
                return const Center(child: Text('Loading...'));
              }, error: (err, st) {
                return const Center(child: Text('An error ocurred'));
              });
            },
          ),
        ));
  }
}
