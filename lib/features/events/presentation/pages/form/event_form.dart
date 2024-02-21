import 'package:flutter/material.dart';

import '../../../domain/entities/events_entity.dart';
import '../../widgets/form/create_event_steps.dart';
import '../../widgets/form/custom_event_form.dart';

class EventForm extends StatefulWidget {
  const EventForm({super.key});

  @override
  State<EventForm> createState() => _EventFormState();
}

class _EventFormState extends State<EventForm> {
  int _currentStepForm = 0;

  final eventTitle = TextEditingController();
  final eventDescription = TextEditingController();
  final address = TextEditingController(); // ! date picker
  final postcode = TextEditingController();

  late EventEntity eventData = EventEntity(
    id: 0,
    // Puedes asignar un valor inicial según sea necesario
    title: '',
    description: '',
    date: DateTime.now(),
    // Puedes asignar un valor inicial según sea necesario
    idUser: '',
    countdown: 0, // Puedes asignar un valor inicial según sea necesario
  );

  void action (value){
    print('el value en Stepper es $value');
  }

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
          onStepContinue: () => goForward(),
          onStepCancel: () => goBack(),
          onStepTapped: (step) => setState(() => _currentStepForm = step),
          controlsBuilder: controllerFormButtons, // custom the buttons actions
        ),
      ),
    );
  }

  List<Step> formSteps() => [
        Step(
          title: const Text('Overall'),
          state: _currentStepForm <= 0 ? StepState.editing : StepState.complete,
          isActive: _currentStepForm >= 0,
          // content: Center(
          //   child: Column(
          //     children: <Widget>[
          //       TextFormField(
          //         controller: eventTitle,
          //         decoration: InputDecoration(labelText: 'First Name'),
          //       ),
          //       TextFormField(
          //         controller: eventDescription,
          //         decoration: InputDecoration(labelText: 'Last Name'),
          //       ),
          //     ],
          //   ),
          // ),
          content: Step1Form(action: action),
        ),
        Step(
          title: const Text('Pick Date'),
          state: _currentStepForm <= 1 ? StepState.editing : StepState.complete,
          isActive: _currentStepForm >= 1,
          content: Center(
            child: Column(
              children: <Widget>[
                TextFormField(
                  controller: address,
                  decoration: InputDecoration(labelText: 'Address'),
                ),
                TextFormField(
                  controller: postcode,
                  decoration: InputDecoration(labelText: 'Post code'),
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
              Text('${eventData.title}'),
              Text('${eventData.description}'),
              Text('${eventData.countdown}'),
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
      print('Send the event to the server');
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
