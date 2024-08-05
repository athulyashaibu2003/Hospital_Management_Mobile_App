import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  TextEditingController firstnamecontroller = TextEditingController();
  TextEditingController lastnamecontroller = TextEditingController();
  TextEditingController patientguardianame = TextEditingController();
  TextEditingController addresscontroller = TextEditingController();
  TextEditingController agecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController phonecontroller = TextEditingController();
  TextEditingController aadharcontroller = TextEditingController();
  TextEditingController pancontroller = TextEditingController();
  TextEditingController uhidcontroller = TextEditingController();
  TextEditingController remarkscontroller = TextEditingController();
  TextEditingController departmentcontroller = TextEditingController();

  String? _selectedGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("New User"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: firstnamecontroller,
                  decoration: InputDecoration(
                    labelText: 'First Name',
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.8),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  validator: (name) => name!.length < 3
                      ? "Name should be at least 3 characters"
                      : null,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                ),
                const SizedBox(height: 20.0),
                TextFormField(
                  controller: lastnamecontroller,
                  decoration: InputDecoration(
                    labelText: 'Last Name',
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.8),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                TextFormField(
                  controller: patientguardianame,
                  decoration: InputDecoration(
                    labelText: 'Patient Guardian Name',
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.8),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                TextFormField(
                  controller: addresscontroller,
                  decoration: InputDecoration(
                    labelText: 'Address',
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.8),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                TextFormField(
                  controller: agecontroller,
                  decoration: InputDecoration(
                    labelText: 'Age',
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.8),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                DropdownButtonFormField<String>(
                  value: _selectedGender,
                  decoration: InputDecoration(
                    labelText: 'Gender',
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.8),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  items: ['Male', 'Female', 'Other'].map((String gender) {
                    return DropdownMenuItem<String>(
                      value: gender,
                      child: Text(gender),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedGender = newValue;
                    });
                  },
                  validator: (value) =>
                      value == null ? "Please select a gender" : null,
                ),
                const SizedBox(height: 20.0),
                TextFormField(
                  controller: emailcontroller,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.8),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                TextFormField(
                  controller: phonecontroller,
                  decoration: InputDecoration(
                    labelText: 'Phone',
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.8),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                TextFormField(
                  controller: aadharcontroller,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                        onPressed: () {}, icon: const Icon(Icons.check)),
                    labelText: 'Aadhar',
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.8),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                TextFormField(
                  controller: pancontroller,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                        onPressed: () {}, icon: const Icon(Icons.check)),
                    labelText: 'Pan',
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.8),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                TextFormField(
                  controller: uhidcontroller,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                        onPressed: () {}, icon: const Icon(Icons.check)),
                    labelText: 'UHID',
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.8),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                TextFormField(
                  controller: remarkscontroller,
                  decoration: InputDecoration(
                    labelText: 'Remarks',
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.8),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                TextFormField(
                  controller: departmentcontroller,
                  decoration: InputDecoration(
                    labelText: 'Department',
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.8),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    minimumSize: WidgetStateProperty.all(const Size(45, 45)),
                    backgroundColor: WidgetStateProperty.all(
                      const Color(0xff0ea69f),
                    ),
                  ),
                  onPressed: () {},
                  child: const Text(
                    "Submit",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
