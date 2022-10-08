import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:instagram_clone/screens/comments_page.dart';
import 'package:instagram_clone/screens/tabbar_posts.dart';
import 'package:instagram_clone/screens/tabbar_reels.dart';
import 'package:instagram_clone/screens/tabbar_union.dart';
import 'package:instagram_clone/utils/colors.dart';
import 'package:instagram_clone/utils/images.dart';

import '../models/post_model.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10).r,
              child: const Text(
                'jack',
                style: TextStyle(
                    fontSize: 24,
                    color: Colors.black,
                    fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(
              width: 4.w,
            ),
            Container(
              width: 21.w,
              height: 21.h,
              child: SvgPicture.asset(MyImages.icon_dropdown),
            ),
          ],
        ),
        actions: [
          Row(
            children: [
              Container(
                width: 24.w,
                height: 24.h,
                child: SvgPicture.asset(MyImages.icon_add),
              ),
              SizedBox(
                width: 26.w,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 14).r,
                child: Container(
                    width: 18.w,
                    height: 18.h,
                    child: SvgPicture.asset(MyImages.icon_burger)),
              ),
            ],
          )
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(
              height: 10.h,
            ),
            userFollowData(),
            SizedBox(
              height: 8.h,
            ),
            usernameAndInfo(),
            SizedBox(
              height: 18.h,
            ),
            Stories(),
            SizedBox(
              height: 8.h,
            ),
            tabbar(),
          ],
        ),
      ),
    );
  }

  Widget userFollowData() {
    return Row(
      children: [
        Stack(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 6).r,
              height: 88.h,
              width: 88.w,
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
                height: 77.h,
                width: 77.w,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: NetworkImage('https://i.pravatar.cc/300?img=7'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          width: 31.w,
        ),
        Column(
          children: const [
            Text(
              '12',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            ),
            Text(
              'Posts',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
            )
          ],
        ),
        SizedBox(
          width: 22.w,
        ),
        Column(
          children: const [
            Text(
              '100k',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            ),
            Text(
              'Followers',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
            )
          ],
        ),
        SizedBox(
          width: 28.w,
        ),
        Column(
          children: const [
            Text(
              '10',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            ),
            Text(
              'Following',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
            )
          ],
        )
      ],
    );
  }

  Widget usernameAndInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 320).r,
          child: const Text(
            'jack',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
          ),
        ),
        SizedBox(
          height: 3.h,
        ),
        RichText(
          text: const TextSpan(
            children: [
              TextSpan(
                text:
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit,\nsed do eiusmod tempor incididunt ',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.black),
              ),
              TextSpan(
                text: '#hashtag',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: MyColors.color_word),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 3.h,
        ),
        const Text(
          'Link goes here',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: MyColors.color_word,
          ),
        ),
        SizedBox(
          height: 12.h,
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.transparent,
            border: Border.all(color: MyColors.color_border),
          ),
          width: 345.w,
          height: 40.h,
          child: const Center(
            child: Text(
              'Edit Profile',
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: Colors.black),
            ),
          ),
        ),
      ],
    );
  }

  Widget Stories() {
    return Container(
      height: 84.h,
      child: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        children: [
          storiesMethod('https://i.pravatar.cc/300?img=54', 'Friends'),
          storiesMethod('https://i.pravatar.cc/300?img=55', 'Music'),
          storiesMethod('https://i.pravatar.cc/300?img=18', 'Team'),
          storiesMethod('https://i.pravatar.cc/300?img=38', 'Family'),
          storiesMethod(
              'https://upload.wikimedia.org/wikipedia/commons/thumb/9/9e/Plus_symbol.svg/800px-Plus_symbol.svg.png',
              'New'),
        ],
      ),
    );
  }

  Widget storiesMethod(String imageName, String word) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 4).r,
              height: 66.h,
              width: 66.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                border: Border.all(color: MyColors.color_border, width: 2.w),
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
                    image: NetworkImage(imageName),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ],
        ),
        Text(word)
      ],
    );
  }

  Widget tabbar() {
    return DefaultTabController(
      length: 3,
      child: Column(
        children: [
          TabBar(
            tabs: [
              Tab(
                child: Container(
                  width: 21.w,
                  height: 21.h,
                  child: SvgPicture.asset(MyImages.icon_vector),
                ),
              ),
              Tab(
                child: Container(
                  width: 21.w,
                  height: 21.h,
                  child: Image.asset(MyImages.reels_image),
                ),
              ),
              Tab(
                child: Container(
                  width: 24.w,
                  height: 24.h,
                  child: SvgPicture.asset(
                    MyImages.icon_union,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
          Container(
            height: 622.h,
            child:
                const TabBarView(physics: BouncingScrollPhysics(), children: [
              TabBar_Posts(),
              TabBar_Reels(),
              TabBar_Union(),
            ]),
          ),
        ],
      ),
    );
  }
}
