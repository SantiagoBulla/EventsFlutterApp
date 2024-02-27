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
    _pageController = PageController(initialPage: _currentPage); // initialize the page view with the page 0
  }

  void _navigateForward() {
    if (_currentPage < 2) {
      if (_validateCurrentPage()) {
        _pageController.nextPage(
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeOut,
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

  // validates the key form for each page and return true if all the fields are filled
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
        title: Row(
          children: [
            Text('Formulario de Páginas'),
            Spacer(),
            CircularProgressIndicator(
                value: (_currentPage + 1) / 3, color: Colors.blue)
          ],
        ),
        // title: Text('Formulario de Páginas'),
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
                physics: const NeverScrollableScrollPhysics(), // Deshabilita el deslizamiento
                controller: _pageController, //
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
                    updateSelectedColor: (String? color) {
                      setState(() {
                        selectedColor = color;
                      });
                    },
                  )),
                  SingleChildScrollView(
                      child: CreateEventStepThree(
                    formKeyPage: formKeyPage3,
                    nameController: nameController,
                    lastNameController: lastNameController,
                    addressController: addressController,
                    selectedColor: selectedColor,
                    descriptionController: descriptionController,
                    navigateBackward: _navigateBackward,
                    validateCurrentPage: _validateCurrentPage,
                  )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
