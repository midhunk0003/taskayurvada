import 'dart:convert';
import 'dart:io';

import 'package:ayurveda/models/tretmentlistmodel/treatment.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class TreatmentListProvider extends ChangeNotifier {
  List<Treatment> _treatmentlistapi = [];

  List<Treatment> get treatmentlistapi => _treatmentlistapi;

  List<Map<String, dynamic>> _treatment = [];
  late final int _id = 1;
  List<Map<String, dynamic>> get treatment => _treatment;
  int get id => _id;

  Future<void> fetchdatafromtreatmentlist(context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    if (token == null) {
      // Handle token not found error
      return;
    }

    Uri url = Uri.parse('https://flutter-amr.noviindus.in/api/TreatmentList');
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
        List<dynamic> data = json.decode(response.body)['treatments'];
        _treatmentlistapi =
            data.map((item) => Treatment.fromJson(item)).toList();
        print(_treatmentlistapi);
        notifyListeners();
      } else {
        throw Exception('Failed to load branches');
      }
    } on SocketException {
      // _showErrorSnackbar(context, 'Network error. Please try again.');
    } catch (e) {
      // Handle network errors
      print('Error fetching branch: $e');
    }
  }

  void saveData(String? treatmentname, int? malecount, int? femalecount) {
    // final iu1 = treatment.toList();
    final id = treatment.isEmpty ? 1 : treatment.last['id'] + 1;
    Map<String, dynamic> data = {
      'id': id,
      'treatmentname': treatmentname,
      'malecount': malecount,
      'femalecount': femalecount,
    };

    print(data);

    _treatment.add(data);
    print(_treatment);
    notifyListeners();
  }

  void deleteData(int id) {
    int getid = id;
    treatment.removeWhere((element) => element['id'] == getid);
    print(treatment);
    notifyListeners();
  }
}
