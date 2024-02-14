import 'package:dartz/dartz.dart';
import 'package:events/core/errors/failure.dart';
import 'package:events/core/params/login_params.dart';
import 'package:events/features/login/domain/entities/auth_entity.dart';
import 'package:events/features/user/domain/entities/user_entity.dart';

// clase abstracta del repositorio en la capa domain que va a implementar el repositorio de la capa de data
abstract class LoginRepository{
  Future<Either<Failure,AuthEntity>> validateUser ({required LoginParams params});
}

/*
abstract class PokemonRepository {
  Future<Either<Failure, PokemonEntity>> getPokemon({required PokemonParams params});
}
*/