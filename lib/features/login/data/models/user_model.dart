import 'package:events/core/constants/user_constants.dart';
import 'package:events/features/user/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel(
      {required super.id,
      required super.names,
      required super.surnames,
      required super.email,
      required super.phone,
      required super.password,
      required super.status,
      required super.rol});

  // transforma tipo json en un modelo
  factory UserModel.fromJson(Map<String, dynamic> json) {
      return UserModel(
          id: json[uId],
          names: json[uNames],
          surnames: json[uSurnames],
          email: json[uEmail],
          phone: json[uPhone],
          password: json[uPassword],
          status: json[uStatus],
          rol: json[uIdRolFK],
      );
  }

  // convierte el objeto en un mapa
  Map<String, dynamic> toJson() {
      return {
          uId: id,
          uNames: names,
          uSurnames: surnames,
          uEmail: email,
          uPhone: phone,
          uPassword: password,
          uStatus: status,
          uIdRolFK: rol
      };
  }
}
