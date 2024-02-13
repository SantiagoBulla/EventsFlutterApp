import 'package:events/features/skeleton/privider/selected_page_provider.dart';
import 'package:events/features/skeleton/widget/custom_navigator_var.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../screen/home_page.dart';

List<Widget> pages = const [
  HomePage(),
];

class Skeleton extends StatelessWidget {
  const Skeleton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: HomePage(),
      bottomNavigationBar: CustomBottomNavigator(),
    );
  }
}
