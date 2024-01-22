import 'package:events/screen/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DashBoardPage extends StatefulWidget {
  const DashBoardPage({super.key});

  @override
  State<DashBoardPage> createState() => _DashBoardPageState();
}

class _DashBoardPageState extends State<DashBoardPage> {
  Menus currentIndex = Menus.home;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        body: pages()[currentIndex.index],
        bottomNavigationBar: MyBottomNavigator(
          currentIndexIcon: currentIndex,
          onTap: (value) {
            //cuando se llamo el callback se trajo la opcion del menu = value y se ejcuto el setState
            setState(() {
              currentIndex = value;
            });
          },
        ));
  }

  pages() => [
        HomePage(),
        Center(
          child: Text('ARCHIVE'),
        ),
        Center(
          child: Text('PROFILE'),
        ),
      ];
}

enum Menus { home, archive, profile }

class MyBottomNavigator extends StatelessWidget {
  final Menus currentIndexIcon;

  //Esto indica que onTap es una función que toma un argumento de tipo Menus y no devuelve nada.
  final ValueChanged<Menus> onTap;

  const MyBottomNavigator(
      {super.key, required this.currentIndexIcon, required this.onTap});

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
                onPressIcon: () => onTap(Menus.home),
                size: 40,
                icon: 'assets/svg/home.svg',
                color: 0xff00abfe),
            ButtomNavigationItem(
                onPressIcon: () => onTap(Menus.archive),
                size: 40,
                icon: 'assets/svg/archive.svg',
                color: 0xff00abfe),
            ButtomNavigationItem(
                onPressIcon: () => onTap(Menus.profile),
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
