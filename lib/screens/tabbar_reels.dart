import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:instagram_clone/utils/colors.dart';

class TabBar_Reels extends StatefulWidget {
  const TabBar_Reels({super.key});

  @override
  State<TabBar_Reels> createState() => _TabBar_ReelsState();
}

class _TabBar_ReelsState extends State<TabBar_Reels> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: double.infinity.w,
          height: double.infinity.h,
          child: const Center(
              child: Text(
            'No Reels',
            style: TextStyle(fontSize: 32),
          )),
        ),
      ),
    );
  }
}
