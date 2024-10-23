import 'package:flutter/material.dart';
import 'package:hms_project/controller/doctor_name_controller.dart';
import 'package:hms_project/presentation/doctor_app/bottom_nav_screen.dart';
import 'package:hms_project/presentation/doctor_app/forget_password_screen.dart';
import 'package:provider/provider.dart';

class DoctorLoginpage extends StatefulWidget {
  const DoctorLoginpage({super.key});
  @override
  State<DoctorLoginpage> createState() => _DoctorLoginpageState();
}

class _DoctorLoginpageState extends State<DoctorLoginpage> {
  TextEditingController loginusernamecontroller = TextEditingController();
  TextEditingController loginpasswordcontroller = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  Future<void> insertrecord(DoctorNameController doctorFunctionProvider) async {
    if (loginusernamecontroller.text.isNotEmpty &&
        loginpasswordcontroller.text.isNotEmpty) {
      try {
        // String uri = "https://cybot.avanzosolutions.in/hms/useridpass.php";
        // var res = await http.post(Uri.parse(uri), body: {
        //   "loginusernamecontroller": loginusernamecontroller.text,
        //   "loginpasswordcontroller": loginpasswordcontroller.text
        // });
        // log(res.body);
        // log(res.statusCode.toString());

        await doctorFunctionProvider.patientdata(
            password: loginpasswordcontroller.text,
            username: loginusernamecontroller.text);
        if (doctorFunctionProvider.userCredentialsModel?.id != null) {
          // print("Record inserted");

          // print(res.body);
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
                MaterialPageRoute(
                    builder: (context) => const DoctorBottomNavScreen()),
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
    var doctorFunctionProvider =
        Provider.of<DoctorNameController>(context, listen: false);
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
                      labelText: 'Username',
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.8),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    // validator: (value) {
                    //   if (value != null && value.length >= 5) {
                    //     return null;
                    //   } else {
                    //     return "Username is Required";
                    //   }
                    // }
                  ),
                  const SizedBox(height: 20.0),
                  TextFormField(
                    controller: loginpasswordcontroller,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.8),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    // validator: (value) {
                    //   if (value != null && value.length >= 7) {
                    //     return null;
                    //   } else {
                    //     return "Password is Required";
                    //   }
                    // },
                  ),
                  const SizedBox(height: 20.0),
                  ElevatedButton(
                    onPressed: () {
                      if (_formkey.currentState!.validate()) {
                        insertrecord(doctorFunctionProvider);
                      }
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) =>
                      //             const DoctorBottomNavScreen()));
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
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ForgotPasswordScreen()));
                      // Implement forgot password functionality here
                    },
                    child: const Text(
                      'Forgot Password?',
                      style: TextStyle(color: Color(0xff0ea69f)),
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
