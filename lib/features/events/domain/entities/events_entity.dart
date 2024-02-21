class EventEntity {
  int id;
  String title;
  String description;
  DateTime date;
  String idUser;
  int countdown;

  EventEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.date,
    required this.idUser,
    required this.countdown,
  });

  // Métodos o setters para actualizar los valores
  void updateTitle(String newTitle) {
    title = newTitle;
  }

  void updateDescription(String newDescription) {
    description = newDescription;
  }

  void updateDate(DateTime newDate) {
    date = newDate;
  }

  void updateIdUser(String newIdUser) {
    idUser = newIdUser;
  }

  void updateCountdown(int newCountdown) {
    countdown = newCountdown;
  }
}
