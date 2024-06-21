import 'package:ayurveda/core/colors.dart';
import 'package:ayurveda/providers/patient_list_provider.dart';
import 'package:ayurveda/view/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  // final List<Item>? items;
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late TextEditingController searchvaluecontroller = TextEditingController();
  Future<void>? searchFuture;
  String searchvalue = '';

  @override
  Widget build(BuildContext context) {
    final patientListpro =
        Provider.of<PatientListProvider>(context, listen: false);

    // Function to handle refresh
    Future<void> _handleRefresh() async {
      await Future.delayed(Duration(seconds: 2));

      await patientListpro.fetchPatients(context);
    }

    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: _handleRefresh,
          child: FutureBuilder(
              future: patientListpro.fetchPatients(context),
              builder: (BuildContext, Snapshot) {
                if (Snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (Snapshot.hasError) {
                  return Center(child: Text('Error: ${Snapshot.error}'));
                } else {
                  return Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Container(
                          width: double.infinity,
                          height: 250,
                          // decoration: BoxDecoration(
                          //     color: Color.fromARGB(255, 201, 86, 86)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                // Row for back arrow and notification
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons.arrow_back),
                                    ),
                                    Stack(
                                      children: [
                                        IconButton(
                                          onPressed: () {},
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
                                SizedBox(
                                  height: 10,
                                ),
                                // Search bar Row
                                Row(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        height:
                                            50, // Same height as the button container
                                        width: 250,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          border: Border.all(
                                            color: Colors.grey,
                                            width: 1.0,
                                          ),
                                        ),
                                        child: TextField(
                                          controller: searchvaluecontroller,
                                          textAlign: TextAlign.center,
                                          decoration: InputDecoration(
                                            border: InputBorder.none,
                                            hintText: 'Search for treatment',
                                            hintStyle: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 218, 217, 217),
                                            ),
                                            prefixIcon: Icon(
                                              Icons.search,
                                              color: Color.fromARGB(
                                                  255, 134, 132, 132),
                                            ),
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                                    vertical: 10,
                                                    horizontal: 100),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    Container(
                                      height:
                                          50, // Same height as the text field container
                                      decoration: BoxDecoration(
                                        color:
                                            buttonColor, // Example button color
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: TextButton(
                                        onPressed: () {
                                          print('1212');
                                          searchvalue =
                                              searchvaluecontroller.text;
                                          print(searchvalue);
                                          patientListpro
                                              .updateSearchQuery(searchvalue);
                                          // Add your search functionality here
                                        },
                                        child: Text(
                                          'Search',
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                //sort section with date
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Sort by :',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Container(
                                      width: 170,
                                      height: 40,
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 20),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(33),
                                        border: Border.all(
                                          color: Colors.grey,
                                          width: 1.0,
                                        ),
                                      ),
                                      child: DropdownButtonHideUnderline(
                                        child: DropdownButton(
                                          isExpanded: true,
                                          icon: Icon(
                                            Icons.arrow_drop_down,
                                            color: Colors.green,
                                          ),
                                          value: null,
                                          hint: Text('Date'),
                                          onChanged: (value) {
                                            // if (value == 'asc') {
                                            //   _sortItemsByDate(true);
                                            // } else if (value == 'desc') {
                                            //   _sortItemsByDate(false);
                                            // }
                                          },
                                          items: [
                                            DropdownMenuItem(
                                              value: 'asc',
                                              child: Text('Ascending'),
                                            ),
                                            DropdownMenuItem(
                                              value: 'desc',
                                              child: Text('Descending'),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),

                        //list of data from apis

                        Expanded(
                          child: patientListpro.patients.isEmpty
                              ? Center(
                                  child: Text('patients empty'),
                                )
                              : ListView.builder(
                                  itemCount: patientListpro.patients.length,
                                  itemBuilder: (ctx, int index) {
                                    final patient =
                                        patientListpro.patients[index];

                                    // print(
                                    //     "lose ${patientListpro.patients.length}");
                                    return Padding(
                                      padding: const EdgeInsets.only(top: 30),
                                      child: Container(
                                        height: 200,
                                        decoration: BoxDecoration(
                                          color: Color.fromARGB(
                                              255, 224, 223, 223),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Row(
                                          children: [
                                            Container(
                                              margin:
                                                  EdgeInsets.only(bottom: 134),
                                              padding:
                                                  EdgeInsets.only(left: 10),
                                              child: Text(
                                                '${index + 1}.',
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 17, top: 20),
                                                  child: Container(
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          '${patient.name}',
                                                          style: TextStyle(
                                                              fontSize: 18,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                        SizedBox(
                                                          height: 5,
                                                        ),
                                                        Container(
                                                          width: 300,
                                                          child: Text(
                                                            '${patient.address}',
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            style: TextStyle(
                                                                fontSize: 16,
                                                                color: Colors
                                                                    .green),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: 20,
                                                        ),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceAround,
                                                          children: [
                                                            //date row
                                                            Row(
                                                              children: [
                                                                patient.dateNdTime ==
                                                                        null
                                                                    ? Text(
                                                                        'No Date')
                                                                    : Icon(
                                                                        Icons
                                                                            .date_range,
                                                                        size:
                                                                            16,
                                                                        color: Colors
                                                                            .red,
                                                                      ),
                                                                SizedBox(
                                                                  width: 2,
                                                                ),
                                                                Text(
                                                                  '${patient.dateNdTime}',
                                                                  style:
                                                                      TextStyle(
                                                                    fontSize:
                                                                        16,
                                                                  ),
                                                                )
                                                              ],
                                                            ),
                                                            SizedBox(
                                                              width: 20,
                                                            ),
                                                            //username row
                                                            Row(
                                                              children: [
                                                                Icon(
                                                                  Icons.people,
                                                                  size: 16,
                                                                  color: Colors
                                                                      .red,
                                                                ),
                                                                SizedBox(
                                                                  width: 2,
                                                                ),
                                                                Text(
                                                                  '${patient.user}',
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          16),
                                                                )
                                                              ],
                                                            )
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                        ),
                        GestureDetector(
                          onTap: () async {
                            print('register');
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (ctx) {
                              return RegisterScreen();
                            }));
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 15.0, horizontal: 30.0),
                            decoration: BoxDecoration(
                                color: buttonColor,
                                borderRadius: BorderRadius.circular(8.2)),
                            child: Center(
                              child: Text(
                                'Register Now',
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
                  );
                }
              }),
        ),
      ),
    );
  }
}
