import 'dart:io';

import 'package:ayurveda/models/patientmodel_insert/patientmodel_insert.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class PatientProvider with ChangeNotifier {
  Future<void> insertPatient(context, PatientmodelInsert patient) async {
    print('123');
    print('010101010101010101 : ${patient}');
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    if (token == null) {
      // Handle token not found error
      return;
    }

    Uri url = Uri.parse('https://flutter-amr.noviindus.in/api/PatientUpdate');
    final String jsonBody = json.encode(patient.toJson());
    try {
      final response = await http.post(
        url,
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      );
      print(response.body);
      if (response.statusCode == 200) {
        // List<dynamic> data = json.decode(response.body)['branches'];
        // print('Patient inserted successfully: ${response.body}');
        // final jsonBody = patient.toJson();
        // // _branches = data.map((item) => Branch.fromJson(item)).toList();
        final response = await http.post(url, body: jsonBody);
        print(response);
        notifyListeners();
      } else {
        print('Failed to insert patient. Status code: ${response.statusCode}');
        print('Response body: ${response.body}');
        // final message = response.statusCode;
        _showErrorSnackbar(context, 'internal server error 500');

        throw Exception('Failed to insert patient');
      }
    } on SocketException {
      _showErrorSnackbar(context, 'Network error. Please try again.');
    } catch (e) {
      // Handle network errors
      print('Error fetching branch: $e');
    }
  }

  void _showErrorSnackbar(BuildContext context, dynamic message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
      ),
    );
  }
}
