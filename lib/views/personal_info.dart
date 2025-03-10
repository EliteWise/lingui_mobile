import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lingui_mobile/widgets/navigation.dart';

import '../widgets/searchable_dropdown.dart';

class LanguageSelectionPage extends StatefulWidget {
  const LanguageSelectionPage({super.key});

  @override
  _LanguageSelectionPageState createState() => _LanguageSelectionPageState();
}

class _LanguageSelectionPageState extends State<LanguageSelectionPage> {
  String? selectedCountry;
  String? nativeLanguage;
  String? learningLanguage;

  String? username;
  DateTime? birthdate;
  XFile? profileImage;

  late int _currentStep = 0;

  final List<String> countries = ['Korea', 'France', 'USA', 'Japan', 'Germany'];
  final List<String> languages = ['English', 'Français', 'Español', 'Deutsch', '한국어'];

  List<String> filteredCountries = [];
  List<String> filteredLanguages = [];

  final TextEditingController countryController = TextEditingController();
  final TextEditingController languageController = TextEditingController();

  String? countryError;
  String? nativeLanguageError;
  String? learningLanguageError;
  String? usernameError;
  String? birthdateError;

  bool get _isStepValid {
    if (_currentStep == 0) {
      return selectedCountry != null && nativeLanguage != null && learningLanguage != null;
    } else if (_currentStep == 1) {
      return username != null && birthdate != null;
    }
    return false;
  }

  @override
  void initState() {
    super.initState();
    filteredCountries = List.from(countries);
    filteredLanguages = List.from(languages);

    countryController.addListener(() {
      _filterCountries(countryController.text);
    });

    languageController.addListener(() {
      _filterLanguages(languageController.text);
    });
  }

  void _filterCountries(String query) {
    setState(() {
      filteredCountries = countries.where((country) => country.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  void _filterLanguages(String query) {
    setState(() {
      filteredLanguages = languages
          .where((language) => language.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  void _nextStep() {
    setState(() {
      if (_currentStep == 0) {
        countryError = selectedCountry == null ? "Please select your country" : null;
        nativeLanguageError = nativeLanguage == null ? "Please select your native language" : null;
        learningLanguageError = learningLanguage == null ? "Please select a language to learn" : null;
      } else if (_currentStep == 1) {
        usernameError = (username == null || username!.isEmpty) ? "Please enter your username" : null;
        birthdateError = birthdate == null ? "Please select your birthdate" : null;
      }
    });

    bool isValid = _isStepValid;

    if (!isValid) return;

    if (_currentStep < 1) {
      setState(() {
        _currentStep++;
      });
    } else {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const Navigation()),
      );
    }
  }

  void _previousStep() {
    if (_currentStep > 0) {
      setState(() {
        _currentStep--;
      });
    }
  }

  Future<void> _selectBirthDate() async {
    final DateTime currentDate = DateTime.now();
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: currentDate,
      firstDate: DateTime(1900),
      lastDate: currentDate,
    );

    if (pickedDate != null) {
      setState(() {
        birthdate = pickedDate;
      });
    }
  }

  final ImagePicker picker = ImagePicker();

  Future<void> _pickImage() async {
    final XFile? pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        profileImage = pickedFile;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Informations about you')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stepper(
          currentStep: _currentStep,
          onStepContinue: _nextStep,
          onStepCancel: _previousStep,
          steps: [
            Step(
                title: const Text("Languages"),
                content: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SearchableDropdown(
                      label: "I'm from",
                      options: countries,
                      selectedValue: selectedCountry,
                      onSelected: (value) {
                        setState(() {
                          selectedCountry = value;
                          countryError = null;
                        });
                      },
                      hintText: "Search your country",
                      errorText: countryError,
                    ),
                    const SizedBox(height: 16),
                    SearchableDropdown(
                      label: "Native language",
                      options: languages,
                      selectedValue: nativeLanguage,
                      onSelected: (value) {
                        setState(() {
                          nativeLanguage = value;
                          nativeLanguageError = null;
                        });
                      },
                      hintText: "Search your language",
                      errorText: nativeLanguageError,
                    ),
                    const SizedBox(height: 16),
                    SearchableDropdown(
                      label: "I'm learning",
                      options: languages,
                      selectedValue: learningLanguage,
                      onSelected: (value) {
                        setState(() {
                          learningLanguage = value;
                          learningLanguageError = null;
                        });
                      },
                      hintText: "Search your learning language",
                      errorText: learningLanguageError,
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
            ),
            Step(
                title: const Text('Personal informations'),
                content: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("You can skip the profile picture for privacy.",
                        style: TextStyle(fontSize: 16), textAlign: TextAlign.start),
                    GestureDetector(
                      onTap: _pickImage,
                      child: profileImage == null
                          ? Container(
                        width: 100,
                        height: 100,
                        color: Colors.grey[300],
                        child: const Icon(Icons.camera_alt, color: Colors.white),
                      )
                          : Image.file(
                        File(profileImage!.path),
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      onChanged: (value) {
                        setState(() {
                          username = value;
                        });
                      },
                      decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          hintText: 'Enter your username'),
                    ),
                    const SizedBox(height: 16),
                    GestureDetector(
                      onTap: _selectBirthDate,
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
                        decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(color: Colors.grey, width: 1)
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          birthdate == null
                              ? 'Select your birthdate'
                              : '${birthdate!.day}/${birthdate!.month}/${birthdate!.year}',
                          style: const TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                  ],
                )
            )
          ],
        )
      ),
    );
  }
}
