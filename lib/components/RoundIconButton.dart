import 'package:courses_demo_app/theme/HakamTheme.dart';
import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  const RoundIconButton({
    super.key,
    required this.icon,
    this.selected = false,
    this.onPressed,
    this.backgroundColor,
    this.foregroundColor,
    this.selectedBackgroundColor,
    this.selectedForegroundColor,
    this.contentPadding,
  });

  final IconData icon;
  final bool selected;
  final VoidCallback? onPressed;

  final Color? backgroundColor;
  final Color? foregroundColor;

  final Color? selectedBackgroundColor;
  final Color? selectedForegroundColor;

  final EdgeInsetsGeometry? contentPadding;

  @override
  Widget build(BuildContext context) {
    Color currBgColor = selected
        ? (selectedBackgroundColor ?? backgroundColor ?? HakamTheme.surfaceDark)
        : (backgroundColor ?? HakamTheme.surfaceDark);

    Color currFgColor = selected
        ? (selectedForegroundColor ??
            foregroundColor ??
            HakamTheme.surfaceLight)
        : (foregroundColor ?? HakamTheme.surfaceLight);

    return Material(
      color: currBgColor,
      borderRadius: BorderRadius.circular(29),
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(29),
        child: Container(
          padding: contentPadding ?? const EdgeInsets.all(16),
          decoration: const BoxDecoration(shape: BoxShape.circle),
          child: Icon(icon, color: currFgColor),
        ),
      ),
    );
  }
}
