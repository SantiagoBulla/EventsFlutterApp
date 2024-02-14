import 'package:events/features/skeleton/privider/selected_page_provider.dart';
import 'package:events/features/skeleton/widget/custom_navigator_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../screen/home_page.dart';

List<Widget> pages = const [
  HomePage(),
  // TODO implementar las otras pages
  Center(child: Text('Archive')),
  Center(child: Text('profile')),
];

class Skeleton extends StatelessWidget {
  const Skeleton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int page = Provider.of<SelectedPageProvider>(context).selectedPage;
    return Scaffold(
      extendBody: true,
      body: pages[page],
      bottomNavigationBar: const CustomBottomNavigator(),
    );
  }
}
