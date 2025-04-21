import 'package:flutter/material.dart';

class GradientAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? title;
  final List<Color> gradientColors;
  final PreferredSizeWidget? bottom;
  final List<Widget>? actions;

  const GradientAppBar({super.key,
    required this.title,
    this.bottom,
    this.actions,
    this.gradientColors = const [Color(0xFFFFE082), Color(0xFFFFD54F)],
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title,
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: gradientColors,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 0,
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
      ),
      bottom: bottom,
      actions: actions,
    );
  }

  @override
  Size get preferredSize {
    final bottomHeight = bottom?.preferredSize.height ?? 0;
    return Size.fromHeight(kToolbarHeight + bottomHeight);
  }
}
