import 'dart:convert';
import 'dart:io';
import 'package:ayurveda/models/loginresponse/loginresponse.dart';
import 'package:ayurveda/models/loginresponse/user_details.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider extends ChangeNotifier {
  final client = http.Client();
  String? _token;
  bool _isLoading = false;
  String? _errorMessage;

  Loginresponse? _user;
  Loginresponse? get user => _user;

  bool get isLoading => _isLoading;
  String? get token => _token;
  String? get errorMessage => _errorMessage;

  Future<void> setLoading(bool value) async {
    await Future.delayed(Duration(seconds: 2));
    _isLoading = value;
    notifyListeners();
  }

  Future<void> login(
      String username, String password, BuildContext context) async {
    setLoading(true);
    notifyListeners();
    try {
      final response = await client.post(
        Uri.parse('https://flutter-amr.noviindus.in/api/Login'),
        // headers: ,
        body: {
          'username': username,
          'password': password,
        },
      );
      print('${response.body}');
      setLoading(true);
      notifyListeners();
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        // _token = await data['token'];
        _user = Loginresponse.fromJson(data);
        // Save token to SharedPreferences
        await saveTokenToPrefs(_user!.token!);
        notifyListeners();
        print('success');
      } else {
        final errorData = json.decode(response.body);
        String errorMessage = errorData['message'] ?? 'Failed to login';
        _showErrorSnackbar(context, errorMessage);
        notifyListeners();
        print('fail');
      }
    } on SocketException {
      _showErrorSnackbar(context, 'Network error. Please try again.');
    } catch (e) {
      print('Exception: $e');
      _showErrorSnackbar(context, 'username and password does not match');
    } finally {
      setLoading(false);
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

  Future<void> saveTokenToPrefs(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
  }

  Future<bool> tryAutoLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (!prefs.containsKey('token')) {
      print('No token found');
      return false;
    }
    _token = prefs.getString('token');
    print('Token found: $_token');
    notifyListeners();
    return true;
  }

  void logout() async {
    _token = null;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');
    notifyListeners();
  }
}
