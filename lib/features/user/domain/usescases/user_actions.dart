import 'package:dartz/dartz.dart';
import 'package:events/features/user/domain/params/user_params.dart';
import 'package:events/features/user/domain/repositories/user_repository.dart';

import '../../../../core/errors/failure.dart';
import '../entities/user_entity.dart';

class UsersActions {
  final UserRepository repository;

  UsersActions(this.repository);

  Future<Either<Failure, UserEntity>> getUserData({required GetUserParams params}) {
    return repository.getUserData(params: params);  }
}
