import 'package:data_connection_checker_tv/data_connection_checker.dart';

// ! DEPENDENCIA [data_connection_checker_tv: ^0.3.5-nullsafety]

abstract class NetworkInfo {
  // * método abstracto que en un futuro devolvera un valor booleano -> este metodo lo implementan las clases que implementen la clase
  // * abstracta NetWorkInfo
  Future<bool>? get isConnected;
}

/*
* [DataConnectionChecker connectionChecker] es un atributo de la clase NetworkInfoImpl que se inicializa a través del constructor.
* Este atributo es de tipo DataConnectionChecker, que es una clase proporcionada por la biblioteca data_connection_checker.
* Al llamar a connectionChecker.hasConnection, se está utilizando el método hasConnection de la instancia de DataConnectionChecker.
* Este método devuelve un Future<bool>, y al incluirlo en el getter isConnected, que es parte de la interfaz NetworkInfo,
* se establece que la implementación de la verificación de conexión se realiza utilizando DataConnectionChecker y su método hasConnection.
*/

// implementala clase abstracta de NetWorkInfo
class NetworkInfoImpl implements NetworkInfo {
  //Atributo de clase de tipo DataConnectionChecker
  final DataConnectionChecker connectionChecker;
  //se Inicializa a través del constructor
  NetworkInfoImpl(this.connectionChecker);
  //se sobre escribe el metodo abstracto, el cual utiliza el metodo hasConnection a través del atributo de clase y
  // devuelve true/false dependiendo si hay o no conexion a internet
  @override
  Future<bool> get isConnected => connectionChecker.hasConnection;
}
