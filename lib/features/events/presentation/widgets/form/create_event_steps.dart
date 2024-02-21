import 'package:flutter/material.dart';

import '../../../domain/entities/events_entity.dart';

class Step1Form extends StatelessWidget {
  final void Function(String) action;

  const Step1Form({Key? key, required this.action}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          TextFormField(
            onChanged: (value) {
              // Actualizar el modelo cuando cambia el contenido del campo
              //eventData.title = value;
              print(value);
              action('El values es $value');
            },
            decoration: InputDecoration(labelText: 'Event Title'),
          ),
          // Otros campos según sea necesario
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
          TextFormField(
            onChanged: (value) {
              // Actualizar el modelo cuando cambia el contenido del campo
              // eventData.description = value;
              // TODO hacer lo de react -> un callBack que modifique los datos en el container
            },
            decoration: InputDecoration(labelText: 'Event Description'),
          ),
          // Otros campos según sea necesario
        ],
      ),
    );
  }
}
