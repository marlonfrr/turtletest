import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:turtletest/core/models/comment.dart';

// ignore: constant_identifier_names
const COLLECTION_NAME = 'movies';

class CommentsService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  CollectionReference? _movies;

  Stream<DocumentSnapshot<Map<String, dynamic>>> getComments(String movieTitle) {
    return _firestore.collection(COLLECTION_NAME).doc(movieTitle).snapshots();
  }

  Future<void> checkIfDocExists(String movieTitle) async {
    if (!(await (_movies!.doc(movieTitle).get())).exists) {
      await _movies!.doc(movieTitle).set({"comments": []});
    }
  }

  Future<bool> createComment(String? movieTitle, Comment? newComment) async {
    _movies ??= _firestore.collection(COLLECTION_NAME); // referencing the Comments collection .
    try {
      await checkIfDocExists(movieTitle!);
      await _movies!.doc(movieTitle).update({
        'comments': FieldValue.arrayUnion([newComment!.toMap()])
      });
      return true;
    } catch (e) {
      return Future.error(e);
    }
  }
}
