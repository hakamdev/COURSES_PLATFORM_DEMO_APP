import 'package:courses_demo_app/components/CourseCard.dart';
import 'package:courses_demo_app/components/FilterPill.dart';
import 'package:courses_demo_app/components/RoundAvatar.dart';
import 'package:courses_demo_app/components/RoundIconButton.dart';
import 'package:courses_demo_app/theme/HakamTheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map<String, dynamic>> courses = [
    {
      "title": "Figma Web\nCourse",
      "by": "by Hakam",
      "type": "Design Course",
      "image": "assets/man_picture_1.png",
      "liked": true,
      "saved": false,
    },
    {
      "title": "My Nice\nCourse",
      "by": "by John",
      "type": "Programming Course",
      "image": "assets/man_3.png",
      "liked": false,
      "saved": true,
    },
    {
      "title": "My Nice\nCourse",
      "by": "by John",
      "type": "Programming Course",
      "image": "assets/man_4.png",
      "liked": false,
      "saved": true,
    },
    {
      "title": "My Nice\nCourse",
      "by": "by John",
      "type": "Programming Course",
      "image": "assets/man_5.png",
      "liked": false,
      "saved": true,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HakamTheme.background,
      appBar: getAppBar(context),
      body: getBody(context),
    );
  }

  Widget getBody(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.only(top: 16.0, left: 16, right: 16),
          sliver: SliverToBoxAdapter(
            child: Row(
              children: [
                Text(
                  "Choose Your\nCourse",
                  style: TextStyle(
                    color: HakamTheme.labelLight,
                    fontWeight: FontWeight.w600,
                    fontSize: 30,
                  ),
                ),
              ],
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.only(top: 16.0),
          sliver: SliverToBoxAdapter(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  const SizedBox(width: 16),
                  FilterPill(label: "Design", coursesCount: 21),
                  const SizedBox(width: 12),
                  FilterPill(label: "Programming", coursesCount: 1),
                  const SizedBox(width: 12),
                  FilterPill(label: "Art", coursesCount: 14),
                  const SizedBox(width: 16),
                ],
              ),
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, i) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CourseCard(
                      title: courses[i]["title"],
                      by: courses[i]["by"],
                      courseType: courses[i]["type"],
                      backgroundImage: courses[i]["image"],
                      liked: courses[i]["liked"],
                      saved: courses[i]["saved"],
                      backgroundColor: i % 2 == 0 ? null : HakamTheme.surface,
                      foregroundColor:
                          i % 2 == 0 ? null : HakamTheme.labelLight,
                      courseTypeBackgroundColor:
                          i % 2 == 0 ? null : const Color(0xFF7C7C7C),
                      courseTypeForegroundColor:
                          i % 2 == 0 ? null : HakamTheme.labelLight,
                      onPressed: () {},
                      onLikePressed: () {
                        courses[i]["liked"] = !courses[i]["liked"];
                        setState(() {});
                      },
                      onSavePressed: () {
                        courses[i]["saved"] = !courses[i]["saved"];
                        setState(() {});
                      },
                    ),
                    const SizedBox(height: 16),
                  ],
                );
              },
              childCount: courses.length,
            ),
          ),
        ),
      ],
    );
  }

  AppBar getAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      toolbarHeight: 70,
      title: Icon(
        CupertinoIcons.ant_fill,
        color: HakamTheme.primary,
        size: 30,
      ),
      centerTitle: false,
      actions: [
        RoundIconButton(
          icon: CupertinoIcons.calendar,
          onPressed: () {},
        ),
        const SizedBox(width: 8),
        RoundIconButton(
          icon: CupertinoIcons.bell,
          onPressed: () {},
        ),
        const SizedBox(width: 8),
        RoundAvatar(
          image: "https://i.pravatar.cc/300",
          onPressed: () {},
        ),
        const SizedBox(width: 16),
      ],
    );
  }
}
