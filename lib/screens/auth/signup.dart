import 'package:flutter/material.dart';
import 'package:logger/web.dart';
import 'package:student_registration_app/screens/auth/signin.dart';
import 'package:student_registration_app/utills/app_assets.dart';
import 'package:student_registration_app/utills/app_colors.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final TextEditingController birthdayController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  int? age;

  bool isLoading = true;

  Future<void> _fetchCurrentLocation() async {
    setState(() {
      isLoading = true;
    });
  }

    TextEditingController _first_name = TextEditingController();
  TextEditingController _last_name = TextEditingController();
  TextEditingController _birthday = TextEditingController();
  TextEditingController _mobile_number = TextEditingController();
  TextEditingController _gender = TextEditingController();
  TextEditingController _address = TextEditingController();   
  TextEditingController _school_university = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 40),
                child: const Text(
                  "SignUp",
                  style: TextStyle(
                    fontSize: 35,
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Image.asset(
                AppAssets.signin,
                width: 400,
                height: 200,
                fit: BoxFit.fill,
              ),
              const SizedBox(
                height: 25,
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.ash,
                        offset: const Offset(0, 2),
                        blurRadius: 10,
                      )
                    ]),
                child: TextField(
                  controller: _first_name,
                  decoration: InputDecoration(
                    hintText: "Enter your Name here",
                    hintStyle: const TextStyle(color: AppColors.ash),
                    label: const Text(
                      "First Name",
                      style: TextStyle(color: AppColors.ash),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                      borderSide: const BorderSide(
                        color: AppColors.primaryColor,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                      borderSide: const BorderSide(
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.ash,
                        offset: const Offset(0, 2),
                        blurRadius: 10,
                      )
                    ]),
                child: TextField(
                  controller: _last_name,
                  decoration: InputDecoration(
                    hintText: "Enter your Name here",
                    hintStyle: const TextStyle(color: AppColors.ash),
                    label: const Text(
                      "Last Name",
                      style: TextStyle(color: AppColors.ash),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                      borderSide: const BorderSide(
                        color: AppColors.primaryColor,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                      borderSide: const BorderSide(
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.ash,
                      offset: const Offset(0, 2),
                      blurRadius: 10,
                    ),
                  ],
                ),
                child: TextField(
                  controller: birthdayController,
                  readOnly: true,
                  decoration: InputDecoration(
                    hintText: "Select your Birthday",
                    hintStyle: const TextStyle(color: AppColors.ash),
                    label: const Text(
                      "Birthday",
                      style: TextStyle(color: AppColors.ash),
                    ),
                    suffixIcon: const Icon(
                      Icons.calendar_today,
                      color: AppColors.primaryColor,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                      borderSide: const BorderSide(
                        color: AppColors.primaryColor,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                      borderSide: const BorderSide(
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ),
                  onTap: () async {
                    DateTime currentDate = DateTime.now();
                    DateTime minDate = DateTime(currentDate.year - 35,
                        currentDate.month, currentDate.day);
                    DateTime maxDate = DateTime(currentDate.year - 18,
                        currentDate.month, currentDate.day);

                    DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: maxDate,
                      firstDate: minDate,
                      lastDate: maxDate,
                    );
                    if (pickedDate != null) {
                      setState(() {
                        birthdayController.text =
                            "${pickedDate.year}-${pickedDate.month}-${pickedDate.day}";

                        // Calculate age
                        final today = DateTime.now();
                        age = today.year - pickedDate.year;
                        if (today.month < pickedDate.month ||
                            (today.month == pickedDate.month &&
                                today.day < pickedDate.day)) {
                          age = age! - 1;
                        }
                      });
                    }
                  },
                ),
              ),
              if (age != null)
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    "Age: $age",
                    style: TextStyle(
                      color: AppColors.primaryColor,
                      fontSize: 16,
                    ),
                  ),
                ),
              SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.ash,
                      offset: const Offset(0, 2),
                      blurRadius: 10,
                    ),
                  ],
                ),
                child: TextField(
                  controller: _mobile_number,
                  keyboardType:
                      TextInputType.phone, // Set the keyboard type for numbers
                  maxLength: 10, // Limit the input to 10 digits (optional)
                  decoration: InputDecoration(
                    hintText: "Enter your Mobile Number",
                    hintStyle: const TextStyle(color: AppColors.ash),
                    label: const Text(
                      "Mobile Number",
                      style: TextStyle(color: AppColors.ash),
                    ),
                    counterText:
                        "", // Removes the default counter for maxLength
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                      borderSide: const BorderSide(
                        color: AppColors.primaryColor,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                      borderSide: const BorderSide(
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.ash,
                      offset: const Offset(0, 2),
                      blurRadius: 10,
                    ),
                  ],
                ),
                child: DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    hintText: "Select your Gender",
                    hintStyle: const TextStyle(color: AppColors.ash),
                    label: const Text(
                      "Gender",
                      style: TextStyle(color: AppColors.ash),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                      borderSide: const BorderSide(
                        color: AppColors.primaryColor,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                      borderSide: const BorderSide(
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ),
                  items: [
                    DropdownMenuItem(
                      value: "Male",
                      child: Text("Male"),
                    ),
                    DropdownMenuItem(
                      value: "Female",
                      child: Text("Female"),
                    ),
                    DropdownMenuItem(
                      value: "Other",
                      child: Text("Other"),
                    ),
                  ],
                  onChanged: (String? value) {
                    // Handle selection
                  },
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.ash,
                      offset: const Offset(0, 2),
                      blurRadius: 10,
                    ),
                  ],
                ),
                child: TextField(
                  readOnly: true,
                  controller: addressController,
                  decoration: InputDecoration(
                    hintText: isLoading
                        ? "Fetching location..."
                        : "Your current address",
                    hintStyle: const TextStyle(color: AppColors.ash),
                    label: const Text(
                      "Address",
                      style: TextStyle(color: AppColors.ash),
                    ),
                    suffixIcon: IconButton(
                      icon: const Icon(
                        Icons.location_on,
                        color: AppColors.primaryColor,
                      ),
                      onPressed: isLoading ? null : _fetchCurrentLocation,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                      borderSide: const BorderSide(
                        color: AppColors.primaryColor,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                      borderSide: const BorderSide(
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.ash,
                      offset: const Offset(0, 2),
                      blurRadius: 10,
                    ),
                  ],
                ),
                child: TextField(
                  controller: _school_university,
                  decoration: InputDecoration(
                    hintText: "Enter your School or University here",
                    hintStyle: const TextStyle(color: AppColors.ash),
                    label: const Text(
                      "School/University",
                      style: TextStyle(color: AppColors.ash),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                      borderSide: const BorderSide(
                        color: AppColors.primaryColor,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                      borderSide: const BorderSide(
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryColor,
                  foregroundColor: Colors.white,
                  minimumSize: Size(350, 55),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Signin(),
                      ));
                },
                child: Text(
                  "Sign Up",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account",
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Signin(),
                            ));
                      },
                      child: Text(
                        "Sign In",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 70,
              ),
            ],
          ),
        ),
      ),
    );
  }


}