import 'package:events/features/events/presentation/widgets/form/create_event_form_steps.dart';
import 'package:flutter/material.dart';

class PageViewForm extends StatefulWidget {
  const PageViewForm({super.key});

  @override
  State<PageViewForm> createState() => _PageViewFormState();
}

class _PageViewFormState extends State<PageViewForm> {
  late PageController _pageController;
  int _currentPage = 0;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  String? selectedColor;
  final TextEditingController descriptionController = TextEditingController();

  final GlobalKey<FormState> formKeyPage1 = GlobalKey<FormState>();
  final GlobalKey<FormState> formKeyPage2 = GlobalKey<FormState>();
  final GlobalKey<FormState> formKeyPage3 = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentPage);
  }

  void _navigateForward() {
    if (_currentPage < 2) {
      if (_validateCurrentPage()) {
        _pageController.nextPage(
          duration: const Duration(milliseconds: 500),
          curve: Curves.ease,
        );
      }
    }
  }

  void _navigateBackward() {
    if (_currentPage > 0) {
      _pageController.previousPage(
        duration: Duration(milliseconds: 500),
        curve: Curves.ease,
      );
    }
  }

  bool _validateCurrentPage() {
    switch (_currentPage) {
      case 0:
        return formKeyPage1.currentState!.validate();
      case 1:
        return formKeyPage2.currentState!.validate();
      case 2:
        return formKeyPage3.currentState!.validate();
      default:
        return true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: Row(
        //   children: [
        //     Text('Formulario de Páginas'),
        //     Spacer(),
        //     CircularProgressIndicator( value: (_currentPage + 1) / 3,
        //     color: Colors.blue,)
        //   ],
        // ),
        title: Text('Formulario de Páginas'),
      ),
      body: Theme(
        data: ThemeData(colorSchemeSeed: Colors.blue),
        child: Column(
          children: [
            LinearProgressIndicator(
              color: Colors.blue,
              semanticsLabel: 'Progress',
              borderRadius: BorderRadius.circular(50),
              value: (_currentPage + 1) / 3, // Calcula el progreso
            ),
            Expanded(
              child: PageView(
                physics: const NeverScrollableScrollPhysics(),
                // Deshabilita el deslizamiento
                controller: _pageController,
                onPageChanged: (int page) {
                  setState(() {
                    _currentPage = page;
                  });
                },
                children: [
                  SingleChildScrollView(
                      child: CreateEventStepOne(
                          formKeyPage: formKeyPage1,
                          nameController: nameController,
                          lastNameController: lastNameController,
                          navigateForward: _navigateForward,
                          addressController: addressController)),
                  SingleChildScrollView(
                      child: CreateEventStepTwo(
                    descriptionController: descriptionController,
                    formKeyPage: formKeyPage2,
                    navigateBackward: _navigateBackward,
                    navigateForward: _navigateForward,
                    selectedColor: selectedColor,
                  )),
                  SingleChildScrollView(child: _buildFormPage3()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFormPage2() {
    return Form(
      key: formKeyPage2,
      child: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Page 2 - Color Favorito'),
            SizedBox(height: 20),
            DropdownButtonFormField<String>(
              value: selectedColor,
              onChanged: (value) {
                setState(() {
                  selectedColor = value;
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
              controller: descriptionController,
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
                  onPressed: _navigateBackward,
                  child: Text('Atrás'),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: (){},
                  child: Text('Siguiente'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFormPage3() {
    return Form(
      key: formKeyPage3,
      child: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Page 3 - Resumen'),
            SizedBox(height: 20),
            Text('Nombre: ${nameController.text}'),
            Text('Apellido: ${lastNameController.text}'),
            Text('Dirección: ${addressController.text}'),
            Text('Color Favorito: $selectedColor'),
            Text('Descripción: ${descriptionController.text}'),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: _navigateBackward,
                  child: Text('Atrás'),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_validateCurrentPage()) {
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
