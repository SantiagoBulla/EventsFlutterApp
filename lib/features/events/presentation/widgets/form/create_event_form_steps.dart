import 'package:flutter/material.dart';

// * STEP ONE

class CreateEventStepOne extends StatefulWidget {
  final GlobalKey<FormState> formKeyPage;
  final TextEditingController nameController;
  final TextEditingController lastNameController;
  final TextEditingController addressController;
  final VoidCallback navigateForward;


  const CreateEventStepOne({super.key,
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
  final void Function(String?) updateSelectedColor;

  const CreateEventStepTwo({super.key,
    required this.formKeyPage,
    required this.descriptionController,
    required this.selectedColor,
    required this.navigateBackward,
    required this.navigateForward,
    required this.updateSelectedColor});

  @override
  State<CreateEventStepTwo> createState() => _CreateEventStepTwoState();
}

class _CreateEventStepTwoState extends State<CreateEventStepTwo> {

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
                  widget.updateSelectedColor(value);
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


// * STEP THREE
class CreateEventStepThree extends StatefulWidget {
  final GlobalKey<FormState> formKeyPage;
  final TextEditingController nameController;
  final TextEditingController lastNameController;
  final TextEditingController addressController;
  final String? selectedColor;
  final TextEditingController descriptionController;
  final VoidCallback navigateBackward;
  final bool Function() validateCurrentPage;

  const CreateEventStepThree(
      {super.key, required this.formKeyPage, required this.nameController, required this.lastNameController, required this.addressController, this.selectedColor, required this.descriptionController, required this.navigateBackward, required this.validateCurrentPage});

  @override
  State<CreateEventStepThree> createState() => _CreateEventStepThreeState();
}

class _CreateEventStepThreeState extends State<CreateEventStepThree> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKeyPage,
      child: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Page 3 - Resumen'),
            SizedBox(height: 20),
            Text('Nombre: ${widget.nameController.text}'),
            Text('Apellido: ${widget.lastNameController.text}'),
            Text('Dirección: ${widget.addressController.text}'),
            Text('Color Favorito: ${widget.selectedColor}'),
            Text('Descripción: ${widget.descriptionController.text}'),
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
                  onPressed: () {
                    bool statusValidation = widget.validateCurrentPage();
                    if (statusValidation) {
                      // Puedes realizar acciones adicionales o enviar el formulario
                      // Imprimir datos o enviarlos a través de una función, etc.
                      print('Formulario enviado');
                    }
                  },
                  child: Text('Enviar'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
