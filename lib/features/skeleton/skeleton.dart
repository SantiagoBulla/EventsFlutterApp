import 'package:events/features/skeleton/privider/selected_page_provider.dart';
import 'package:events/features/skeleton/widget/custom_navigator_bar.dart';
import 'package:events/features/profile/presentation/pages/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';

import 'package:events/features/login/presentation/providers/login_privider.dart';
import '../../screen/home_page.dart';
import '../events/domain/params/events_params.dart';
import '../events/presentation/provider/events_provider.dart';
import '../user/domain/params/user_params.dart';
import '../user/presentation/provider/user_provider.dart';

List<Widget> pages = const [
  HomePage(),
  // TODO implementar las otras pages
  Center(child: Text('Archive')),
  ProfilePage(),
];

// StatefulWidget para poder usar el ciclo de vida initState
class Skeleton extends StatefulWidget {
  const Skeleton({Key? key}) : super(key: key);

  @override
  State<Skeleton> createState() => _SkeletonState();
}

// TODO validar el initState y saber cual el el widget que carga el spinner
class _SkeletonState extends State<Skeleton> {
  @override //Ciclo de vida -> inicializar el usuario
  void initState() {
    super.initState();
    // initUserData();
  }

  Future<void> initUserData() async {
    //metodo para inicializar el usuario logueado
    //obtener una instancia del provider
    var providerUser = Provider.of<UserProvider>(context, listen: false);
    var providerLogin = Provider.of<AuthProvider>(context, listen: false);
    // obetener el token y generar los params para el provider
    const storage = FlutterSecureStorage();
    final token = await storage.read(key: providerLogin.id.toString());
    final params = GetUserParams(
        token: token.toString(), idUser: providerLogin.id.toString());
    providerUser.eitherFailureOrUserData(
        params: params); //llamar el metodo del provider para obtener el usuario
    await Future(() => providerUser.user != null);
    await initEventsData(token.toString(), providerLogin.id.toString());
  }

  Future<void> initEventsData(String token, String idUser) async {
    var providerEvents = Provider.of<EventsProvider>(context, listen: false);
    final params = GetAllEventsByUser(token: token, idUserFK: idUser);
    await providerEvents.eitherFailureOrEvents(params: params);
    await Future(() => providerEvents.eventsList != null);
  }

  @override
  Widget build(BuildContext context) {
    int page = Provider.of<SelectedPageProvider>(context).selectedPage;
    return Scaffold(
      // extendBody: true,
      body: FutureBuilder(
        future: initUserData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            // Aquí puedes construir la interfaz de usuario después de la inicialización
            return pages[page];
          } else {
            // Puedes mostrar un indicador de carga mientras se inicializa
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
      bottomNavigationBar: const CustomBottomNavigator(),
    );
  }
}
