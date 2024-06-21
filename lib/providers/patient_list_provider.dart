import 'dart:convert';
import 'dart:io';
import 'package:ayurveda/models/patientlistmodel/patientdetails_set.dart';
import 'package:http/http.dart' as http;
import 'package:ayurveda/models/patientlistmodel/patient.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PatientListProvider extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  List<Patient> _patients = [];
  // List<PatientdetailsSet> _patientsset = [];

  List<Patient> get patients => _patients;
  // List<PatientdetailsSet> get patientsset => _patientsset;

  List<Patient> _filteredPatients = [];
  String _searchQuery = '';

  List<Patient> get filteredPatients => _filteredPatients;

  Future<void> fetchPatients(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    if (token == null) {
      // Handle token not found error
      return;
    }

    Uri url = Uri.parse('https://flutter-amr.noviindus.in/api/PatientList');
    try {
      final response = await http.get(
        url,
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      );
      print(response.body);
      if (response.statusCode == 200) {
        print('123');
        // Map<String, dynamic> jsonResponse = jsonDecode(response.body);
        // Successful API call
        // Decode the JSON data
        final List<dynamic> jsonData = json.decode(response.body)['patient'];
        // final List<dynamic> jsonData2 =
        //     json.decode(response.body)['patientdetails_set'];
        // print(11111);
        // Map the JSON data to a list of Patient objects
        // Map the JSON data to a list of Patient objects
        _patients = jsonData.map((data) => Patient.fromJson(data)).toList();
        // _patientsset =
        //     jsonData2.map((item) => PatientdetailsSet.fromJson(item)).toList();

        notifyListeners();
        print('success');
      } else {
        // Handle other status codes
        print('Failed to load patients: ${response.statusCode}');
      }
    } on SocketException {
      _showErrorSnackbar(context, 'Network error. Please try again.');
    } catch (e) {
      // Handle network errors
      print('Error fetching patients: $e');
    }
  }

  void _showErrorSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
      ),
    );
  }

  Future<void> updateSearchQuery(String query) async {
    // Set loading state to true
    _isLoading = true;
    notifyListeners(); // Notify listeners to update UI

    await Future.delayed(Duration(seconds: 2)); // Simulating a delay

    // Update search query and filter patients
    _searchQuery = query;
    _filteredPatients = _patients
        .where((patient) =>
            patient.name!.toLowerCase().contains(_searchQuery.toLowerCase()))
        .toList();
    print(filteredPatients.toList().length);
    // Set loading state to false
    _isLoading = false;
    notifyListeners(); // Notify listeners to update UI
  }
}
