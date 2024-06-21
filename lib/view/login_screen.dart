import 'package:ayurveda/core/colors.dart';
import 'package:ayurveda/providers/auth_provider.dart';
import 'package:ayurveda/services/auth_services.dart';
import 'package:ayurveda/view/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final usernamecontroller = TextEditingController();

  final passwordcontroller = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 217,
                decoration: const BoxDecoration(
                  color: Colors.amber,
                  image: DecorationImage(
                      image: AssetImage('assets/images/loginscreenbanner.png'),
                      fit: BoxFit.cover),
                ),
                child: Center(
                  child: Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/loginsmalllogo.png'),
                      ),
                    ),
                  ),
                ),
              ),

              // login form
              Form(
                key: formKey,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    decoration: const BoxDecoration(
                      color: const Color.fromARGB(255, 248, 248, 248),
                    ),
                    child: Column(
                      children: [
                        Text(
                          'Login Or Register To Book             Your Appointments',
                          style: TextStyle(
                            color: textColor,
                            fontSize: 24,
                            fontWeight: FontWeight.w300,
                            fontFamily: 'Poppins',
                          ),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        //login field
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Email'),
                              const SizedBox(
                                height: 5,
                              ),
                              TextFormField(
                                controller: usernamecontroller,
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    borderSide: BorderSide(
                                        color: Colors.grey.shade300,
                                        width: 1.0),
                                  ),
                                  // labelText: 'Username',
                                  hintText: 'Enter your email',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                        10.0), // Set border radius here
                                  ),
                                  filled: true,
                                  fillColor: Colors.grey[200],
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter email';
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Text('Password'),
                              const SizedBox(
                                height: 5,
                              ),
                              TextFormField(
                                obscureText: true,
                                controller: passwordcontroller,
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    borderSide: BorderSide(
                                        color: Colors.grey.shade300,
                                        width: 1.0),
                                  ),
                                  // enabled: false,
                                  // labelText: 'Username',
                                  hintText: 'Enter password',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                        10.0), // Set border radius here
                                  ),
                                  filled: true,
                                  fillColor: Color.fromARGB(220, 243, 243, 243),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter password';
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                              const SizedBox(
                                height: 80,
                              ),

                              //login button
                              GestureDetector(
                                onTap: () async {
                                  if (formKey.currentState!.validate()) {
                                    // Navigator.of(context)
                                    //     .push(MaterialPageRoute(builder: (ctx) {
                                    //   return HomeScreen();
                                    // }));
                                    await _login(context);
                                  } else {
                                    print('data is empty');
                                  }
                                  print('login');
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 15.0, horizontal: 30.0),
                                  decoration: BoxDecoration(
                                      color: buttonColor,
                                      borderRadius: BorderRadius.circular(8.2)),
                                  child: Center(
                                    child: authProvider.isLoading
                                        ? CircularProgressIndicator()
                                        : Text(
                                            'Login',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 17,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'Poppins'),
                                          ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 120,
                        ),

                        //terms and condition
                        Container(
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 252, 252, 252),
                            ),
                            child: RichText(
                              textAlign: TextAlign.center,
                              text: const TextSpan(
                                  text:
                                      'By creating or logging into an account you are agreeing with our ',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 15.0),
                                  children: [
                                    TextSpan(
                                      text: 'Terms and Conditions',
                                      style: TextStyle(color: Colors.blue),
                                      // recognizer: TapGestureRecognizer()
                                      //   ..onTap = () {
                                      //     // Handle Terms and Conditions tap
                                      //     print('Terms and Conditions tapped');
                                      //   },
                                    ),
                                    TextSpan(
                                      text: ' and ',
                                      style: TextStyle(color: Colors.black),
                                    ),
                                    TextSpan(
                                      text: 'Privacy Policy',
                                      style: TextStyle(color: Colors.blue),
                                      // recognizer: TapGestureRecognizer()
                                      //   ..onTap = () {
                                      //     // Handle Privacy Policy tap
                                      //     print('Privacy Policy tapped');
                                      //   },
                                    ),
                                    TextSpan(
                                      text: '.',
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ]),
                            )),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _login(BuildContext context) async {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    print(authProvider);

    final username = usernamecontroller.text.trim();
    final password = passwordcontroller.text.trim();
    print(username);
    print(password);

    await authProvider.login(username, password , context);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (!prefs.containsKey('token')) {
      print('No token found');
    } else {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx) {
        return HomeScreen();
      }));
    }
  }

  void _showErrorSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      duration: Duration(seconds: 3),
    ));
  }
}
