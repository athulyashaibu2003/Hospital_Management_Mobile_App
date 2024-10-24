import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:hms_project/controller/booking_patient_controller.dart';
import 'package:hms_project/presentation/home_page/view/home_page.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'dart:developer';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class NewPatientRegistrationscreen extends StatefulWidget {
  const NewPatientRegistrationscreen({super.key});

  @override
  State<NewPatientRegistrationscreen> createState() =>
      _NewPatientRegistrationscreenState();
}

class _NewPatientRegistrationscreenState
    extends State<NewPatientRegistrationscreen> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController firstnamecontroller = TextEditingController();
  TextEditingController lastnamecontroller = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController occupationController = TextEditingController();
  TextEditingController fatherHusbandNameController = TextEditingController();
  TextEditingController nationalityController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController doctorToBeConsultedController = TextEditingController();
  TextEditingController idDocumentProvidedController = TextEditingController();
  TextEditingController departmentController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController bloodGroupController = TextEditingController();
  TextEditingController maritalStatusController = TextEditingController();
  TextEditingController remarkscontroller = TextEditingController();

  String? _selectedGender;
  String? _selectedBloodGroup;
  String? _selectedMaritalStatus;
  String? _selectedDepartment;
  String? _selectedDoctor;
  String? _selectedDoctorEmpId;
  String? imageName;

  bool _termsAccepted = false;

  final List<String> _genders = ['Male', 'Female', 'Other'];
  final List<String> _bloodGroups = [
    'A+',
    'A-',
    'B+',
    'B-',
    'AB+',
    'AB-',
    'O+',
    'O-'
  ];
  final List<String> _maritalStatuses = [
    'Single',
    'Married',
    'Divorced',
    'Widowed'
  ];

  final List<String> _doctors = [];

  bool visible = false;

  callFuction() async {
    await Provider.of<BookingPatientController>(context, listen: false)
        .department();
  }

  @override
  void initState() {
    super.initState();
    callFuction();
  }

  File? _profileImage;
  final ImagePicker _picker = ImagePicker();
  File? files;
  Future<void> _pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _profileImage = File(image.path);
      });
    }
    imageName = _profileImage?.path.split('/').last;
    print(_profileImage?.path.split('/').last);
  }

  Future<void> uploadImage(File image) async {
    final uri = Uri.parse("https://cybot.avanzosolutions.in/hms/test.php");
    var request = http.MultipartRequest('POST', uri);

    var pic = await http.MultipartFile.fromPath("image", image.path);
    request.files.add(pic);

    var response = await request.send();
    print(response.statusCode);
    if (response.statusCode == 200) {
      print('Image Uploaded');
    } else {
      print('Image Not Uploaded');
    }
  }

  Future<void> uploadFile(File receipt) async {
    print("xjhhhc");
    final uri = Uri.parse("https://cybot.avanzosolutions.in/hms/testdoc.php");
    var request = http.MultipartRequest('POST', uri);

    var pic = await http.MultipartFile.fromPath("receipt", receipt.path);
    request.files.add(pic);

    var response = await request.send();
    print(response.statusCode);
    if (response.statusCode == 200) {
      print('File Uploaded');
    } else {
      print('File Not Uploaded');
    }
  }

  Future<void> insertrecord() async {
    try {
      String uri =
          "https://cybot.avanzosolutions.in/hms/patientregisteration.php";
      var res = await http.post(Uri.parse(uri), body: {
        "firstnamecontroller": firstnamecontroller.text,
        "lastnamecontroller": lastnamecontroller.text,
        "dobController": dobController.text,
        "occupationController": occupationController.text,
        "fatherHusbandNameController": fatherHusbandNameController.text,
        "nationalityController": nationalityController.text,
        "addressController": addressController.text,
        "phoneNumberController": phoneNumberController.text,
        "mobileController": mobileController.text,
        "emailController": emailController.text,
        "empcode": _selectedDoctorEmpId,
        "idDocumentProvidedController": idDocumentProvidedController.text,
        "departmentController": departmentController.text,
        "genderController": genderController.text,
        "bloodGroupController": bloodGroupController.text,
        "maritalStatusController": maritalStatusController.text,
        "remarkscontroller": remarkscontroller.text,
        "imagecontroller": imageName,
      });

      if (res.statusCode == 200) {
        print("Record inserted");
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const HomePage()),
            (route) => false);
      } else {
        print("false");
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const HomePage()),
            (route) => false);
      }
    } catch (e) {
      log(e.toString());
    }
  }

  String? _validateNotEmpty(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field cannot be empty';
    }
    return null;
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field cannot be empty';
    }
    RegExp emailRegex = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if (!emailRegex.hasMatch(value)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  String? _validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field cannot be empty';
    }
    if (value.length < 7) {
      return 'Please enter a valid phone number';
    }
    return null;
  }

  String? _validateDropdown(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field cannot be empty';
    }
    return null;
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() {
        dobController.text = "${picked.toLocal()}".split(' ')[0];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var functionprovider =
        Provider.of<BookingPatientController>(context, listen: false);
    var varprovider = Provider.of<BookingPatientController>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("New Patient Registration"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: GestureDetector(
                  onTap: _pickImage,
                  child: CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.grey.shade300,
                    backgroundImage: _profileImage != null
                        ? FileImage(_profileImage!)
                        : null,
                    child: _profileImage == null
                        ? const Icon(
                            Icons.add_a_photo,
                            color: Colors.white,
                            size: 50,
                          )
                        : null,
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: firstnamecontroller,
                decoration: const InputDecoration(
                  labelText: 'First Name',
                  border: OutlineInputBorder(),
                ),
                validator: _validateNotEmpty,
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: lastnamecontroller,
                decoration: const InputDecoration(
                  labelText: 'Last Name',
                  border: OutlineInputBorder(),
                ),
                validator: _validateNotEmpty,
              ),
              const SizedBox(height: 16.0),
              GestureDetector(
                onTap: () => _selectDate(context),
                child: AbsorbPointer(
                  child: TextFormField(
                    controller: dobController,
                    decoration: const InputDecoration(
                      labelText: 'Date of Birth',
                      border: OutlineInputBorder(),
                    ),
                    validator: _validateNotEmpty,
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              DropdownButtonFormField<String>(
                value: _selectedGender,
                decoration: const InputDecoration(
                  labelText: 'Gender',
                  border: OutlineInputBorder(),
                ),
                items: _genders.map((String gender) {
                  return DropdownMenuItem<String>(
                    value: gender,
                    child: Text(gender),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedGender = newValue;
                    genderController.text = newValue ?? '';
                  });
                },
                validator: _validateDropdown,
              ),
              const SizedBox(height: 16.0),
              DropdownButtonFormField<String>(
                value: _selectedBloodGroup,
                decoration: const InputDecoration(
                  labelText: 'Blood Group',
                  border: OutlineInputBorder(),
                ),
                items: _bloodGroups.map((String bloodGroup) {
                  return DropdownMenuItem<String>(
                    value: bloodGroup,
                    child: Text(bloodGroup),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedBloodGroup = newValue;
                    bloodGroupController.text = newValue ?? '';
                  });
                },
                validator: _validateDropdown,
              ),
              const SizedBox(height: 16.0),
              DropdownButtonFormField<String>(
                value: _selectedMaritalStatus,
                decoration: const InputDecoration(
                  labelText: 'Marital Status',
                  border: OutlineInputBorder(),
                ),
                items: _maritalStatuses.map((String maritalStatus) {
                  return DropdownMenuItem<String>(
                    value: maritalStatus,
                    child: Text(maritalStatus),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedMaritalStatus = newValue;
                    maritalStatusController.text = newValue ?? '';
                  });
                },
                validator: _validateDropdown,
              ),
              const SizedBox(height: 16.0),
              DropdownButtonFormField<String>(
                  value: _selectedDepartment,
                  decoration: const InputDecoration(
                    labelText: 'Department',
                    border: OutlineInputBorder(),
                  ),
                  items: varprovider.deptList.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (newValue) async {
                    setState(() {
                      _selectedDepartment = newValue;
                    });
                    _doctors.clear();
                    await functionprovider.doctors(_selectedDepartment);
                    if (varprovider.doctorsmodelclass.list!.isNotEmpty) {
                      for (var i = 0;
                          i < varprovider.doctorsmodelclass.list!.length;
                          i++) {
                        _doctors.add(
                            varprovider.doctorsmodelclass.list?[i].name ?? "");
                      }
                    }
                    _selectedDoctor = _doctors[0];
                    _selectedDoctorEmpId =
                        varprovider.doctorsmodelclass.list?[0].empcode ?? "";
                    print(_doctors);
                  }),
              const SizedBox(height: 16.0),
              DropdownButtonFormField<String>(
                value: _selectedDoctor,
                decoration: const InputDecoration(
                  labelText: 'Doctor',
                  border: OutlineInputBorder(),
                ),
                items: _doctors.map((String doctor) {
                  return DropdownMenuItem<String>(
                    value: doctor,
                    child: Text(doctor),
                  );
                }).toList(),
                onChanged: (String? newValue) async {
                  setState(() {
                    _selectedDoctor = newValue;
                    // doctorToBeConsultedController.text = newValue ?? '';
                  });
                  int itemid = 0;
                  _doctors.clear();
                  await functionprovider.doctors(_selectedDepartment);
                  for (var i = 0; i < _doctors.length; i++) {
                    if (_doctors[i] == _selectedDoctor) {
                      itemid = i;
                    }
                  }
                  _selectedDoctorEmpId = _doctors[itemid];
                },
                validator: _validateDropdown,
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: occupationController,
                decoration: const InputDecoration(
                  labelText: 'Occupation',
                  border: OutlineInputBorder(),
                ),
                validator: _validateNotEmpty,
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: fatherHusbandNameController,
                decoration: const InputDecoration(
                  labelText: 'Father/Husband Name',
                  border: OutlineInputBorder(),
                ),
                validator: _validateNotEmpty,
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: nationalityController,
                decoration: const InputDecoration(
                  labelText: 'Nationality',
                  border: OutlineInputBorder(),
                ),
                validator: _validateNotEmpty,
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: addressController,
                decoration: const InputDecoration(
                  labelText: 'Address',
                  border: OutlineInputBorder(),
                ),
                validator: _validateNotEmpty,
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: phoneNumberController,
                decoration: const InputDecoration(
                  labelText: 'Phone Number',
                  border: OutlineInputBorder(),
                ),
                validator: _validatePhoneNumber,
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: mobileController,
                decoration: const InputDecoration(
                  labelText: 'Mobile',
                  border: OutlineInputBorder(),
                ),
                validator: _validatePhoneNumber,
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
                validator: _validateEmail,
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: idDocumentProvidedController,
                decoration: const InputDecoration(
                  labelText: 'Identifical Document Provided',
                  border: OutlineInputBorder(),
                ),
                validator: _validateNotEmpty,
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: remarkscontroller,
                decoration: const InputDecoration(
                  labelText: 'Remarks',
                  border: OutlineInputBorder(),
                ),
                validator: _validateNotEmpty,
              ),
              Visibility(
                visible: visible,
                child: Column(
                  children: [
                    Center(
                      child: Image.asset(
                        "assets/images/file.png",
                        height: MediaQuery.sizeOf(context).height * .1,
                      ),
                    ),
                    Text(files?.path.split('/').last ?? ""),
                  ],
                ),
              ),
              const SizedBox(height: 16.0),
              Center(
                child: InkWell(
                  onTap: () async {
                    print("object");
                    FilePickerResult? result =
                        await FilePicker.platform.pickFiles();
                    if (result != null) {
                      files = File(result.files.single.path!);
                    }
                    setState(() {
                      visible = true;
                    });
                    print(files);
                  },
                  child: Container(
                    height: 50,
                    width: MediaQuery.sizeOf(context).width * .5,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.blue,
                    ),
                    alignment: Alignment.center,
                    child: const Text("Upload files"),
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              CheckboxListTile(
                title: const Text("I accept the terms and conditions"),
                value: _termsAccepted,
                onChanged: (bool? value) {
                  setState(() {
                    _termsAccepted = value ?? false;
                  });
                },
              ),
              const SizedBox(height: 16.0),
              Center(
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(
                      _termsAccepted
                          ? const Color(0xff0ea69f)
                          : const Color(0xff8d8d8d),
                    ),
                  ),
                  onPressed: _termsAccepted
                      ? () async {
                          bool profile = false;
                          bool fileupload = false;
                          if (_formKey.currentState!.validate()) {
                            if (_profileImage != null) {
                              profile = true;
                            } else {
                              profile = false;
                              imageName = "0";
                            }
                            fileupload = files != null ? true : false;
                            await insertrecord();
                            if (profile) {
                              await uploadImage(_profileImage!);
                            }
                            if (fileupload) {
                              await uploadFile(files!);
                            }
                            //  print("Form submitted");
                          } else {
                            print("Form is invalid");
                          }
                        }
                      : null,
                  child: const Text(
                    'Submit',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
