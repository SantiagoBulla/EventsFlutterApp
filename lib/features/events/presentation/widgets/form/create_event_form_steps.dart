import 'package:flutter/material.dart';

// * STEP ONE

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

// * STEP TWO
// TODO capturar color para enviar formulario
class CreateEventStepTwo extends StatefulWidget {
  final GlobalKey<FormState> formKeyPage;
  final TextEditingController descriptionController;
  final String? selectedColor;
  final VoidCallback navigateBackward;
  final VoidCallback navigateForward;

  const CreateEventStepTwo(
      {super.key,
      required this.formKeyPage,
      required this.descriptionController,
      required this.selectedColor,
      required this.navigateBackward,
      required this.navigateForward});

  @override
  State<CreateEventStepTwo> createState() => _CreateEventStepTwoState();
}

class _CreateEventStepTwoState extends State<CreateEventStepTwo> {
  String? userColor;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKeyPage,
      child: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Page 2 - Color Favorito'),
            SizedBox(height: 20),
            DropdownButtonFormField<String>(
              value: widget.selectedColor,
              onChanged: (value) {
                setState(() {
                  userColor = value;
                });
              },
              items: [
                DropdownMenuItem(
                  value: 'Rojo',
                  child: Text('Rojo'),
                ),
                DropdownMenuItem(
                  value: 'Azul',
                  child: Text('Azul'),
                ),
                DropdownMenuItem(
                  value: 'Verde',
                  child: Text('Verde'),
                ),
              ],
              decoration:
                  InputDecoration(labelText: 'Selecciona tu color favorito'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor, selecciona tu color favorito';
                }
                return null;
              },
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: widget.descriptionController,
              decoration: InputDecoration(labelText: 'Descripción'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor, ingresa una descripción';
                }
                return null;
              },
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: widget.navigateBackward,
                  child: Text('Atrás'),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: (){
                    widget.navigateForward;
                    print(userColor);
                    print(widget.selectedColor);
                  },
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
