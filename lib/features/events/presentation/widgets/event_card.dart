import 'package:flutter/material.dart';
import '../../domain/entities/events_entity.dart';
import 'custom_event_detail_modal.dart';

class EventCard extends StatelessWidget {
  final EventEntity event;

  const EventCard({Key? key, required this.event}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Card(
          color: Colors.white,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              buildListTile(context),
              buildDescription(),
              buildDetailsButton(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildListTile(BuildContext context) {
    return ListTile(
      leading: const Icon(
        Icons.event,
        size: 40,
        color: Colors.blueAccent,
      ),
      title: RichText(
        text: TextSpan(
          style: DefaultTextStyle.of(context).style,
          children: <TextSpan>[
            const TextSpan(
              text: 'Titulo ',
              style: TextStyle(
                  color: Colors.blueAccent,
                  fontWeight: FontWeight.w400,
                  fontSize: 18),
            ),
            TextSpan(
              text: event.title,
              style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w300,
                  fontSize: 18),
            ),
          ],
        ),
      ),
      subtitle: RichText(
        text: TextSpan(
          style: DefaultTextStyle.of(context).style,
          children: <TextSpan>[
            TextSpan(
              text: event.countdown.toString(),
              style: TextStyle(
                  color: event.countdown < 5 ? Colors.redAccent : Colors.green,
                  fontSize: 20),
            ),
            const TextSpan(
              text: ' days countdown',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w300,
                  fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildDescription() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      child: Text('Description: ${event.description}'),
    );
  }

  Widget buildDetailsButton(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            onPressed: () {
              showModalBottomSheet(
                // al hacer un click se muestra una modal, que retorna el widget EventDetailModal
                context: context,
                builder: (BuildContext context) {
                  return EventDetailsModal(event: event);
                },
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              padding: const EdgeInsets.all(8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const Text(
              'SEE DETAILS',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        )
      ],
    );
  }
}
