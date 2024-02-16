import 'package:events/features/events/presentation/provider/events_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';

import '../features/login/presentation/providers/login_privider.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

// TODO cargar los eventos de forma asincrona y se muestre los eventos cuando estos hayan cargado
class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var events = context.read<EventsProvider>();
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
                  return const CircularProgressIndicator();
                }
              },
            ),
          ),
          SizedBox(),
          Center(
            child: FutureBuilder<String>(
              future: getEvent(events),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return Text(snapshot.data ?? 'Error al obtener el evento');
                } else {
                  return const CircularProgressIndicator();
                }
              },
            ),
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

  Future<String> getEvent(EventsProvider events) async {
    if (events.eventsList != null) {
      return 'El evento 1 es ${events.eventsList![1].title}';
    } else {
      // Puedes retornar una cadena vacía o cualquier otro valor que desees mostrar mientras se carga el evento
      return '';
    }
  }
}
