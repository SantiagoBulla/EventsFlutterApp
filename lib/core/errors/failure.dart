// * clase abstracta que proporciona una estructura común para representar fallas en tu aplicación
abstract class Failure {
  // atributo de clase y constructor
  final String errorMessage;
  const Failure({required this.errorMessage});
}

/*
Implementan la clase Failure y permiten crear errores debido a fallas de logica de negocio
* */
class ServerFailure extends Failure {
  //extiende de Failure y recibe un str en su constructor y este a su vez sera el atributo enviado como mensaje de error a la clase abstracta
  ServerFailure({required String errorMessage})
      : super(errorMessage: errorMessage);
}

class NetWorkingFailure extends Failure {
  NetWorkingFailure({required String errorMessage})
      : super(errorMessage: errorMessage);
}
