import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ButtomNavigationItem extends StatelessWidget {
  final VoidCallback onPressIcon;
  final String icon;
  final int color;
  final double size;

  const ButtomNavigationItem(
      {super.key,
      required this.onPressIcon,
      required this.icon,
      required this.color,
      required this.size});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: IconButton(
        onPressed: onPressIcon,
        icon: SvgPicture.asset(
          icon,
          colorFilter: ColorFilter.mode(Color(color), BlendMode.srcIn),
          height: size,
          width: size,
        ),
      ),
    );
  }
}
