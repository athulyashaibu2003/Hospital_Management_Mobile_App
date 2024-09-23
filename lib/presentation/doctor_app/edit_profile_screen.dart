import 'package:flutter/material.dart';
import 'package:hms_project/presentation/constants/colorconstants.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  String? _selectedGender = 'Male';
  String? _selectedNationality; // Store the selected nationality
  List<String> _nationalities = [
    'USA',
    'Canada',
    'India',
    'Germany',
    'Australia',
    'Other'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Text("Basic Details"),
              SizedBox(
                height: 10,
              ),
              CircleAvatar(
                radius: 50,
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                //    mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                            labelText: "First Name",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15))),
                      ),
                    ),
                  ),
                  //Spacer(),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                            labelText: "Last Name",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15))),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                      labelText: "Email",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15))),
                ),
              ),
              Row(
                //    mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                            labelText: "Contact Number",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15))),
                      ),
                    ),
                  ),
                  //Spacer(),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                            labelText: "DOB",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15))),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: ColorConstants.mainwhite,
                      borderRadius: BorderRadius.circular(15)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 15,
                        //  width: 10,
                      ),
                      Text(
                        'Select Gender',
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          // Male Radio Button
                          Radio<String>(
                            value: 'Male',
                            groupValue: _selectedGender,
                            onChanged: (value) {
                              setState(() {
                                _selectedGender = value;
                              });
                            },
                          ),
                          Text('Male'),

                          SizedBox(width: 20),

                          // Female Radio Button
                          Radio<String>(
                            value: 'Female',
                            groupValue: _selectedGender,
                            onChanged: (value) {
                              setState(() {
                                _selectedGender = value;
                              });
                            },
                          ),
                          Text('Female'),

                          SizedBox(width: 20),

                          // Other Radio Button
                          Radio<String>(
                            value: 'Other',
                            groupValue: _selectedGender,
                            onChanged: (value) {
                              setState(() {
                                _selectedGender = value;
                              });
                            },
                          ),
                          Text('Other'),
                        ],
                      ),

                      // Display the selected gender
                      // Text(
                      //   'Selected Gender: $_selectedGender',
                      //   style: TextStyle(fontSize: 18),
                      // ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: ColorConstants.mainwhite,
                      borderRadius: BorderRadius.circular(15)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Select Nationality',
                      ),
                      SizedBox(height: 10),

                      // DropdownButton for nationality selection
                      DropdownButton<String>(
                        hint: Text('Select your nationality'),
                        value: _selectedNationality,
                        isExpanded: true,
                        icon: Icon(Icons.arrow_drop_down),
                        iconSize: 24,
                        elevation: 16,
                        style: TextStyle(color: Colors.black, fontSize: 16),
                        underline: Container(
                          height: 2,
                          color: Colors.blueAccent,
                        ),
                        onChanged: (String? newValue) {
                          setState(() {
                            _selectedNationality =
                                newValue; // Update the selected nationality
                          });
                        },
                        items: _nationalities
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                  decoration: InputDecoration(
                      labelText: "Contact Number(work)",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15))),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              // Padding(
              //   padding: const EdgeInsets.all(10),
              //   child: TextFormField(
              //     decoration: InputDecoration(
              //         labelText: "Contact Number(Personal)",
              //         border: OutlineInputBorder(
              //             borderRadius: BorderRadius.circular(15))),
              //   ),
              // ),
              // SizedBox(
              //   height: 10,
              // ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                  decoration: InputDecoration(
                      labelText: "Contact Number(Emergency)",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15))),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                  decoration: InputDecoration(
                      labelText: "Email Address(Work)",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15))),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                  decoration: InputDecoration(
                      labelText: "Email Address(Work)",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15))),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text("Professional Information"),
              SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
