import 'package:events/features/user/presentation/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../login/presentation/providers/login_privider.dart';
import '../privider/selected_page_provider.dart';
import 'custom_navigator_item.dart';

class CustomBottomNavigator extends StatelessWidget {
  const CustomBottomNavigator({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SelectedPageProvider>(context, listen: false);
    return Padding(
      padding: const EdgeInsets.only(top: 2.5, right: 15, left: 15, bottom: 10),
      child: Container(
        height: 80,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            border: Border.all(
                color: const Color(0xff00abfe),
                width: 1.5,
                style: BorderStyle.solid)),
        child: Row(
          children: [
            ButtomNavigationItem(
                onPressIcon: () async {
                  print('add envent');
                  // TODO implementar formulario de agregar evento
                  // TODO llamar user provider para obtener datos de usuario
                },
                size: 60,
                icon: 'assets/svg/add.svg',
                color: 0xff36ae62),
            ButtomNavigationItem(
                onPressIcon: () => {provider.changePage(0)},
                size: 40,
                icon: 'assets/svg/home.svg',
                color: 0xff00abfe),
            ButtomNavigationItem(
                onPressIcon: () => {provider.changePage(1)},
                size: 40,
                icon: 'assets/svg/archive.svg',
                color: 0xff00abfe),
            ButtomNavigationItem(
                onPressIcon: () => {provider.changePage(2)},
                size: 40,
                icon: 'assets/svg/user.svg',
                color: 0xff00abfe),
          ],
        ),
      ),
    );
  }
}
