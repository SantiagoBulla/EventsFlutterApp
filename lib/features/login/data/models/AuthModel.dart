import 'package:events/core/constants/user_constants.dart';
import 'package:events/features/login/domain/entities/auth_entity.dart';

class AuthModel extends AuthEntity {
  AuthModel({required super.id, required super.token});

  // transforma tipo json en un modelo
  factory AuthModel.fromJson(Map<String, dynamic> json) {
    return AuthModel(
      id: json[uIdToken],
      token: json[uToken],
    );
  }

  // convierte el objeto en un mapa
  Map<String, dynamic> toJson() {
    return {
      uId: id,
      uToken: token,
    };
  }
}
