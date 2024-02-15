import 'package:dartz/dartz.dart';
import 'package:events/core/params/login_params.dart';
import 'package:events/features/login/domain/entities/auth_entity.dart';
import 'package:events/features/login/domain/repositories/login_repository.dart';

import '../../../../core/errors/failure.dart';

// use case -> metodos de la logica del negocio
class ValidateLogin {
  final LoginRepository repository;

  ValidateLogin(this.repository);

  Future<Either<Failure,AuthEntity>> call({required LoginParams params}) async {
    return await repository.validateUser(params: params);
  }
}