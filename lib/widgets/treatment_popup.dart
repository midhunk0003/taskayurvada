import 'package:ayurveda/core/colors.dart';
import 'package:ayurveda/models/tretmentlistmodel/treatment.dart';
import 'package:ayurveda/providers/patient_count_provider.dart';
import 'package:ayurveda/providers/treatmentlist_provider.dart';
import 'package:ayurveda/view/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

List<Map<String, dynamic>> treatment = [];

String? treatmentnames;
int? male = 0;
int? female = 0;

TreatmentPopup(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      final formKey = GlobalKey<FormState>();
      final counter = Provider.of<PatientCountProvider>(context);
      final treatlist =
          Provider.of<TreatmentListProvider>(context, listen: false);
      return Form(
        key: formKey,
        child: Container(
          width: 20,
          height: 50,
          color: Color.fromARGB(38, 41, 37, 25),
          child: AlertDialog(
            // shape: RoundedRectangleBorder(),
            content: Container(
              width: 300.0,
              height: 370.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Text('Choose Treatment'),
                  const SizedBox(
                    height: 5,
                  ),
                  FutureBuilder(
                    future: Provider.of<TreatmentListProvider>(context,
                            listen: false)
                        .fetchdatafromtreatmentlist(context),
                    builder: (context, snapshot) {
                      return DropdownButtonFormField<String>(
                        isExpanded: true,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(
                              color: Colors.grey.shade300,
                              width: 1.0,
                            ),
                          ),
                          // labelText: 'Email',
                          hintText: 'Select the treatment',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                                10.0), // Set border radius here
                          ),
                          filled: true,
                          fillColor: Colors.grey[200],
                        ),
                        items: treatlist.treatmentlistapi
                            .map((Treatment treatmentlistapi) {
                          return DropdownMenuItem<String>(
                            value: treatmentlistapi.name,
                            child: Container(
                              constraints: BoxConstraints(maxWidth: 200),
                              child: Text(
                                treatmentlistapi.name!,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          treatmentnames = newValue;
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please select an branch';
                          } else {
                            return null;
                          }
                        },
                      );
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text('Add Patients'),
                  const SizedBox(
                    height: 5,
                  ),
                  //male container
                  Container(
                    height: 50,
                    decoration: BoxDecoration(
                        // color: Colors.amber,
                        ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 20),
                          height: 50,
                          width: 110,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black12),
                              borderRadius: BorderRadius.circular(10)),
                          child: Align(
                            child: Text('Male'),
                            alignment: Alignment.centerLeft,
                          ),
                        ),
                        Container(
                            height: 50,
                            width: 130,
                            decoration: BoxDecoration(
                                // color: Colors.green,
                                borderRadius: BorderRadius.circular(10)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                InkWell(
                                  onTap: () {
                                    print('minnus');
                                    // addcount = addcount;
                                    counter.maledecriment();
                                    male = counter.malecount;
                                    print(male);
                                  },
                                  child: CircleAvatar(
                                    radius: 20,
                                    backgroundColor: buttonColor,
                                    child: Center(
                                      child: Container(
                                        margin: EdgeInsets.only(bottom: 35),
                                        child: Icon(
                                          Icons.minimize,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 40,
                                  height: 39,
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.black12),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Center(child: Text('${male}')),
                                ),
                                InkWell(
                                  onTap: () {
                                    print('plus');
                                    counter.maleincriment();
                                    male = counter.malecount;
                                    print(male);
                                  },
                                  child: CircleAvatar(
                                    radius: 20,
                                    backgroundColor: buttonColor,
                                    child: Icon(
                                      Icons.add,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ))
                      ],
                    ),
                  ),

                  //femail container
                  const SizedBox(
                    height: 20,
                  ),

                  Container(
                    height: 50,
                    decoration: BoxDecoration(
                        // color: Colors.amber,
                        ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 20),
                          height: 50,
                          width: 110,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black12),
                              borderRadius: BorderRadius.circular(10)),
                          child: Align(
                            child: Text('Female'),
                            alignment: Alignment.centerLeft,
                          ),
                        ),
                        Container(
                            height: 50,
                            width: 130,
                            decoration: BoxDecoration(
                                // color: Colors.green,
                                borderRadius: BorderRadius.circular(10)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                InkWell(
                                  onTap: () {
                                    print('minues');
                                    counter.femaledecriment();
                                    female = counter.femalecount;
                                    print(female);
                                  },
                                  child: CircleAvatar(
                                    radius: 20,
                                    backgroundColor: buttonColor,
                                    child: Center(
                                      child: Container(
                                        margin: EdgeInsets.only(bottom: 35),
                                        child: Icon(
                                          Icons.minimize,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 40,
                                  height: 39,
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.black12),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Center(
                                    child: Text('${female}'),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    print('plus');
                                    counter.femaleincriment();
                                    female = counter.femalecount;
                                    print(female);
                                  },
                                  child: CircleAvatar(
                                    radius: 20,
                                    backgroundColor: buttonColor,
                                    child: Icon(
                                      Icons.add,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ))
                      ],
                    ),
                  ),

                  ///save button
                  const SizedBox(
                    height: 15,
                  ),
                  //login button
                  GestureDetector(
                    onTap: () async {
                      if (formKey.currentState!.validate()) {
                        treatlist.saveData(treatmentnames, male, female);
                        Navigator.pop(context);
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
                        child: Text(
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
          ),
        ),
      );
    },
  );
}
