import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';

import '../../../login/presentation/providers/login_privider.dart';
import '../../../user/presentation/provider/user_provider.dart';

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
                    TextButton(
                      onPressed: () {
                        print('Ir a editar perfil');
                      },
                      style: TextButton.styleFrom(
                        maximumSize: Size.fromWidth(150),
                        backgroundColor: Colors.white,
                        // Color de fondo del botón
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                        // Padding dentro del botón
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(10), // Bordes redondeados
                        ),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.arrow_back_sharp),
                          Text('Salir'),
                        ],
                      ),
                    ),
                    SizedBox(
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
                          SizedBox(height: 10),
                          Text(
                            '${user.user!.names} ${user.user!.surnames}',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          Text('${user.user!.email}')
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
                    SizedBox(
                      height: 80,
                      child: TextButton(
                        onPressed: () {
                          print('Primera opcion');
                        },
                        style: TextButton.styleFrom(
                          // maximumSize: Size.fromWidth(350),
                          backgroundColor: Color(0xFFD9D9D9),
                          padding:
                              EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          // Padding dentro del botón
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(20), // Bordes redondeados
                          ),
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.more_vert_outlined),
                            Text('Editar perfil'),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
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
