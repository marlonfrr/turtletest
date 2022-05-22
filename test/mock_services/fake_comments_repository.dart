import 'package:turtletest/core/models/comment.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:turtletest/core/services/comments_repository.dart';

class FakeCommentsRepository implements CommentsService {
  final List<Map<String, dynamic>> mockComments;

  FakeCommentsRepository({required this.mockComments});

  @override
  Future<void> checkIfDocExists(String movieTitle) {
    // TODO: implement checkIfDocExists
    throw UnimplementedError();
  }

  @override
  Future<bool> createComment(String? movieTitle, Comment? newComment) {
    // TODO: implement createComment
    throw UnimplementedError();
  }

  @override
  Stream<DocumentSnapshot<Map<String, dynamic>>> getComments(String movieTitle) {
    // TODO: implement getComments
    throw UnimplementedError();
  }
}
