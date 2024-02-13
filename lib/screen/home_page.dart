import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';

import '../features/login/presentation/providers/login_privider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 80,
          ),
          Center(child: Text('HOME PAGE')),
          SizedBox(),
          Center(
            child: FutureBuilder<String>(
              future: getToken(context),
              // recibe el Future que esta esperando completar
              builder: (context, snapshot) {
                //funcion que se llama cada vez que cambia el estado del future
                // -> context = contexto actual del widget -> snapshot = contexto actual del future
                // ! ver documentacion final
                if (snapshot.connectionState == ConnectionState.done) {
                  return Text(snapshot.data ?? 'Error al obtener el token');
                } else {
                  return const CircularProgressIndicator(); // Puedes mostrar un indicador de carga mientras se obtiene el token
                }
              },
            ),
          )
        ],
      ),
    );
  }

  Future<String> getToken(BuildContext context) async {
    AuthProvider loginProvider =
        Provider.of<AuthProvider>(context, listen: false);

    const storage = FlutterSecureStorage();
    final String? token = await storage.read(key: loginProvider.user!.id);

    //await Future.delayed(const Duration(seconds: 2));

    if (token != null) {
      return 'El token del usuario ${loginProvider.user!.id} es $token';
    } else {
      return 'El token del usuario ${loginProvider.user!.id} es NULL';
    }
  }
}

/*
snapshot.connectionState: snapshot.connectionState indica en qué estado se encuentra el Future en un momento dado.
Puedes verificar este estado para decidir qué widget mostrar.

ConnectionState.none: No se ha iniciado ninguna conexión.
ConnectionState.waiting: La conexión está en curso.
ConnectionState.active: La conexión está activa pero aún no ha completado.
ConnectionState.done: La conexión ha completado.
*/
