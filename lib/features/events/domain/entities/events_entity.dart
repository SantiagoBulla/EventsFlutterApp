class EventEntity {
  final int id;
  final String title;
  final String description;
  final DateTime date;
  final String idUser;
  final int countdown;

  EventEntity(
      {required this.id,
      required this.title,
      required this.description,
      required this.date,
      required this.idUser,
      required this.countdown});
}

/*
{
    idEvent: 5,
    eventName: 'Crear eventos',
    eventDescription: 'formulario de crear eventos en la app flutter ',
    eventDate: '2024-02-25',
    idUserFK: '321',
    countdown: 9
  }
*/
