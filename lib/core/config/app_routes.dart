import 'package:events/features/skeleton/skeleton.dart';
import 'package:events/features/events/presentation/pages/home_page.dart';
import 'package:events/features/login/presentation/pages/login_page.dart';

import '../../features/events/presentation/pages/form/eventos_form.dart';
import '../../features/events/presentation/pages/form/pageview_form.dart';
class AppRoutes{
  static final pages = {
    login: (context) => LoginPage(),
    skeleton: (context) => Skeleton(),
    home: (context) => HomePage(),
    eventForm: (context) => PageViewForm(),
  };

  static const login = '/';
  static const skeleton = '/skeleton';
  static const home = '/home';
  static const eventForm = '/event-form';
}