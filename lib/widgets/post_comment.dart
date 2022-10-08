import 'package:flutter/material.dart';
import 'package:instagram_clone/models/post_comment.dart';

class PostCommentWidget extends StatelessWidget {
  PostComment comment;

  PostCommentWidget({
    Key? key,
    required this.comment,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(children: [
        TextSpan(
          text: "${comment.userName}  ",
          style: const TextStyle(
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),
        TextSpan(
          text: comment.comment,
          style: const TextStyle(
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ),
        ),
      ]),
    );
  }
}
