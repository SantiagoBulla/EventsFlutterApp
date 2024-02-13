import 'package:events/features/login/presentation/providers/login_privider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/config/app_routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

// * [[https://plugins.jetbrains.com/plugin/12895-better-highlights]]
// ? question
// ! error important
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Events project',
        initialRoute: AppRoutes.login,
        routes: AppRoutes.pages,
      ),
    );
  }
}
