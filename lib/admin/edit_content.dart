import 'dart:io';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';

class EditWorkoutScreen extends StatefulWidget {
  final String documentId;

  const EditWorkoutScreen({Key? key, required this.documentId})
      : super(key: key);

  @override
  State<EditWorkoutScreen> createState() => _EditWorkoutScreenState();
}

class _EditWorkoutScreenState extends State<EditWorkoutScreen> {
  File? _image;
  Uint8List? selectedImageByInBytes;
  String _selectedOption = '';
  String _selectedSubOption = '';
  final TextEditingController _workoutNameController = TextEditingController();
  final TextEditingController _durationController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _idController = TextEditingController();

  final Map<String, List<String>> _levelOptions = {
    'BEGINNER': [
      'ABS BEGINNER',
      'CHEST BEGINNER',
      'ARM BEGINNER',
      'LEG BEGINNER'
    ],
    'INTERMEDIATE': [
      'ABS INTERMEDIATE',
      'CHEST INTERMEDIATE',
      'ARM INTERMEDIATE',
      'LEG INTERMEDIATE'
    ],
    'ADVANCED': [
      'ABS ADVANCED',
      'CHEST ADVANCED',
      'ARM ADVANCED',
      'LEG ADVANCED'
    ],
    'FULLBODY 7X4CHALLENGE': [
      'DAY1',
      'DAY2',
      'DAY3',
      'DAY4',
      'DAY5',
      'DAY6',
      'DAY7',
      'DAY8',
      'DAY9',
      'DAY10',
      'DAY11',
      'DAY12',
      'DAY13',
      'DAY14',
      'DAY15',
      'DAY16',
      'DAY17',
      'DAY18',
      'DAY19',
      'DAY20',
      'DAY21',
      'DAY22',
      'DAY23',
      'DAY24',
      'DAY25',
      'DAY26',
      'DAY27',
      'DAY28',
    ]
  };
  bool _saving = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Content'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: GestureDetector(
                onTap: _pickImageAndEditWorkout,
                child: Container(
                  height: 400,
                  width: 400,
                  decoration: BoxDecoration(border: Border.all()),
                  child: _image != null
                      ? Image.file(_image!, fit: BoxFit.cover)
                      : const Center(child: Icon(Icons.add_a_photo, size: 60)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                width: 400,
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DropdownButton<String>(
                    value: _selectedOption.isNotEmpty ? _selectedOption : null,
                    hint: const Text('Select a level'),
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedOption = newValue ?? '';
                        _selectedSubOption = '';
                      });
                    },
                    items: <String>[
                      'BEGINNER',
                      'INTERMEDIATE',
                      'ADVANCED',
                      'FULLBODY 7X4CHALLENGE',
                      'custom workout'
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),
            if (_selectedOption.isNotEmpty)
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  width: 400,
                  decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DropdownButton<String>(
                      value: _selectedSubOption.isNotEmpty
                          ? _selectedSubOption
                          : null,
                      hint: const Text('Select an option'),
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedSubOption = newValue ?? '';
                        });
                      },
                      items: _levelOptions[_selectedOption]
                              ?.map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList() ??
                          [],
                    ),
                  ),
                ),
              ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextFormField(
                controller: _workoutNameController,
                decoration: const InputDecoration(
                  hintText: 'ENTER WORKOUT NAME',
                  labelText: 'WORKOUT NAME',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextFormField(
                controller: _durationController,
                decoration: const InputDecoration(
                  hintText: 'ENTER WORKOUT DURATION',
                  labelText: 'DURATION',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextFormField(
                controller: _descriptionController,
                maxLines: null,
                decoration: const InputDecoration(
                  hintText: 'Enter workout description.',
                  labelText: 'Description',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextFormField(
                controller: _idController,
                decoration: const InputDecoration(
                  hintText: 'Enter Itom cound',
                  labelText: 'Itom cound',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () => _editWorkout(widget.documentId),
                  child: _saving
                      ? const CircularProgressIndicator()
                      : const Text(
                          'Save',
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _pickImageAndEditWorkout() async {
    FilePickerResult? picked = await FilePicker.platform.pickFiles();

    if (picked != null) {
      _image = File(picked.files.single.path!);
      selectedImageByInBytes = await _image?.readAsBytes();

      setState(() {});
    }
  }

 Future<void> _editWorkout(String documentId) async {
  try {
    setState(() {
      _saving = true;
    });

    // Validate input fields
    if (_image == null ||
        _workoutNameController.text.isEmpty ||
        _durationController.text.isEmpty ||
        _descriptionController.text.isEmpty ||
        _selectedOption.isEmpty ||
        _selectedSubOption.isEmpty ||
        _idController.text.isEmpty) {
      print("Please fill in all fields.");
      setState(() {
        _saving = false;
      });
      return;
    }

    // Upload image to Firebase Storage
    String fileName = _image!.path.split('/').last;
    Uint8List imageData = await _image!.readAsBytes();
    firebase_storage.Reference ref = firebase_storage
        .FirebaseStorage.instance
        .ref('workoutImage')
        .child(fileName);
    firebase_storage.UploadTask task = ref.putData(imageData);
    firebase_storage.TaskSnapshot snapshot = await task.whenComplete(() {});
    String downloadURL = await snapshot.ref.getDownloadURL();
    print("Image uploaded to Firebase Storage: $downloadURL");

    // Call the updateWorkoutDetailsInFirestore method here
    await updateWorkoutDetailsInFirestore(
      documentId,
      downloadURL,
      _selectedOption,
      _selectedSubOption,
      _workoutNameController.text,
      _durationController.text,
      _descriptionController.text,
      int.parse(_idController.text),
    );

    // Clear input fields and reset state
    _image = null;
    _selectedOption = '';
    _selectedSubOption = '';
    _workoutNameController.clear();
    _durationController.clear();
    _descriptionController.clear();
    _idController.clear();

    setState(() {
      _saving = false;
    });
  } catch (e) {
    print("Error saving workout details: $e");
    setState(() {
      _saving = false;
    });
  }
}

}

// Define the updateWorkoutDetailsInFirestore method outside of the _EditWorkoutScreenState class
Future<void> updateWorkoutDetailsInFirestore(
  String documentId,
  String downloadURL,
  String selectedOption,
  String selectedSubOption,
  String workoutName,
  String duration,
  String description,
  int id,
) async {
  try {
    await FirebaseFirestore.instance
        .collection('admin')
        .doc(documentId)
        .update({
      'imageUrl': downloadURL,
      'level': selectedOption,
      'option': selectedSubOption,
      'workoutName': workoutName,
      'duration': duration,
      'description': description,
      'id': id,
    });
    print('Workout details updated in Firestore.');
  } catch (e) {
    print("Error updating workout details: $e");
  }
}

