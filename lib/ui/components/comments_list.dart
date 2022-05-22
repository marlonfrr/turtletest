import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:turtletest/ui/size_constraints.dart';

class CommentsList extends StatelessWidget {
  final DocumentSnapshot<Map<String, dynamic>> comments;
  final ScrollController scrollController;

  const CommentsList({Key? key, required this.comments, required this.scrollController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        controller: scrollController,
        shrinkWrap: false,
        itemCount: comments.data() != null ? comments.data()!['comments'].length : 0,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.symmetric(vertical: height * 0.01, horizontal: width * 0.02),
            decoration: BoxDecoration(color: Colors.grey.shade200, borderRadius: BorderRadius.circular(18)),
            padding: EdgeInsets.symmetric(vertical: height * 0.02, horizontal: width * 0.05),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                    child: Text(
                  (comments.data()!['comments'] as List).elementAt(index)['comment'],
                )),
              ],
            ),
          );
        });
  }
}
