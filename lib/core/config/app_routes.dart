import 'package:events/features/skeleton/skeleton.dart';
import 'package:events/screen/home_page.dart';
import 'package:events/features/login/presentation/pages/login_page.dart';

class AppRoutes{
  static final pages = {
    login: (context) => LoginPage(),
    dashboard: (context) => Skeleton(),
    home: (context) => HomePage(),
    // events: (context) =>
  };

  static const login = '/';
  static const dashboard = '/dashboard';
  static const home = '/home';
}