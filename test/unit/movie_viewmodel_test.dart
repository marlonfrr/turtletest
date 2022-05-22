import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:turtletest/core/application/providers.dart';
import 'package:turtletest/core/models/comment.dart';
import 'package:turtletest/core/services/comments_repository.dart';
import 'package:turtletest/ui/viewmodels/movie_viewmodel.dart';

class FakeFirebaseService implements CommentsService {
  static List<Comment> createdComments = [];

  List<Comment> get comments => createdComments;

  @override
  Future<bool> createComment(String? movieTitle, Comment? newComment) {
    createdComments.add(newComment!);
    return Future(() => true);
  }

  @override
  noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

void main() {
  group('Test movie ViewModel behavior', () {
    final firebaseInstance = FakeFirebaseService();
    tearDown(() => {firebaseInstance.comments.clear()});
    final container = ProviderContainer(
      overrides: [
        commentsRepositoryProvider.overrideWithProvider(
          Provider.autoDispose((ref) => firebaseInstance),
        )
      ],
    );
    test('Initial comments list is empty', () async {
      expect(firebaseInstance.comments.length, 0);
    });
    test('Add 1 comment and gets added to the list', () async {
      await container.read(movieViewModel).createComment('movie title', TextEditingController(text: 'comment1'), ScrollController());
      expect(firebaseInstance.comments.length, 1);
    });
    test('Add 2 comments and gets added to the list', () async {
      await container.read(movieViewModel).createComment('movie title', TextEditingController(text: 'comment 2'), ScrollController());
      await container.read(movieViewModel).createComment('movie title', TextEditingController(text: 'comment 3'), ScrollController());
      expect(firebaseInstance.comments.length, 2);
    });
    test('Tries to add an empty comment, nothing should be added to the list', () async {
      await container.read(movieViewModel).createComment('movie title', TextEditingController(text: ''), ScrollController());
      expect(firebaseInstance.comments.length, 0);
    });
  });
}
