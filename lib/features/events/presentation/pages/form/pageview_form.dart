// // ignore_for_file: avoid_print
//
// import 'package:flutter/material.dart';
// import 'package:form_page_view/enum/progress_enum.dart';
// import 'package:form_page_view/models/form_page_model.dart';
// import 'package:form_page_view/form_page_view.dart';
// import 'package:form_page_view/models/form_page_style.dart';
//
// /// [LIBRARY] -> https://pub.dev/packages/form_page_view
//
// class PageViewForm extends StatefulWidget {
//   const PageViewForm({super.key});
//
//   @override
//   State<PageViewForm> createState() => _PageViewFormState();
// }
//
// class _PageViewFormState extends State<PageViewForm> {
//   // Controllers
//   final titleEventController = TextEditingController();
//   final descriptionEventController = TextEditingController();
//   final firstNameController = TextEditingController();
//   final lastNameController = TextEditingController();
//   DateTime? selectedDate;
//
//   @override
//   Widget build(BuildContext context) {
//     // Forms keys
//     final GlobalKey<FormState> formKeyPage1 = GlobalKey<FormState>();
//     final GlobalKey<FormState> formKeyPage2 = GlobalKey<FormState>();
//     final GlobalKey<FormState> formKeyPage3 = GlobalKey<FormState>();
//
//     Future<void> _selectDate(BuildContext context) async {
//       final DateTime? picked = await showDatePicker(
//         context: context,
//         initialDate: DateTime.now(),
//         firstDate: DateTime.now(),
//         lastDate: DateTime(2101),
//       );
//
//       if (picked != null && picked != selectedDate) {
//         setState(() {
//           selectedDate = picked;
//         });
//         // Aquí puedes realizar acciones con la fecha seleccionada
//         print('Fecha seleccionada: $picked');
//       }
//     }
//
//     // Create a list of FormPageModel objects representing the form pages
//     final pages = [
//       FormPageModel(
//         formKey: formKeyPage1,
//         title: 'OverAll Event Information',
//         textButton: 'Next',
//         body: Form(
//           key: formKeyPage1,
//           child: Column(
//             children: [
//               const SizedBox(height: 20),
//               TextFormField(
//                 controller: titleEventController,
//                 decoration: const InputDecoration(
//                     labelText: 'Enter a title for the event'),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter a title for the event';
//                   }
//                   return null;
//                 },
//               ),
//               const SizedBox(height: 20),
//               Expanded(
//                 child: TextFormField(
//                   controller: descriptionEventController,
//                   decoration: const InputDecoration(
//                       labelText: 'Enter a description for the event'),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please enter a description for the event';
//                     }
//                     return null;
//                   },
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//       FormPageModel(
//         isButtonEnabled: false,
//         onPressed: () {
//           print('se dio click');
//         },
//         formKey: formKeyPage2,
//         title: 'Date Event',
//         textButton: 'Next',
//         body: Form(
//           key: formKeyPage2,
//           child: Column(
//             children: [
//               const SizedBox(height: 20),
//               InkWell(
//                 onTap: () => _selectDate(context),
//                 child: InputDecorator(
//                   decoration: InputDecoration(
//                     labelText: 'Select Date',
//                     border: OutlineInputBorder(),
//                   ),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: <Widget>[
//                       Text(
//                         selectedDate != null
//                             ? ' ${selectedDate.toString().split(' ')[0]}'
//                             : 'Select a new date',
//                       ),
//                       Icon(Icons.calendar_today),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//       FormPageModel(
//         formKey: formKeyPage3,
//         title: 'Confirm the Data',
//         textButton: 'Next',
//         body: Form(
//           key: formKeyPage3,
//           child: Column(
//             children: [
//               Text('Title: ${titleEventController.value.text}'),
//               Text('Description: ${descriptionEventController.value.text}'),
//               if (selectedDate != null)
//                 Text(
//                     'Selected Date: ${selectedDate!.toString().split(' ')[0]}'),
//             ],
//           ),
//         ),
//       ),
//     ];
//
//     const style = FormPageStyle(
//       backgroundColor: Colors.white,
//       buttonHeight: 60,
//       progressIndicatorColor: Colors.amber,
//     );
//
//     return FormPageView(
//       controller: PageController(),
//       progress: ProgressIndicatorType.linear,
//       pages: pages,
//       style: style,
//       onFormSubmitted: () {
//         // print all the values
//         print('Username: ${titleEventController.text}');
//         print('First Name: ${descriptionEventController.text}');
//         print('Selected Date: ${selectedDate!.toString().split(' ')[0]}');
//       },
//     );
//   }
// }
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PageViewForm(),
    );
  }
}

class PageViewForm extends StatefulWidget {
  @override
  _PageViewFormState createState() => _PageViewFormState();
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
          duration: Duration(milliseconds: 500),
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
        title: Text('Formulario de Páginas'),
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (int page) {
          setState(() {
            _currentPage = page;
          });
        },
        children: [
          _buildFormPage1(),
          _buildFormPage2(),
          _buildFormPage3(),
        ],
      ),
    );
  }

  Widget _buildFormPage1() {
    return Form(
      key: formKeyPage1,
      child: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Page 1 - Información Básica'),
            SizedBox(height: 20),
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Nombre'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor, ingrese el nombre';
                }
                return null;
              },
            ),
            TextFormField(
              controller: lastNameController,
              decoration: InputDecoration(labelText: 'Apellido'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor, ingrese el apellido';
                }
                return null;
              },
            ),
            TextFormField(
              controller: addressController,
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
                  onPressed: _navigateForward,
                  child: Text('Siguiente'),
                ),
              ],
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
                  onPressed: _navigateForward,
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
