import 'package:ayurveda/providers/auth_provider.dart';
import 'package:ayurveda/providers/branch_list_provider.dart';
import 'package:ayurveda/providers/patient_count_provider.dart';
import 'package:ayurveda/providers/patient_list_provider.dart';
import 'package:ayurveda/providers/patient_registerprovider.dart';
import 'package:ayurveda/providers/treatmentlist_provider.dart';
import 'package:ayurveda/view/login_screen.dart';
import 'package:ayurveda/view/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
  // SharedPreferences prefs = await SharedPreferences.getInstance();
  // prefs.remove('token');
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => PatientListProvider()),
        ChangeNotifierProvider(create: (_) => PatientCountProvider()),
        ChangeNotifierProvider(create: (_) => TreatmentListProvider()),
        ChangeNotifierProvider(create: (_) => BranchListProvider()),
        ChangeNotifierProvider(create: (_) => PatientProvider()),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'aurveda',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: SplashScreen()),
    );
  }
}
