import 'package:events/core/constants/events_constants.dart';
import 'package:events/features/events/domain/entities/events_entity.dart';

class EventModel extends EventEntity {
  EventModel(
      {required super.id,
      required super.title,
      required super.description,
      required super.date,
      required super.idUser,
      required super.countdown});

  factory EventModel.fromJson(Map<String, dynamic> json) {
    return EventModel(
        id: json[eId],
        title: json[eTitle],
        description: json[eDescription],
        date: DateTime.parse(json[eDate]),
        idUser: json[eIdUser],
        countdown: json[eCountDown]);
  }
}
