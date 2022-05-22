import 'package:flutter/material.dart';
import 'package:turtletest/ui/size_constraints.dart';
import 'package:turtletest/ui/viewmodels/movie_viewmodel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CommentInput extends StatelessWidget {
  final TextEditingController _inputController;
  final ScrollController _scrollController;
  final String movieTitle;

  const CommentInput({Key? key, required inputController, required scrollController, required this.movieTitle})
      : _inputController = inputController,
        _scrollController = scrollController,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: width * 0.02, vertical: height * 0.02),
      width: width,
      color: Colors.grey.shade100,
      child: TextField(
        controller: _inputController,
        style: const TextStyle(fontSize: 14),
        autofocus: true,
        decoration: InputDecoration(
          isDense: true,
          filled: true,
          suffixIcon: GestureDetector(
            onTap: () => context.read(movieViewModel).createComment(movieTitle, _inputController, _scrollController),
            child: Container(
              padding: EdgeInsets.symmetric(vertical: height * 0.01),
              height: height * 0.04,
              width: height * 0.1,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(height),
                color: Colors.blue.shade300,
              ),
              child: const Center(child: Text('Submit')),
            ),
          ),
          suffixIconConstraints: BoxConstraints(maxWidth: height),
          contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
          hintText: "Write comment...",
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(color: Colors.transparent, width: 0),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(color: Colors.transparent, width: 0),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(color: Colors.transparent, width: 0),
          ),
        ),
      ),
    );
  }
}
