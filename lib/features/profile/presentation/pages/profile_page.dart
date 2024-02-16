import 'package:flutter/material.dart';
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
                    // TextButton(
                    //   onPressed: () {
                    //     print('Cerrar sesion');
                    //   },
                    //   style: TextButton.styleFrom(
                    //     maximumSize: const Size.fromWidth(100),
                    //     backgroundColor: Colors.white,
                    //     // Color de fondo del botón
                    //     padding:
                    //         const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                    //     // Padding dentro del botón
                    //     shape: RoundedRectangleBorder(
                    //       borderRadius:
                    //           BorderRadius.circular(10), // Bordes redondeados
                    //     ),
                    //   ),
                    //   child: const Row(
                    //     children: [
                    //       Icon(Icons.arrow_back_sharp),
                    //       Expanded(child: Text('Salir')),
                    //     ],
                    //   ),
                    // ),
                    const SizedBox(
                      height: 15,
                    ),
                    Center(
                      child: Column(
                        children: [
                          Container(
                            color: Colors.white,
                            height: 100,
                            width: 100,
                          ),
                          const SizedBox(height: 10),
                          Text(
                            '${user.user!.names} ${user.user!.surnames}',
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(user.user!.email)
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
                        clickAction: () {
                          print('click en cambiar contraseña');
                        },
                        description: 'Cambiar constraseña',
                        iconButton: Icons.lock),
                    const SizedBox(height: 15),
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
