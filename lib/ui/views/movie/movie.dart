import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:turtletest/core/application/providers.dart';
import 'package:turtletest/ui/components/comment_input.dart';
import 'package:turtletest/ui/components/comments_list.dart';

class MovieView extends StatefulWidget {
  final String movieTitle;

  const MovieView({Key? key, required this.movieTitle}) : super(key: key);

  @override
  State<MovieView> createState() => _MovieViewState();
}

class _MovieViewState extends State<MovieView> {
  final TextEditingController _inputController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.movieTitle)),
      body: SafeArea(
        child: Column(
          children: [
            Consumer(
              builder: (context, watch, child) {
                final commentsState = watch(commentsStreamProvider(widget.movieTitle));
                return commentsState.when(data: (comments) {
                  return Flexible(child: CommentsList(comments: comments, scrollController: _scrollController));
                }, loading: () {
                  return const Expanded(child: Center(child: Text('Loading...')));
                }, error: (err, st) {
                  return const Expanded(child: Center(child: Text('An error ocurred')));
                });
              },
            ),
            CommentInput(inputController: _inputController, movieTitle: widget.movieTitle, scrollController: _scrollController)
          ],
        ),
      ),
    );
  }
}
