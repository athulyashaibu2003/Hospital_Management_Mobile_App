import 'package:flutter/material.dart';
import 'package:hms_project/controller/search_screen_controller.dart';
import 'package:hms_project/controller/sos_controller.dart';
import 'package:hms_project/presentation/constants/colorconstants.dart';
import 'package:hms_project/presentation/doctor_app/doctor_login_page.dart';
import 'package:hms_project/presentation/home_page/view/bottom_navigation_bar/bottom_nav_bar.dart';
import 'package:hms_project/presentation/login_page/staff_login_page.dart';
import 'package:hms_project/presentation/signup_page/view/signup_page.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController loginusernamecontroller = TextEditingController();
  TextEditingController loginpasswordcontroller = TextEditingController();
  String patientId = '';
  final _formkey = GlobalKey<FormState>();
  Future<void> insertrecord() async {
    if (loginusernamecontroller.text.isNotEmpty &&
        loginpasswordcontroller.text.isNotEmpty) {
      try {
        String uri =
            "https://cybot.avanzosolutions.in/hms/loginverifypatient.php";
        var res = await http.post(Uri.parse(uri), body: {
          "loginusernamecontroller": loginusernamecontroller.text,
          "loginpasswordcontroller": loginpasswordcontroller.text
        });
        print(res.body);
        patientId = res.body;
        if (patientId != 'NULL') {
          print(res.body);
          print("Record inserted");
          // Save the login state and credentials
          //   box1.put('isLoggedIn', true);
          // if (isChecked) {
          //   box1.put('email', loginusernamecontroller.text);
          //   box1.put('pass', loginpasswordcontroller.text);
          // }
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              backgroundColor: Colors.green,
              content: Text(
                "Login Successfully",
                style: TextStyle(color: Colors.white),
              ),
              duration: Duration(milliseconds: 1500),
            ),
          );
          Future.delayed(const Duration(milliseconds: 1500), () {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const MyBottomNavBar()),
                (route) => false);
          });
          loginpasswordcontroller.clear();
          loginusernamecontroller.clear();
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              backgroundColor: Colors.red,
              content: Text(
                "Login Unsuccessful",
                style: TextStyle(color: Colors.white),
              ),
              duration: Duration(seconds: 2),
            ),
          );
        }
      } catch (e) {
        print(e);
      }
    } else {
      print("Please fill all fields");
    }
  }

  @override
  Widget build(BuildContext context) {
    var patientDetailsFunctionProvider =
        Provider.of<SearchScreenController>(context, listen: false);
    var patientDetailsProvider =
        Provider.of<SearchScreenController>(context, listen: false);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        color: Colors.white,
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 32.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 40.0),
                  TextFormField(
                      controller: loginusernamecontroller,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(
                          Icons.person,
                          color: ColorConstants.mainBlue,
                        ),
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
                          return "Username is Required";
                        }
                      }),
                  const SizedBox(height: 20.0),
                  TextFormField(
                    controller: loginpasswordcontroller,
                    obscureText: true,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(
                        Icons.password_outlined,
                        color: ColorConstants.mainBlue,
                      ),
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
                  ElevatedButton(
                    onPressed: () async {
                      if (_formkey.currentState!.validate()) {
                        await insertrecord();
                        await patientDetailsFunctionProvider
                            .patientdata(patientId);
                      }
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => HomePage(),
                      //   ),
                      // );
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
                  const SizedBox(height: 20.0),
                  TextButton(
                    onPressed: () {
                      // Implement forgot password functionality here
                    },
                    child: const Text(
                      'Forgot Password?',
                      style: TextStyle(color: Color(0xff0ea69f)),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignupPage(),
                        ),
                      );
                    },
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(color: Color(0xff0ea69f)),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  // OutlinedButton(
                  //   onPressed: () {
                  //     Navigator.push(
                  //         context,
                  //         MaterialPageRoute(
                  //             builder: (context) => const DoctorLoginpage()));
                  //     // Implement staff login functionality here
                  //   },
                  //   style: OutlinedButton.styleFrom(
                  //     foregroundColor: const Color(0xff0ea69f),
                  //     side: const BorderSide(color: Color(0xff0ea69f)),
                  //     shape: RoundedRectangleBorder(
                  //       borderRadius: BorderRadius.circular(8.0),
                  //     ),
                  //     padding: const EdgeInsets.symmetric(
                  //         horizontal: 50.0, vertical: 15.0),
                  //   ),
                  //   child: const Text('Staff Login'),
                  // ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => LoginPage()));
                          return;
                        },
                        child: CircleAvatar(
                          backgroundColor: ColorConstants.lightgreen,
                          radius: 25,
                          child: Image.asset(
                            "assets/images/patient.png",
                            height: 30,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const DoctorLoginpage()));
                        },
                        child: CircleAvatar(
                          backgroundColor: ColorConstants.lightgreen,
                          radius: 25,
                          child: Image.asset(
                            "assets/images/doctor_6938244.png",
                            height: 30,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
