import 'package:flutter/material.dart';

import '../../../domain/entities/events_entity.dart';

class Step1Form extends StatelessWidget {
  final void Function(String, dynamic) action;
  final EventEntity eventData;

  const Step1Form({Key? key, required this.action, required this.eventData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          TextFormField(
            onChanged: (value) {
              eventData.updateDescription(value);
              action(value, '');
            },
            decoration: const InputDecoration(labelText: 'Event Title'),
          ),
          TextFormField(
            onChanged: (value) {
              eventData.updateTitle(value);
              action(value, '');
            },
            decoration: const InputDecoration(labelText: 'Event Description'),
          ),
        ],
      ),
    );
  }
}

class Step2Form extends StatelessWidget {
  final EventEntity eventData;

  const Step2Form({Key? key, required this.eventData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          CalendarDatePicker(
            initialDate: DateTime.now(),
            firstDate: DateTime.now(),
            lastDate: DateTime.now().add(const Duration(days: 365)),
            onDateChanged: (date) {
              // print(date.toString().split(' ')[0]); -> format YYYY-MM-DD
              eventData.updateDate(date);
            },
          ),
          // Otros campos según sea necesario
        ],
      ),
    );
  }
}
