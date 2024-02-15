import 'package:dartz/dartz.dart';
import 'package:events/core/errors/failure.dart';
import 'package:events/features/user/domain/entities/user_entity.dart';
import 'package:events/features/user/domain/params/user_params.dart';

abstract class UserRepository {
  Future<Either<Failure, UserEntity>> getUserData(
      {required GetUserParams params});
}
