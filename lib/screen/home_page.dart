import 'package:events/features/events/presentation/provider/events_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';

import '../features/events/domain/params/events_params.dart';
import '../features/login/presentation/providers/login_privider.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

// TODO iterar los eventos y mostrar un widget
class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var events = Provider.of<EventsProvider>(context, listen: false);
    var loginProvider = context.read<AuthProvider>();

    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 80),
          Center(child: Text('HOME PAGE')),
          SizedBox(),
          Center(
            child: FutureBuilder<String>(
              future: getToken(loginProvider),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return Text(snapshot.data ?? 'Error al obtener el token');
                } else {
                  return const Center(child:CircularProgressIndicator());
                }
              },
            ),
          ),
          SizedBox(),
          Center(
            child: Text('${events.eventsList?[0].description}'),
          ),
          SizedBox(),
          Center(
            child: Text('${events.eventsList?[1].description}'),
          ),
          SizedBox(),
          Center(
            child: Text('${events.eventsList?[2].description}'),
          ),
        ],
      ),
    );
  }

  Future<String> getToken(AuthProvider loginProvider) async {
    const storage = FlutterSecureStorage();
    final String? token = await storage.read(key: loginProvider.id.toString());

    if (token != null) {
      return 'El token del usuario ${loginProvider.id} es $token';
    } else {
      return 'El token del usuario ${loginProvider.id} es NULL';
    }
  }

  // Future<void> initEventsData(AuthProvider loginProvider) async {
  //   var providerEvents = Provider.of<EventsProvider>(context, listen: false);
  //   final params = GetAllEventsByUser(
  //       token: loginProvider.token, idUserFK: loginProvider.id.toString());
  //   await providerEvents.eitherFailureOrEvents(params: params);
  // }
}
