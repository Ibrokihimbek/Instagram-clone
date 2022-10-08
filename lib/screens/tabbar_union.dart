import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:instagram_clone/utils/colors.dart';

class TabBar_Union extends StatefulWidget {
  const TabBar_Union({super.key});

  @override
  State<TabBar_Union> createState() => _TabBar_UnionState();
}

class _TabBar_UnionState extends State<TabBar_Union> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: double.infinity.w,
          height: double.infinity.h,
          child: const Center(
            child: Text(
              'No Union',
              style: TextStyle(fontSize: 32),
            ),
          ),
        ),
      ),
    );
  }
}
