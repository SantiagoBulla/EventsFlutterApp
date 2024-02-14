class UserEntity {
  final int id;
  final String names;
  final String surnames;
  final String email;
  final String phone;
  final String password;
  final int status;
  final int rol;

  UserEntity(
      {required this.id,
      required this.names,
      required this.surnames,
      required this.email,
      required this.phone,
      required this.password,
      required this.status,
      required this.rol});

// ! si es necesario agregar un metodo que transforme de modelo a entidad
}
