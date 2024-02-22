import 'package:flutter/material.dart';

class FlutterSteps extends StatefulWidget {
  const FlutterSteps({Key? key}) : super(key: key);

  @override
  State<FlutterSteps> createState() => _FlutterStepsState();
}

class _FlutterStepsState extends State<FlutterSteps> {
  // * CONTROL VARIABLES
  int currentStep = 0; // controls the current step form
  bool isButtonDisabled =
      true; // allows to validate if the button should be grey or blue
  bool isCompleted = false; // validate if the whole form is correct completed
  final formKey = GlobalKey<FormState>(); // allows to validate the form fields

  // * CONTROLLERS
  // Sender details
  final senderName = TextEditingController();
  final senderAddress = TextEditingController();

  // Receiver details
  final receiverName = TextEditingController();
  final receiverAddress = TextEditingController();

  // * THE STEPPER WIDGET
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Steps'),
      ),
      body: Theme(
        data: Theme.of(context).copyWith(
          colorScheme: ColorScheme.light(primary: Colors.teal),
        ),
        child: Form(
          key: formKey, // Assign the form key to validate it
          child: Stepper(
            steps: getSteps(),
            // the steps form
            type: StepperType.horizontal,
            // form orientation
            currentStep: currentStep,
            // select the current step to render it into the screen
            onStepContinue: onStepContinue,
            // method executed when next/confirm button is clicked
            onStepCancel: onStepCancel,
            // method executed when back button is clicked
            controlsBuilder:
                controlsBuilder, // The definitions fo the actions buttons, colors, size and on clicks actions
          ),
        ),
      ),
    );
  }

  void onStepContinue() {
    // the method executed when next/confirm is clicked
    final isLastStep = currentStep ==
        getSteps().length - 1; // validates if the current step is the last
    formKey.currentState!.validate(); // executed the fields validations
    bool isDetailValid =
        isDetailComplete(); // validates if the fields are empty = invalid or fill = valid

    if (isDetailValid) {
      if (isLastStep) {
        setState(() {
          isCompleted =
              true; // allows that the text button will be next or confirm
        });
        // When is the last step that is confirm, call the method to makes something on the API
        onCompletedForm();
      } else {
        setState(() {
          currentStep++;
        });
        // Validates if the next step have the fields empty or not, and decides if the button color should be grey or blue
        validateCharacteristicsToNextStep();
      }
    }
  }

  void validateCharacteristicsToNextStep() {
    formKey.currentState!.validate();
    isDetailComplete();
  }

  void onCompletedForm() {
    // Aquí puedes agregar las acciones que deseas realizar al completar todos los pasos
    print('¡Todos los pasos completados!');
  }

  void onStepCancel() {
    if (currentStep == 0) {
      // Do nothing when the current step is the 0
    } else {
      // go back to the previous step
      setState(() {
        currentStep--;
      });

      //Validates if the previous step have the fields empty or not, and decides if the button color should be grey or blue
      validateCharacteristicsToPreviousStep();
    }
  }

  void validateCharacteristicsToPreviousStep() {
    formKey.currentState!.validate();
    isDetailComplete();
  }

  // The buttons actions to each step on the form
  Widget controlsBuilder(BuildContext context, ControlsDetails details) {
    final isLastStep = currentStep ==
        getSteps().length - 1; // validates if the current step is the last

    return Container(
      margin: const EdgeInsets.only(top: 50),
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton(
              onPressed: details.onStepContinue,
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: isButtonDisabled ? Colors.grey : Colors.teal,
              ),
              child: Text(isLastStep ? 'Confirm' : 'Next'),
            ),
          ),
          const SizedBox(width: 12),
          if (currentStep != 0) //if the current step is not 0 then display a back button
            Expanded(
              child: ElevatedButton(
                onPressed: details.onStepCancel,
                child: const Text('Back'),
              ),
            ),
        ],
      ),
    );
  }

  bool isDetailComplete() {
    // validate the currentStep and for that step validates if the fields are empty
    // if are empty, the button control variable turns true o false that are equals to buttons grey or blue
    if (currentStep == 0) {
      return validateDetails(senderName.text, senderAddress.text);
    } else if (currentStep == 1) {
      return validateDetails(receiverName.text, receiverAddress.text);
    }
    return true;
  }

  bool validateDetails(String name, String address) {
    // receives 2 fields and validates if are empty and turns true o false that are equals to buttons grey or blue
    if (name.isEmpty || address.isEmpty) {
      setState(() {
        isButtonDisabled = true;
      });
      return false;
    } else {
      setState(() {
        isButtonDisabled = false;
      });
      return true;
    }
  }

  // Steps form
  List<Step> getSteps() => [
        Step(
          title: const Text('Sender'),
          state: currentStep > 0 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 0,
          content: SenderStep(
            controllerName: senderName,
            controllerAddress: senderAddress,
            onChanged: updateButtonState,
          ),
        ),
        Step(
          title: const Text('Receiver'),
          state: currentStep > 1 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 1,
          content: ReceiverStep(
            controllerName: receiverName,
            controllerAddress: receiverAddress,
            onChanged: updateButtonState,
          ),
        ),
        Step(
          state: currentStep > 2 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 2,
          title: const Text('Complete'),
          content: const Center(
            child: Text('Information Complete!'),
          ),
        ),
      ];

  void updateButtonState() {
    //validates if the text field is empty and puts the required message and turns the color button true / false
    isDetailComplete();
    formKey.currentState!.validate();
  }
}

class SenderStep extends StatelessWidget {
  final TextEditingController controllerName;
  final TextEditingController controllerAddress;
  final VoidCallback onChanged;

  const SenderStep({
    Key? key,
    required this.controllerName,
    required this.controllerAddress,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          decoration: const InputDecoration(labelText: 'Sender Name'),
          controller: controllerName,
          onChanged: (value) {
            onChanged();
          },
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "*Required.";
            }
            return null;
          },
        ),
        TextFormField(
          decoration: const InputDecoration(labelText: 'Sender Address'),
          controller: controllerAddress,
          onChanged: (value) {
            onChanged();
          },
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "*Required.";
            }
            return null;
          },
        ),
      ],
    );
  }
}

class ReceiverStep extends StatelessWidget {
  final TextEditingController controllerName;
  final TextEditingController controllerAddress;
  final VoidCallback onChanged;

  const ReceiverStep({
    Key? key,
    required this.controllerName,
    required this.controllerAddress,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          decoration: const InputDecoration(labelText: 'Receiver Name'),
          controller: controllerName,
          onChanged: (value) {
            onChanged();
          },
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "*Required.";
            }
            return null;
          },
        ),
        TextFormField(
          decoration: const InputDecoration(labelText: 'Receiver Address'),
          controller: controllerAddress,
          onChanged: (value) {
            onChanged();
          },
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "*Required.";
            }
            return null;
          },
        ),
      ],
    );
  }
}
