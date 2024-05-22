import 'package:courses_demo_app/components/RoundIconButton.dart';
import 'package:courses_demo_app/theme/HakamTheme.dart';
import 'package:flutter/cupertino.dart';

class CourseCard extends StatelessWidget {
  const CourseCard({
    super.key,
    required this.title,
    required this.by,
    required this.courseType,
    required this.backgroundImage,
    required this.liked,
    required this.saved,
    this.backgroundColor,
    this.foregroundColor,
    this.courseTypeBackgroundColor,
    this.courseTypeForegroundColor,
    this.onPressed,
    this.onLikePressed,
    this.onSavePressed,
  });

  final String title;
  final String by;
  final String courseType;
  final bool liked;
  final bool saved;

  final String backgroundImage;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final Color? courseTypeBackgroundColor;
  final Color? courseTypeForegroundColor;

  final VoidCallback? onPressed;
  final VoidCallback? onLikePressed;
  final VoidCallback? onSavePressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 281,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: backgroundColor ?? HakamTheme.primary,
        borderRadius: BorderRadius.circular(32),
      ),
      child: Stack(
        children: [
          // TODO: CARD BACKGROUND IMAGE
          Padding(
            padding: const EdgeInsets.only(top: 24, right: 16),
            child: Image.asset(
              backgroundImage,
              fit: BoxFit.contain,
              width: double.infinity,
              height: double.infinity,
              alignment: Alignment.bottomRight,
            ),
          ),
          // TODO: CARD CONTENT
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Column(
              children: [
                // TODO: CARD TITLE
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          title,
                          maxLines: 2,
                          overflow: TextOverflow.fade,
                          style: TextStyle(
                            color: foregroundColor ?? HakamTheme.labelDark,
                            fontWeight: FontWeight.w500,
                            fontSize: 28,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                // TODO: CARD BY
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    children: [
                      Text(
                        by,
                        style: TextStyle(
                          color: (foregroundColor ?? HakamTheme.labelDark)
                              .withAlpha(200),
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 6),
                      decoration: BoxDecoration(
                        color: courseTypeBackgroundColor ??
                            HakamTheme.surfaceLight,
                        borderRadius: const BorderRadius.horizontal(
                            right: Radius.circular(16)),
                      ),
                      child: Text(
                        courseType,
                        style: TextStyle(
                          color: (courseTypeForegroundColor ??
                                  HakamTheme.labelDark)
                              .withAlpha(200),
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    children: [
                      RoundIconButton(
                        icon: liked
                            ? CupertinoIcons.heart_fill
                            : CupertinoIcons.heart,
                        backgroundColor: HakamTheme.surfaceLight,
                        foregroundColor: HakamTheme.surfaceDark,
                        contentPadding: const EdgeInsets.all(12),
                        onPressed: onLikePressed,
                      ),
                      const SizedBox(width: 8),
                      RoundIconButton(
                        icon: saved
                            ? CupertinoIcons.bookmark_fill
                            : CupertinoIcons.bookmark,
                        backgroundColor: HakamTheme.surfaceLight,
                        foregroundColor: HakamTheme.surfaceDark,
                        contentPadding: const EdgeInsets.all(12),
                        onPressed: onSavePressed,
                      ),
                      const Spacer(),
                      RoundIconButton(
                        icon: CupertinoIcons.arrow_right,
                        backgroundColor: HakamTheme.surfaceLight,
                        foregroundColor: HakamTheme.surfaceDark,
                        contentPadding: const EdgeInsets.all(12),
                        onPressed: onPressed,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
