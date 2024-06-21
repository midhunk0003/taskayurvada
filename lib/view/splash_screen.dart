import 'package:ayurveda/providers/auth_provider.dart';
import 'package:ayurveda/view/home_screen.dart';
import 'package:ayurveda/view/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    super.initState();
    _checkLoginStatus();
  }

  _navigateToLogin() async {
    await Future.delayed(Duration(seconds: 3), () {});
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx) {
      return LoginScreen();
    }));
  }

  _checkLoginStatus() async {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    bool isLoggedIn = await authProvider.tryAutoLogin();
    if (isLoggedIn) {
      await Future.delayed(Duration(seconds: 3), () {});
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx) {
        return HomeScreen();
      }));
    } else {
      await Future.delayed(Duration(seconds: 3), () {});
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx) {
        return LoginScreen();
      }));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.green,
          image: DecorationImage(
              image: AssetImage('assets/images/splashbagro.png'),
              fit: BoxFit.cover),
        ),
        //splash screen logoin center
        child: Center(
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/logosplashau.png'),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
