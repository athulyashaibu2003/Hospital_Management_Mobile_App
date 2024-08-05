import 'package:flutter/material.dart';
import 'package:hms_project/presentation/home_page/view/home_page.dart';
import 'package:hms_project/presentation/login_page/view/login_page.dart';
import 'package:http/http.dart' as http;

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  TextEditingController firstnamecontroller = TextEditingController();
  TextEditingController lastnamecontroller = TextEditingController();
  TextEditingController usernamecontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController conpasswordcontroller = TextEditingController();
  TextEditingController phnumbercontroller = TextEditingController();
  TextEditingController mailidcontroller = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  String? validateEmail(String? email) {
    RegExp emailRegex = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    final isEmailvalid = emailRegex.hasMatch(email ?? '');
    if (!isEmailvalid) {
      return 'Please enter a valid email';
    }
    return null;
  }

  Future<void> insertrecord() async {
    if (firstnamecontroller.text != "" ||
        lastnamecontroller.text != "" ||
        usernamecontroller.text != "" ||
        phnumbercontroller.text != "" ||
        mailidcontroller.text != "" ||
        passwordcontroller.text != "") {
      try {
        String uri = "https://cybot.avanzosolutions.in/hms/Signuppatient.php";
        var res = await http.post(Uri.parse(uri), body: {
          "firstnamecontroller": firstnamecontroller.text,
          "lastnamecontroller": lastnamecontroller.text,
          "usernamecontroller": usernamecontroller.text,
          "passwordcontroller": passwordcontroller.text,
          "mailidcontroller": mailidcontroller.text,
          "phnumbercontroller": phnumbercontroller.text
        });
        var response = "success";
        var resp = "WRONG CREDENTIALS";

        if (res.body == response) {
          print("Record inserted");
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const LoginPage()),
              (route) => false);
        }
        if (res.body == resp) {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const LoginPage()),
              (route) => false);
        }
      } catch (e) {
        print(e);
      }
    } else {
      print("please fill all fields");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      resizeToAvoidBottomInset: true,
      body: Form(
        key: _formkey,
        child: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Register',
                    style: TextStyle(
                      fontSize: 32.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 40.0),
                  TextFormField(
                    controller: firstnamecontroller,
                    decoration: InputDecoration(
                      labelText: 'First Name',
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.8),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
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
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  TextFormField(
                      controller: usernamecontroller,
                      decoration: InputDecoration(
                        labelText: 'Username',
                        filled: true,
                        fillColor: Colors.white.withOpacity(0.8),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      validator: (value) {
                        if (value != null && value.length >= 5) {
                          return null;
                        } else {
                          return "Please Enter a Valid Username";
                        }
                      }),
                  const SizedBox(height: 20.0),
                  TextFormField(
                    controller: mailidcontroller,
                    decoration: InputDecoration(
                      labelText: 'Mail Id',
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.8),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    validator: validateEmail,
                  ),
                  const SizedBox(height: 20.0),
                  TextFormField(
                      controller: phnumbercontroller,
                      decoration: InputDecoration(
                        labelText: 'Phone Number',
                        filled: true,
                        fillColor: Colors.white.withOpacity(0.8),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      validator: (value) {
                        if (value != null && value.length >= 7) {
                          return null;
                        } else {
                          return "Mobile number is required";
                        }
                      }),
                  const SizedBox(height: 20.0),
                  TextFormField(
                    controller: passwordcontroller,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.8),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    validator: (value) {
                      if (value != null && value.length >= 7) {
                        return null;
                      } else {
                        return "Password is Required";
                      }
                    },
                  ),
                  const SizedBox(height: 20.0),
                  TextFormField(
                    controller: conpasswordcontroller,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Confirm Password',
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.8),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  ElevatedButton(
                    onPressed: () {
                      // Implement registration functionality here
                      insertrecord();
                      if (_formkey.currentState!.validate()) {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomePage()),
                            (route) => false);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff0ea69f),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 50.0, vertical: 15.0),
                    ),
                    child: const Text(
                      'Submit',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
