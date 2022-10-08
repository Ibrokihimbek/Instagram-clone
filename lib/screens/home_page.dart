import 'package:cached_network_image/cached_network_image.dart';
import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:instagram_clone/models/post_comment.dart';
import 'package:instagram_clone/screens/comments_page.dart';
import 'package:instagram_clone/screens/story_page.dart';
import 'package:instagram_clone/utils/colors.dart';
import 'package:instagram_clone/utils/images.dart';
import 'package:instagram_clone/widgets/post_comment.dart';
import 'package:instagram_clone/widgets/post_title_widget.dart';

import '../models/post_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

bool bookMArk = false;

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          actions: [
            InkWell(child: SvgPicture.asset(MyImages.icon_add)),
            SizedBox(width: 12.w),
            InkWell(child: SvgPicture.asset(MyImages.icon_favorite)),
            SizedBox(width: 12.w),
            InkWell(child: SvgPicture.asset(MyImages.icon_messenger)),
            SizedBox(width: 12.w)
          ],
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Image.asset(
            MyImages.instagram_logo,
            width: 104.w,
          ),
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              historyList(),
              const Divider(thickness: 0.4, color: Colors.grey),
              posts()
            ],
          ),
        ));
  }

  Widget historyList() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.12,
      child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return Column(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => MoreStories()));
                  },
                  child: Stack(
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 6).r,
                        height: 66.h,
                        width: 66.w,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                          border: GradientBoxBorder(
                            gradient: const LinearGradient(
                              colors: [
                                Color(0xFFF7A34B),
                                Color(0xFFDE0046),
                              ],
                            ),
                            width: 2.w,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 6,
                        left: 1,
                        right: 1,
                        child: Container(
                          height: 55.h,
                          width: 55.w,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image:
                                  NetworkImage(PostModel.posts[index].userLogo),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 8.h),
                Expanded(child: Text(PostModel.posts[index].userName))
              ],
            );
          }),
    );
  }

  Widget posts() {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        return Container(
          constraints: BoxConstraints(minHeight: 160.h),
          child: postItem(PostModel.posts[index]),
        );
      },
      itemCount: PostModel.posts.length,
    );
  }

  Widget postItem(PostModel post) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 6, vertical: 9).r,
                  height: 30.h,
                  width: 30.w,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: NetworkImage(post.userLogo), fit: BoxFit.cover),
                  ),
                ),
                SizedBox(width: 4.w),
                Text(
                  post.userName,
                  style: const TextStyle(fontWeight: FontWeight.w500),
                ),
              ],
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.more_horiz_rounded),
            )
          ],
        ),
        ExpandablePageView.builder(
          onPageChanged: (index) {
            setState(() {
              post.imageIndicator = index;
            });
          },
          scrollDirection: Axis.horizontal,
          itemCount: post.images.length,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              onTap: () {
                setState(() {
                  post.isLiked = true;
                });
              },
              child: postImage(
                post.images[index],
                post.imageIndicator,
              ),
            );
          },
        ),
        postActions(post),
        Padding(
          padding: const EdgeInsets.only(left: 12).r,
          child: Text(
            "${post.isLiked ? post.likeCount + 1 : post.likeCount} likes",
            style: const TextStyle(fontWeight: FontWeight.w700),
          ),
        ),
        SizedBox(height: 8.h),
        PostTitle(
            post: post,
            moreTap: () {
              setState(() {
                post.isTitleExpanded = !post.isTitleExpanded;
              });
            }),
        postCommentsAndAddComment(post)
      ],
    );
  }

  Widget postActions(PostModel post) {
    return Padding(
      padding: const EdgeInsets.only(left: 12, top: 9, right: 0, bottom: 4).r,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    post.isLiked = !post.isLiked;
                  });
                },
                child: !post.isLiked
                    ? const Icon(
                        Icons.favorite_border_outlined,
                        size: 27,
                      )
                    : const Icon(
                        Icons.favorite_outlined,
                        color: Colors.red,
                        size: 27,
                      ),
              ),
              SizedBox(width: 8.w),
              InkWell(
                  onTap: () {
                    FocusManager.instance.primaryFocus?.unfocus();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => CommentsPage(post: post),
                      ),
                    );
                  },
                  child: SvgPicture.asset(MyImages.icon_comment, width: 24.w)),
              SizedBox(width: 8.w),
              SvgPicture.asset(
                MyImages.icon_share,
                width: 24.w,
              ),
            ],
          ),
          postIndicator(post.imageIndicator),
          IconButton(
            padding: EdgeInsets.zero,
            onPressed: () {
              setState(() {
                bookMArk = !bookMArk;
              });
            },
            icon: Icon(bookMArk ? Icons.bookmark : Icons.bookmark_outline),
          )
        ],
      ),
    );
  }

  Widget postImage(String imgUrl, int imageIndicator) {
    return Container(
      child: Stack(
        children: [
          Container(
            width: double.infinity.w,
            child: CachedNetworkImage(
              fit: BoxFit.fitWidth,
              imageUrl: imgUrl,
              placeholder: (context, url) => SizedBox(
                width: double.infinity,
                height: 400.h,
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              ),
              errorWidget: (context, url, error) => SizedBox(
                width: double.infinity,
                height: 400.h,
                child: const Center(
                  child: Icon(
                    Icons.error,
                    size: 120,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            right: 16,
            top: 16,
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.black.withOpacity(0.3)),
              child: Text(
                "${imageIndicator + 1}/4",
                style: TextStyle(color: Colors.white.withOpacity(0.8)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget postIndicator(int currentIndex) {
    return Container(
      margin: const EdgeInsets.only(right: 24).r,
      height: 42,
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 4,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            height: 8.h,
            width: 8.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: currentIndex == index
                  ? MyColors.color_indicator
                  : MyColors.color_indicator_unselected,
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(width: 4.w);
        },
      ),
    );
  }

  Widget postTitle(PostModel post) {
    return Padding(
      padding: const EdgeInsets.only(left: 12).r,
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: "${post.userName}  ",
              style: const TextStyle(
                  color: Colors.black, fontWeight: FontWeight.w700),
            ),
            TextSpan(
              text: post.title.substring(
                0,
                !post.isTitleExpanded
                    ? (post.title.length > 90 ? 90 : post.title.length)
                    : post.title.length,
              ),
              style: const TextStyle(color: Colors.black),
            ),
            TextSpan(
              text: !post.isTitleExpanded
                  ? (post.title.length > 90 ? "... more" : "")
                  : "\nshow less",
              style: const TextStyle(color: Colors.grey),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  setState(() {
                    post.isTitleExpanded = !post.isTitleExpanded;
                  });
                },
            )
          ],
        ),
      ),
    );
  }

  String newComment = "";
  var controller = TextEditingController();

  Widget postCommentsAndAddComment(PostModel post) {
    return Padding(
      padding: const EdgeInsets.only(left: 12, top: 4).r,
      child: Column(
        children: [
          SizedBox(height: 4.h),
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            primary: false,
            shrinkWrap: true,
            itemCount: post.comments.length,
            itemBuilder: (BuildContext context, int index) {
              return PostCommentWidget(comment: post.comments[index]);
            },
          ),
          SizedBox(height: 4.h),
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
                          if (newComment.isNotEmpty) {
                            post.comments.add(
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
    );
  }
}
