import 'package:flutter/material.dart';
import 'package:hms_project/presentation/constants/colorconstants.dart';
import 'package:intl/intl.dart';

class DischargeScreen extends StatefulWidget {
  @override
  _DischargeScreenState createState() => _DischargeScreenState();
}

class _DischargeScreenState extends State<DischargeScreen> {
  final _formKey = GlobalKey<FormState>();

  // Controllers for text fields
  final _patientIdController = TextEditingController();
  final _patientNameController = TextEditingController();
  final _currentStatusController = TextEditingController();
  final _diagnosisNoteController = TextEditingController();
  final _instructionsController = TextEditingController();
  final _followUpController = TextEditingController();

  String? _selectedDischargeDate;
  TimeOfDay? _selectedDischargeTime;

  // Helper methods for date and time pickers
  Future<void> _selectDischargeDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2020),
        lastDate: DateTime(2025));
    if (picked != null && picked != _selectedDischargeDate)
      setState(() {
        _selectedDischargeDate = DateFormat('dd-MM-yyyy').format(picked);
      });
  }

  Future<void> _selectDischargeTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null && picked != _selectedDischargeTime)
      setState(() {
        _selectedDischargeTime = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[100],
      // backgroundColor: ColorConstants.lightlightgreen,
      appBar: AppBar(
        backgroundColor: Colors.teal[100],
        //backgroundColor: ColorConstants.lightlightgreen,
        title: Text('Discharge Patient'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              // Patient Information Section
              Text(
                'Patient Information',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),

              // Patient ID
              TextFormField(
                controller: _patientIdController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: 'Patient ID'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter patient ID';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),

              // Patient Name
              TextFormField(
                controller: _patientNameController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: 'Patient Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter patient name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),

              // Current Status
              TextFormField(
                controller: _currentStatusController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: 'Current Status'),
                maxLines: 1,
              ),
              SizedBox(height: 10),

              // Diagnosis Note
              TextFormField(
                controller: _diagnosisNoteController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: 'Diagnosis Note'),
                maxLines: 2,
              ),
              SizedBox(height: 10),

              // Discharge Date and Time
              // Row(
              //   children: <Widget>[
              //     Expanded(
              //       child: ListTile(

              //         leading: Icon(Icons.calendar_today),
              //         title: Text(
              //           _selectedDischargeDate == null
              //               ? 'Select Discharge Date'
              //               : 'Date: ${_selectedDischargeDate}',
              //         ),
              //         onTap: () => _selectDischargeDate(context),
              //       ),
              //     ),
              //     Expanded(
              //       child: ListTile(
              //         title: Text(_selectedDischargeTime == null
              //             ? 'Select Time'
              //             : 'Time: ${_selectedDischargeTime!.format(context)}'),
              //         leading: Icon(Icons.access_time),
              //         onTap: () => _selectDischargeTime(context),
              //       ),
              //     ),
              //   ],
              // ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () => _selectDischargeDate(context),
                      child: Row(
                        children: [
                          Icon(Icons.calendar_today),
                          Text(
                            _selectedDischargeDate == null
                                ? 'Select Discharge Date'
                                : 'Date: ${_selectedDischargeDate}',
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                    InkWell(
                      onTap: () => _selectDischargeTime(context),
                      child: Row(
                        children: [
                          Icon(Icons.access_time),
                          Text(_selectedDischargeTime == null
                              ? 'Select Time'
                              : 'Time: ${_selectedDischargeTime!.format(context)}'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),

              // Medical Instructions
              TextFormField(
                controller: _instructionsController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Medical Instructions'),
                maxLines: 4,
              ),
              SizedBox(height: 10),

              // Follow-Up Appointment
              TextFormField(
                controller: _followUpController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: 'Follow-Up Date'),
              ),
              SizedBox(height: 20),

              // Buttons
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Save logic
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text('Discharge details saved successfully!'),
                    ));
                  }
                },
                child: Text('Save Discharge Details'),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  // Generate discharge summary logic
                },
                child: Text('Generate Discharge Summary'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
