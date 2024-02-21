import 'package:events/features/events/domain/params/events_params.dart';
import 'package:events/features/events/presentation/provider/events_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';

import '../../../skeleton/widget/custom_exit_button.dart';
import '../../../user/presentation/provider/user_provider.dart';
import '../widgets/custom_profile_option_button.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    var user = Provider.of<UserProvider>(context, listen: false);
    return SizedBox.expand(
      child: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(
                top: Radius.zero, bottom: Radius.circular(25)),
            //container azul superior
            child: Container(
              color: Colors.blue,
              width: MediaQuery.of(context).size.width,
              height: 300,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    ExitButton(
                      onPressedAction: () {
                        print('click en cambiar contraseña');
                      },
                      textButton: 'Salir',
                      iconButton: Icons.arrow_back_sharp,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Center(
                      child: Column(
                        children: [
                          Container(
                            color: Colors.white,
                            height: 125,
                            width: 125,
                            child: Center(child: Text('Photo')),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            '${user.user!.names} ${user.user!.surnames}',
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            user.user!.email,
                            style: const TextStyle(
                                fontSize: 16, color: Colors.white54),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(25),
                child: Column(
                  children: [
                    ProfileOptionButton(
                        clickAction: () async {
                          // var providerUser =
                          //     Provider.of<UserProvider>(context, listen: false);
                          // var providerEvents = Provider.of<EventsProvider>(
                          //     context,
                          //     listen: false);
                          // // obetener el token y generar los params para el provider
                          // const storage = FlutterSecureStorage();
                          // final token = await storage.read(
                          //     key: providerUser.user!.id.toString());
                          // final params = GetAllEventsByUser(
                          //     token: token!,
                          //     idUserFK: providerUser.user!.id.toString());
                          // providerEvents.eitherFailureOrEvents(params: params);
                          print('cambio contraseña');
                        },
                        description: 'Cambiar constraseña',
                        iconButton: Icons.lock),
                    const SizedBox(height: 15),
                    ProfileOptionButton(
                        clickAction: () {
                          print('click en cambiar contraseña');
                        },
                        description: 'Cambiar constraseña',
                        iconButton: Icons.lock),
                    const SizedBox(height: 15),
                    ProfileOptionButton(
                        clickAction: () {
                          print('click en cambiar contraseña');
                        },
                        description: 'Cambiar constraseña',
                        iconButton: Icons.lock),
                    const SizedBox(height: 15),
                    ProfileOptionButton(
                        clickAction: () {
                          print('click en cambiar contraseña');
                        },
                        description: 'Cambiar constraseña',
                        iconButton: Icons.lock),
                    const SizedBox(height: 15),
                    ProfileOptionButton(
                        clickAction: () {
                          print('click en cambiar contraseña');
                        },
                        description: 'Cambiar constraseña',
                        iconButton: Icons.lock),
                    const SizedBox(height: 15),
                    ProfileOptionButton(
                        clickAction: () {
                          print('click en cambiar contraseña');
                        },
                        description: 'Cambiar constraseña',
                        iconButton: Icons.lock),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
