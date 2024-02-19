import 'package:flutter/material.dart';

import '../../widgets/form/custom_event_form.dart';

class EventForm extends StatefulWidget {
  const EventForm({super.key});

  @override
  State<EventForm> createState() => _EventFormState();
}

class _EventFormState extends State<EventForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            foregroundColor: Colors.white,
            title: const Text('Creates a new event',
                style: TextStyle(fontWeight: FontWeight.w600)),
            backgroundColor: Colors.blue),
        body: const Center(
          child: CustomEventForm(),
        ));
  }
}
