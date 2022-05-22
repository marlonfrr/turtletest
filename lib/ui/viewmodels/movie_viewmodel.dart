import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:turtletest/core/application/providers.dart';
import 'package:turtletest/core/models/comment.dart';

final movieViewModel = Provider.autoDispose((ref) => MovieViewModel(ref.read));

class MovieViewModel {
  final Reader _reader;
  MovieViewModel(this._reader);

  Future<void> createComment(String movieId, TextEditingController textController, ScrollController scrollController) async {
    final String text = textController.text;
    if (text.trim().isEmpty) return;
    final Comment newComment = Comment(comment: text, timestamp: DateTime.now().millisecondsSinceEpoch);
    await _reader(commentsRepositoryProvider).createComment(movieId, newComment);
    textController.clear();
    if (scrollController.positions.isNotEmpty) {
      scrollController.animateTo(scrollController.position.maxScrollExtent, duration: const Duration(milliseconds: 200), curve: Curves.ease);
    }
  }
}
