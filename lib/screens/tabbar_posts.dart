import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:instagram_clone/models/profile_post_model.dart';
import 'package:instagram_clone/utils/colors.dart';

class TabBar_Posts extends StatefulWidget {
  const TabBar_Posts({super.key});

  @override
  State<TabBar_Posts> createState() => _TabBar_PostsState();
}

class _TabBar_PostsState extends State<TabBar_Posts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: GridView.builder(
          primary: false,
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3),
          itemBuilder: (BuildContext context, int index) {
            return ProfileMethod(Profile_Posts.profilePosts[index]);
          },
          itemCount: Profile_Posts.profilePosts.length,
        ),
      ),
    );
  }

  Widget ProfileMethod(Profile_Posts post) {
    return Padding(
      padding: const EdgeInsets.all(1),
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(post.imgUrl), fit: BoxFit.cover),
        ),
      ),
    );
  }
}
