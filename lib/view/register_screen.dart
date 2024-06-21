import 'package:ayurveda/core/colors.dart';
import 'package:ayurveda/models/branchlistmodel/branch.dart';
import 'package:ayurveda/models/branchlistmodel/branchlistmodel.dart';
import 'package:ayurveda/models/patientmodel_insert/patientmodel_insert.dart';
import 'package:ayurveda/providers/branch_list_provider.dart';
import 'package:ayurveda/providers/patient_registerprovider.dart';
import 'package:ayurveda/providers/treatmentlist_provider.dart';
import 'package:ayurveda/view/home_screen.dart';
import 'package:ayurveda/widgets/treatment_popup.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({
    Key? key,
  }) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late TextEditingController namecontroller = TextEditingController();
  late TextEditingController whatsupnumbercontroller = TextEditingController();
  late TextEditingController addresscontroller = TextEditingController();
  late TextEditingController totalamountcontroller = TextEditingController();
  late TextEditingController discountcontroller = TextEditingController();
  late TextEditingController advancecontroller = TextEditingController();
  late TextEditingController balanceamountcontroller = TextEditingController();
  late TextEditingController _date = TextEditingController();
  String? selectedValuelocation;
  String? selectedValuebranch;
  List<Map<String, dynamic>> treatmentlistss = [];
  String? payment;
  String? dateandtime;

  //current date and time
  DateTime dateTime = DateTime.now();
  String formatDateTime(DateTime date, int hour, int minute) {
    String formattedDate =
        "${date.month.toString().padLeft(2, '0')}/${date.day.toString().padLeft(2, '0')}/${date.year}";
    String formattedHour =
        (hour % 12 == 0 ? 12 : hour % 12).toString().padLeft(2, '0');
    String formattedMinute = minute.toString().padLeft(2, '0');
    String period = hour >= 12 ? "PM" : "AM";
    return "$formattedDate-$formattedHour:$formattedMinute $period";
  }

  String? selectedHour;
  String? selectedMinute;
  // # Convert to integers

// Convert to integers
  late int selectedHourInt = selectedHour != null && selectedHour!.isNotEmpty
      ? int.parse(selectedHour!)
      : 0;
  late int selectedMinuteInt =
      selectedMinute != null && selectedMinute!.isNotEmpty
          ? int.parse(selectedMinute!)
          : 0;

  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final treatmentlist = Provider.of<TreatmentListProvider>(context);
    final branchProvider =
        Provider.of<BranchListProvider>(context, listen: false);
    treatmentlistss = treatmentlist.treatment;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(28.0),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          print('111');
                          Navigator.of(context)
                              .pop(MaterialPageRoute(builder: (ctx) {
                            return HomeScreen();
                          }));
                        },
                        icon: Icon(Icons.arrow_back),
                      ),
                      Stack(
                        children: [
                          IconButton(
                            onPressed: () {
                              print('111');
                              Navigator.of(context)
                                  .pop(MaterialPageRoute(builder: (ctx) {
                                return HomeScreen();
                              }));
                            },
                            icon: Icon(
                              Icons.notifications_outlined,
                              size: 30,
                            ),
                          ),
                          Positioned(
                            top: 16,
                            right: 15,
                            child: CircleAvatar(
                              backgroundColor: Colors.red,
                              radius: 4,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),

                Text(
                  'Register',
                  style: TextStyle(
                    color: textColor,
                    fontSize: 24,
                    fontWeight: FontWeight.w300,
                    fontFamily: 'Poppins',
                  ),
                ),

                //form field

                Expanded(
                  child: Container(
                    child: ListView(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Text('Name'),
                        const SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          controller: namecontroller,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide(
                                  color: Colors.grey.shade300, width: 1.0),
                            ),
                            // labelText: 'Username',
                            hintText: 'Enter your Name',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                  10.0), // Set border radius here
                            ),
                            filled: true,
                            fillColor: Colors.grey[200],
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter name';
                            } else {
                              return null;
                            }
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text('Whatsapp Number'),
                        const SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          controller: whatsupnumbercontroller,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide(
                                  color: Colors.grey.shade300, width: 1.0),
                            ),
                            // labelText: 'Username',
                            hintText: 'Enter your Whatsapp number',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                  10.0), // Set border radius here
                            ),
                            filled: true,
                            fillColor: Colors.grey[200],
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter Whatsapp number';
                            } else {
                              return null;
                            }
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text('Address'),
                        const SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          controller: addresscontroller,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide(
                                  color: Colors.grey.shade300, width: 1.0),
                            ),
                            // labelText: 'Username',
                            hintText: 'Enter your full address',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                  10.0), // Set border radius here
                            ),
                            filled: true,
                            fillColor: Colors.grey[200],
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter address';
                            } else {
                              return null;
                            }
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),

                        // location drop down
                        Text('Location'),
                        const SizedBox(
                          height: 5,
                        ),
                        DropdownButtonFormField<String>(
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide(
                                color: Colors.grey.shade300,
                                width: 1.0,
                              ),
                            ),
                            // labelText: 'Email',
                            hintText: 'Choose your location',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                  10.0), // Set border radius here
                            ),
                            filled: true,
                            fillColor: Colors.grey[200],
                          ),
                          items: <String>['KOZHIKODE', 'KOCHI', 'PALAKKAD']
                              .map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            selectedValuelocation = newValue;
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please select an option';
                            } else {
                              return null;
                            }
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text('Branch'),
                        const SizedBox(
                          height: 5,
                        ),
                        FutureBuilder(
                          future: Provider.of<BranchListProvider>(context,
                                  listen: false)
                              .fetchBranches(context),
                          builder: (context, snapshot) {
                            return DropdownButtonFormField<String>(
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide(
                                    color: Colors.grey.shade300,
                                    width: 1.0,
                                  ),
                                ),
                                // labelText: 'Email',
                                hintText: 'Select the branch',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                      10.0), // Set border radius here
                                ),
                                filled: true,
                                fillColor: Colors.grey[200],
                              ),
                              items:
                                  branchProvider.branches.map((Branch branch) {
                                return DropdownMenuItem<String>(
                                  value: branch.name,
                                  child: Text(branch.name!),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                selectedValuebranch = newValue;
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
                          height: 20,
                        ),

                        /// add treatment
                        Text('Treatments'),
                        const SizedBox(
                          height: 5,
                        ),
                        treatmentlist.treatment.isEmpty
                            ? Text(
                                'No treatments available') // Placeholder or message when list is empty
                            : ListView.builder(
                                shrinkWrap: true,
                                itemCount: treatmentlist.treatment.length,
                                itemBuilder: (context, index) {
                                  // Assuming treatmentlist.treatment is a list of treatment items
                                  final treatment =
                                      treatmentlist.treatment[index];
                                  return Container(
                                    margin: EdgeInsets.only(top: 5, bottom: 5),
                                    width: 300, // Adjust the width as needed
                                    decoration: BoxDecoration(
                                      color: Color.fromARGB(94, 160, 161,
                                          161), // Background color
                                      borderRadius: BorderRadius.circular(
                                          10), // Rounded corners
                                    ),
                                    child: ListTile(
                                      leading: Text('${treatment['id']}'),
                                      title: Text(
                                        '${treatment['treatmentname']}',
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      subtitle: Row(
                                        children: [
                                          Text(
                                            'Male',
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.green),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Container(
                                            width: 40,
                                            height: 25,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                border: Border.all(
                                                    color: Color.fromARGB(
                                                        83, 25, 216, 89))),
                                            child: Center(
                                              child: Text(
                                                  '${treatment['malecount']}'),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 20,
                                          ),
                                          Text(
                                            'Female',
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.green),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Container(
                                            width: 40,
                                            height: 25,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                border: Border.all(
                                                    color: Color.fromARGB(
                                                        83, 25, 216, 89))),
                                            child: Center(
                                              child: Text(
                                                  '${treatment['femalecount']}'),
                                            ),
                                          ),
                                        ],
                                      ),
                                      trailing: Column(
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              final id = treatment['id'];
                                              treatmentlist.deleteData(id);
                                            },
                                            child: CircleAvatar(
                                              radius: 13,
                                              backgroundColor: Colors.red,
                                              child: Icon(Icons.close),
                                            ),
                                          ),
                                          Icon(Icons.edit),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                        GestureDetector(
                          onTap: () async {
                            print('add treatment');
                            TreatmentPopup(context);
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 15.0, horizontal: 30.0),
                            decoration: BoxDecoration(
                                color: Color.fromARGB(106, 60, 158, 63),
                                borderRadius: BorderRadius.circular(8.2)),
                            child: Center(
                              child: Text(
                                '+ Add Treatments',
                                style: TextStyle(
                                  color: const Color.fromARGB(255, 32, 30, 30),
                                  fontSize: 17,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text('Total Amount'),
                        const SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          controller: totalamountcontroller,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide(
                                  color: Colors.grey.shade300, width: 1.0),
                            ),
                            // labelText: 'Username',
                            hintText: 'Enter your Total Amount',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                  10.0), // Set border radius here
                            ),
                            filled: true,
                            fillColor: Colors.grey[200],
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter Total amount';
                            } else {
                              return null;
                            }
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text('Discount Amount'),
                        const SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          controller: discountcontroller,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide(
                                  color: Colors.grey.shade300, width: 1.0),
                            ),
                            // labelText: 'Username',
                            hintText: 'Enter your Discount Amount',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                  10.0), // Set border radius here
                            ),
                            filled: true,
                            fillColor: Colors.grey[200],
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter Discount Amount';
                            } else {
                              return null;
                            }
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),

                        /// Payment Option
                        Text('Payment Option'),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Transform.scale(
                                  scale:
                                      1.5, // Adjust this value to change the size of the radio button
                                  child: Radio(
                                    fillColor:
                                        MaterialStateProperty.all(Colors.green),
                                    value: 'Cash',
                                    groupValue: payment,
                                    onChanged: (value) {
                                      setState(() {
                                        payment = value;
                                      });
                                    },
                                  ),
                                ),
                                Text(
                                  'Cash',
                                  style: TextStyle(fontSize: 22),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Transform.scale(
                                  scale: 1.5,
                                  child: Radio(
                                    fillColor:
                                        MaterialStateProperty.all(Colors.green),
                                    value: 'Card',
                                    groupValue: payment,
                                    onChanged: (value) {
                                      setState(() {
                                        payment = value;
                                      });
                                    },
                                  ),
                                ),
                                Text(
                                  'Card',
                                  style: TextStyle(fontSize: 22),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Transform.scale(
                                  scale: 1.5,
                                  child: Radio(
                                    fillColor:
                                        MaterialStateProperty.all(Colors.green),
                                    value: 'Upi',
                                    groupValue: payment,
                                    onChanged: (value) {
                                      setState(() {
                                        payment = value;
                                      });
                                    },
                                  ),
                                ),
                                Text(
                                  'Upi',
                                  style: TextStyle(fontSize: 22),
                                )
                              ],
                            ),
                          ],
                        ),

                        const SizedBox(
                          height: 20,
                        ),
                        Text('Advance Amount'),
                        const SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          controller: advancecontroller,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide(
                                  color: Colors.grey.shade300, width: 1.0),
                            ),
                            // labelText: 'Username',
                            hintText: 'Enter your Advance Amount',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                  10.0), // Set border radius here
                            ),
                            filled: true,
                            fillColor: Colors.grey[200],
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter Advance Amount';
                            } else {
                              return null;
                            }
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text('Balance Amount'),
                        const SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          controller: balanceamountcontroller,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide(
                                  color: Colors.grey.shade300, width: 1.0),
                            ),
                            // labelText: 'Username',
                            hintText: 'Enter your Balance Amount',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                  10.0), // Set border radius here
                            ),
                            filled: true,
                            fillColor: Colors.grey[200],
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter Balance Amount';
                            } else {
                              return null;
                            }
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text('Treatment Date'),
                        const SizedBox(
                          height: 5,
                        ),
                        InkWell(
                          onTap: () async {
                            final DateTime? selectedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime.now(),
                              lastDate:
                                  DateTime.now().add(Duration(days: 30 * 365)),
                            );
                            if (selectedDate == null) {
                              return;
                            } else {
                              // print(selectedDate);
                            }

                            dateTime = selectedDate;
                            _date.text =
                                "${dateTime.year}/${dateTime.month}/${dateTime.day}";
                            print('121212121 ${dateTime}');
                          },
                          child: TextFormField(
                            controller: _date,
                            enabled: false,
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide(
                                    color: Colors.grey.shade300, width: 1.0),
                              ),
                              // labelText: 'Username',
                              hintText: 'Select Treatment Date',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                    10.0), // Set border radius here
                              ),
                              filled: true,
                              fillColor: Colors.grey[200],
                              suffixIcon: Icon(Icons.calendar_today),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter Treatment Date';
                              } else {
                                return null;
                              }
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text('Email'),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.4,
                              child: DropdownButtonFormField<String>(
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    borderSide: BorderSide(
                                        color: Colors.grey.shade300,
                                        width: 1.0),
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  filled: true,
                                  fillColor: Colors.grey[200],
                                ),
                                hint: Text('Hour'),
                                value: selectedHour,
                                items: List.generate(
                                        24,
                                        (index) =>
                                            index.toString().padLeft(2, '0'))
                                    .map((hour) => DropdownMenuItem(
                                          value: hour,
                                          child: Text(hour),
                                        ))
                                    .toList(),
                                onChanged: (value) {
                                  setState(() {
                                    selectedHour = value;
                                  });
                                },
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please select an hour';
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.4,
                              child: DropdownButtonFormField<String>(
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    borderSide: BorderSide(
                                        color: Colors.grey.shade300,
                                        width: 1.0),
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  filled: true,
                                  fillColor: Colors.grey[200],
                                ),
                                hint: Text('Minute'),
                                value: selectedMinute,
                                items: List.generate(
                                        60,
                                        (index) =>
                                            index.toString().padLeft(2, '0'))
                                    .map((hour) => DropdownMenuItem(
                                          value: hour,
                                          child: Text(hour),
                                        ))
                                    .toList(),
                                onChanged: (value) {
                                  selectedMinute = value;
                                },
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please select an minute';
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ),

                ///
                GestureDetector(
                  onTap: () async {
                    String formattedDateTime = formatDateTime(
                        dateTime, selectedHourInt, selectedMinuteInt);
                    dateandtime = formattedDateTime;
                    // print(formattedDateTime);

                    if (formKey.currentState!.validate()) {
                      await insertpatientlist();
                    } else {
                      print('data is empty');
                    }
                    print('save');
                  },
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 15.0, horizontal: 30.0),
                    decoration: BoxDecoration(
                        color: buttonColor,
                        borderRadius: BorderRadius.circular(8.2)),
                    child: Center(
                      child: Text(
                        'Save',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Poppins'),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> insertpatientlist() async {
    final String? name = namecontroller.text.trim();
    final String? whatsupnumber = whatsupnumbercontroller.text.trim();
    final String? address = addresscontroller.text.trim();
    final String? location = selectedValuelocation;
    final String? branch = selectedValuebranch;
    final List<Map<String, dynamic>>? treatmentlist = treatmentlistss;
    final String? totalamount = totalamountcontroller.text;
    final String? discount = discountcontroller.text;
    final String? paymentoption = payment;
    final String? advance = advancecontroller.text.trim();
    final String? balance = balanceamountcontroller.text.trim();
    final String? dateandtimess = dateandtime;

    // Initializing empty lists to store the values
    List<String> male = [];
    List<String> female = [];
    List<String> treatmentsname = [];

    // Iterating over the list of maps to populate the lists
    for (var treatment in treatmentlist!) {
      male.add(treatment["malecount"].toString());
      female.add(treatment["femalecount"].toString());
      treatmentsname.add(treatment["treatmentname"].toString());
      // treatments.add(treatment["id"].toString());
    }

    // Converting the lists to comma-separated strings
    String maleString = male.join(',');
    String femaleString = female.join(',');
    String treatmentsString = treatmentsname.join(',');

    print(name);
    print(whatsupnumber);
    print(address);
    print(location);
    print(branch);
    print(treatmentlist);
    print(totalamount);
    print(discount);
    print(paymentoption);
    print(advance);
    print(balance);
    print(dateandtimess);
    print('male ${maleString}');
    print("female ${femaleString}");
    print('treatment name ${treatmentsString}');

    if (treatmentsString.isEmpty) {
      print('empty');
      String message = 'add treatment details';
      _showErrorSnackbar(context, message);
    }
    if (paymentoption == null) {
      String message = 'select payment option';
      _showErrorSnackbar(context, message);
    } else {
      final patient = PatientmodelInsert(
        name: name,
        excecutive: name,
        payment: payment,
        phone: whatsupnumber,
        address: address,
        totalAmount: int.parse(totalamount!),
        discountAmount: int.parse(discount!),
        advanceAmount: int.parse(advance!),
        balanceAmount: int.parse(balance!),
        dateNdTime: dateandtimess,
        male: [maleString],
        female: [femaleString],
        branch: branch,
        treatments: [treatmentsString],
      );
      print(patient);
      final insert = Provider.of<PatientProvider>(context, listen: false);
      await insert.insertPatient(context,patient);
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
}
