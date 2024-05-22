import 'package:courses_demo_app/theme/HakamTheme.dart';
import 'package:flutter/material.dart';

class RoundAvatar extends StatelessWidget {
  const RoundAvatar(
      {super.key,
      required this.image,
      this.size,
      this.backgroundColor,
      this.onPressed});

  final String image;
  final double? size;
  final Color? backgroundColor;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: size ?? 56,
        height: size ?? 56,
        decoration: BoxDecoration(
          color: backgroundColor ?? HakamTheme.surfaceDarker,
          shape: BoxShape.circle,
          image: DecorationImage(
            image: NetworkImage(image),
          ),
        ),
      ),
    );
  }
}

// "https://i.pravatar.cc/300"
