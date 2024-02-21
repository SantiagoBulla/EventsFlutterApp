import 'package:flutter/material.dart';

import '../../domain/entities/events_entity.dart';

class EventDetailsModal extends StatelessWidget {
  final EventEntity event;

  const EventDetailsModal({Key? key, required this.event}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white, // Color de fondo de la ventana modal
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: buildTextDetail(
                  '', 'Event Details', 24, Colors.blue, FontWeight.bold),
            ),
            const SizedBox(height: 16),
            buildTextDetail(
                'Title:', event.title, 18, Colors.blueGrey, FontWeight.bold),
            const SizedBox(height: 8),
            buildTextDetail('Description', event.description, 16, Colors.grey,
                FontWeight.normal),
            const SizedBox(height: 8),
            buildTextDetail(
                'scheduled date:',
                event.date.toIso8601String().substring(0, 10), // transformar el DateTime a YYYY-MM-DD
                16,
                Colors.grey,
                FontWeight.normal),
            const SizedBox(height: 8),
            Center(
              child: Text(
                'Countdown: ${event.countdown} days',
                style: TextStyle(
                  fontSize: 16,
                  // Tamaño de fuente del texto de cuenta regresiva
                  color: event.countdown < 5 ? Colors.deepOrange : Colors.green,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // Cerrar la ventana modal
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.redAccent,
                    padding: const EdgeInsets.all(12), // Relleno del botón
                  ),
                  child: const Text(
                    'CLOSE',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w800),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTextDetail(String label, String data, double fontSize,
      Color color, FontWeight weight) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      child: Text(
        '$label $data',
        style: TextStyle(
            fontSize: fontSize, // Tamaño de fuente del texto de descripción
            color: color, // Color del texto de descripción
            fontWeight: weight),
      ),
    );
  }
}
