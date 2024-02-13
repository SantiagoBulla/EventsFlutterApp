import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../privider/selected_page_provider.dart';

class CustomBottomNavigator extends StatelessWidget {
  const CustomBottomNavigator({super.key});

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: Container(
        height: 80,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            border: Border.all(
                color: Color(0xff00abfe),
                width: 1.5,
                style: BorderStyle.solid)),
        child: Row(
          children: [
            ButtomNavigationItem(
                onPressIcon: () {
                  print('add event');
                },
                size: 60,
                icon: 'assets/svg/add.svg',
                color: 0xff36ae62),
            ButtomNavigationItem(
                onPressIcon: () => {
                      Provider.of<SelectedPageProvider>(context, listen: false)
                          .changePage(0)
                    },
                size: 40,
                icon: 'assets/svg/home.svg',
                color: 0xff00abfe),
            ButtomNavigationItem(
                onPressIcon: () => {
                      Provider.of<SelectedPageProvider>(context, listen: false)
                          .changePage(1)
                    },
                size: 40,
                icon: 'assets/svg/archive.svg',
                color: 0xff00abfe),
            ButtomNavigationItem(
                onPressIcon: () => {
                      Provider.of<SelectedPageProvider>(context, listen: false)
                          .changePage(2)
                    },
                size: 40,
                icon: 'assets/svg/user.svg',
                color: 0xff00abfe),
          ],
        ),
      ),
    );
  }
}

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
