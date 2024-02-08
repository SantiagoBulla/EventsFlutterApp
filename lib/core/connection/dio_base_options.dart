import 'package:dio/dio.dart';

int uno = 9000; // tu número entero en milisegundos
Duration connection = Duration(milliseconds: uno);
int dos = 3000; // tu número entero en milisegundos
Duration request = Duration(milliseconds: dos);


final BaseOptions baseOptions = BaseOptions(
  baseUrl: 'http://192.168.8.104:9000/api/', // Cambia a tu URL base
  connectTimeout: connection, // Tiempo máximo de espera para la conexión
  receiveTimeout: request, // Tiempo máximo de espera para recibir datos
  headers: {
    'Content-Type': 'application/json', // Cambia según las necesidades de tu API
    'Accept': 'application/json', // Cambia según las necesidades de tu API
  },
);
