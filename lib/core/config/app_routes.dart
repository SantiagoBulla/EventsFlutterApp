import 'package:events/features/events/presentation/pages/form/event_form.dart';
import 'package:events/features/skeleton/skeleton.dart';
import 'package:events/features/events/presentation/pages/home_page.dart';
import 'package:events/features/login/presentation/pages/login_page.dart';

class AppRoutes{
  static final pages = {
    login: (context) => LoginPage(),
    skeleton: (context) => Skeleton(),
    home: (context) => HomePage(),
    eventForm: (context) => EventForm(),
  };

  static const login = '/';
  static const skeleton = '/skeleton';
  static const home = '/home';
  static const eventForm = '/event-form';
}