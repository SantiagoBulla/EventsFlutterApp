import 'package:flutter/material.dart';

import '../../../domain/entities/events_entity.dart';
import '../../widgets/form/create_event_steps.dart';

class EventForm extends StatefulWidget {
  const EventForm({super.key});

  @override
  State<EventForm> createState() => _EventFormState();
}

// TODO hacer peticion post al API para crear el evento
class _EventFormState extends State<EventForm> {
  int _currentStepForm = 0;
  bool enableButton = false;

  final eventTitle = TextEditingController();
  final eventDescription = TextEditingController();
  DateTime? eventDate; // ! date picker
  final postcode = TextEditingController();

  // TODO no activar el boton de siguiente hasta que se haya escrito algo
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          foregroundColor: Colors.white,
          title: const Text('Creates a new event',
              style: TextStyle(fontWeight: FontWeight.w600)),
          backgroundColor: Colors.blue),
      body: Theme(
        data: Theme.of(context).copyWith(
          colorScheme: const ColorScheme.light(primary: Colors.lightBlue),
        ),
        child: Stepper(
          currentStep: _currentStepForm,
          steps: formSteps(),
          onStepContinue: enableButton ? () => goForward() : null,
          onStepCancel: () => goBack(),
          onStepTapped: (step) => setState(() => _currentStepForm = step),
          controlsBuilder: controllerFormButtons, // custom the buttons actions
        ),
      ),
    );
  }

  bool validateTextFields() {
    print(eventTitle.value.text.isNotEmpty );
    print(eventDescription.value.text.isNotEmpty);
    if (eventTitle.value.text.isNotEmpty ||
        eventDescription.value.text.isNotEmpty) {
      print('entra');
      return enableButton = true;
    }else{

      print('no entra');
    }
    return false;
  }

  List<Step> formSteps() => [
        Step(
          title: const Text('Overall'),
          state: _currentStepForm <= 0 ? StepState.editing : StepState.complete,
          isActive: _currentStepForm >= 0,
          content: Form(
            child: Column(
              children: [
                TextFormField(
                  controller: eventTitle,
                  decoration: const InputDecoration(labelText: 'Event Title'),
                  onChanged: (value) {
                    validateTextFields();
                  },
                ),
                TextFormField(
                  controller: eventDescription,
                  decoration:
                      const InputDecoration(labelText: 'Event Description'),
                  onChanged: (value) {
                    validateTextFields();
                  },
                ),
              ],
            ),
          ),
        ),
        Step(
          title: const Text('Pick Date'),
          state: _currentStepForm <= 1 ? StepState.editing : StepState.complete,
          isActive: _currentStepForm >= 1,
          content: Form(
            child: Column(
              children: [
                CalendarDatePicker(
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime.now().add(const Duration(days: 365)),
                  onDateChanged: (date) {
                    // print(date.toString().split(' ')[0]); -> format YYYY-MM-DD
                    eventDate = date;
                  },
                ),
              ],
            ),
          ),
        ),
        Step(
          title: const Text('Confirm'),
          state: _currentStepForm <= 2 ? StepState.editing : StepState.complete,
          isActive: _currentStepForm >= 2,
          content: Center(
              child: Column(
            children: [
              Text(eventTitle.value.text),
              Text(eventDescription.value.text),
              Text('$eventDate'),
            ],
          )),
        ),
      ];

//onStepContinue control buttons
  void goForward() {
    if (_currentStepForm < formSteps().length - 1) {
      setState(() {
        _currentStepForm++;
      });
    } else {
      // TODO hacer la connection el endpoint del API
      if (eventTitle.value.text.isEmpty ||
          eventDescription.value.text.isEmpty ||
          eventDate == null) {
        print('todos los campos son obligatorios');
      } else {
        print(
            '$eventDate , ${eventTitle.value.text}, ${eventDescription.value.text}');
        print('Send the event to the server');
      }
    }
  }

//onStepCancel control buttons
  void goBack() {
    if (_currentStepForm > 0) {
      setState(() {
        _currentStepForm--;
      });
    }
  }

  Widget controllerFormButton(void Function()? action, String txtButton) {
    return Expanded(
      child: ElevatedButton(
        onPressed: action,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.deepOrange,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Text(
          txtButton,
          style: const TextStyle(
              fontSize: 15, fontWeight: FontWeight.w500, color: Colors.white),
        ),
      ),
    );
  }

  Widget controllerFormButtons(BuildContext context, ControlsDetails details) {
    return Container(
      padding: const EdgeInsets.only(top: 25),
      child: Row(
        children: <Widget>[
          controllerFormButton(details.onStepCancel, 'Back'),
          const SizedBox(width: 10),
          controllerFormButton(details.onStepContinue, 'Continue'),
        ],
      ),
    );
  }
}
