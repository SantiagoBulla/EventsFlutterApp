import 'package:flutter/material.dart';

class CreateEventStepOne extends StatefulWidget {
  final GlobalKey<FormState> formKeyPage;
  final TextEditingController nameController;
  final TextEditingController lastNameController;
  final VoidCallback navigateForward;

  final TextEditingController addressController;

  const CreateEventStepOne(
      {super.key,
      required this.formKeyPage,
      required this.nameController,
      required this.lastNameController,
      required this.navigateForward,
      required this.addressController});

  @override
  State<CreateEventStepOne> createState() => _CreateEventStepOneState();
}

class _CreateEventStepOneState extends State<CreateEventStepOne> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKeyPage,
      child: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Page 1 - Información Básica'),
            SizedBox(height: 20),
            TextFormField(
              controller: widget.nameController,
              decoration: InputDecoration(labelText: 'Nombre'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor, ingrese el nombre';
                }
                return null;
              },
            ),
            TextFormField(
              controller: widget.lastNameController,
              decoration: InputDecoration(labelText: 'Apellido'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor, ingrese el apellido';
                }
                return null;
              },
            ),
            TextFormField(
              controller: widget.addressController,
              decoration: InputDecoration(labelText: 'Dirección'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor, ingrese la dirección';
                }
                return null;
              },
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: widget.navigateForward,
                  child: Text('Siguiente'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
