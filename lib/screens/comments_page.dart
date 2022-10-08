import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram_clone/utils/images.dart';
import 'package:instagram_clone/widgets/post_comment.dart';
import 'package:instagram_clone/widgets/post_title_widget.dart';

import '../models/post_comment.dart';
import '../models/post_model.dart';

class CommentsPage extends StatefulWidget {
  PostModel post;

  CommentsPage({Key? key, required this.post}) : super(key: key);

  @override
  State<CommentsPage> createState() => _CommentsPageState();
}

String newComment = "";
var controller = TextEditingController();

class _CommentsPageState extends State<CommentsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        title: const Text(
          "Comments",
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10).r,
            child: Container(
              width: 21.w,
              height: 21.h,
              child: SvgPicture.asset(MyImages.icon_share),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(height: 12.h),
            PostTitle(post: widget.post, moreTap: () {}),
            SizedBox(height: 12.h),
            const Divider(thickness: 0.6, color: Colors.grey),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12).r,
              child: ListView.builder(
                primary: true,
                shrinkWrap: true,
                itemCount: widget.post.comments.length,
                itemBuilder: (BuildContext context, int index) {
                  return PostCommentWidget(
                      comment: widget.post.comments[index]);
                },
              ),
            ),
            SizedBox(height: 550.h),
            Row(
              children: [
                Container(
                  height: 25.h,
                  width: 25.w,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: NetworkImage("https://i.pravatar.cc/300?img=7"),
                        fit: BoxFit.cover),
                  ),
                ),
                SizedBox(width: 8.w),
                Expanded(
                  child: TextField(
                    controller: controller,
                    onChanged: (value) {
                      setState(() {
                        newComment = value;
                      });
                    },
                    onTap: () {},
                    decoration: const InputDecoration(
                      hintText: 'Add comment...',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                TextButton(
                  style: const ButtonStyle(),
                  onPressed: newComment.isNotEmpty
                      ? () {
                          setState(() {
                            FocusManager.instance.primaryFocus?.unfocus();
                            if (newComment.isNotEmpty) {
                              widget.post.comments.add(
                                PostComment(
                                  "jack",
                                  "",
                                  "$newComment",
                                ),
                              );
                              newComment = "";
                              controller.text = "";
                            }
                          });
                        }
                      : null,
                  child: Text(
                    "Post",
                    style: TextStyle(
                      color: newComment.isNotEmpty
                          ? Colors.blue
                          : Colors.blue.withOpacity(0.5),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
