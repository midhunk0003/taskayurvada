import 'dart:convert';
import 'dart:io';

import 'package:ayurveda/models/branchlistmodel/branch.dart';
import 'package:ayurveda/models/branchlistmodel/branchlistmodel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class BranchListProvider extends ChangeNotifier {
  List<Branch> _branches = [];

  List<Branch> get branches => _branches;

  Future<void> fetchBranches(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    if (token == null) {
      // Handle token not found error
      return;
    }

    Uri url = Uri.parse('https://flutter-amr.noviindus.in/api/BranchList');
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
        List<dynamic> data = json.decode(response.body)['branches'];
        _branches = data.map((item) => Branch.fromJson(item)).toList();
        print(_branches);
        notifyListeners();
      } else {
        throw Exception('Failed to load branches');
      }
    } on SocketException {
      _showErrorSnackbar(context, 'Network error. Please try again.');
    } catch (e) {
      // Handle network errors
      print('Error fetching branch: $e');
    }
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
