import 'package:flutter/material.dart';
import 'package:student_registration_app/screens/auth/signin.dart';
import 'package:student_registration_app/utills/app_assets.dart';
import 'package:student_registration_app/utills/app_colors.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  int? age;
  bool _obscurePassword = true;
  bool isLoading = true;

  Future<void> _fetchCurrentLocation() async {
    setState(() {
      isLoading = true;
    });
  }

  TextEditingController _first_name = TextEditingController();
  TextEditingController _last_name = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _birthday = TextEditingController();
  TextEditingController _mobile_number = TextEditingController();

  TextEditingController _address = TextEditingController();
  TextEditingController _school_university = TextEditingController();

  String? selectedGender;

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
                    hintText: "Enter Your Name Here",
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
                      )
                    ]),
                child: TextField(
                  controller: _email,
                  decoration: InputDecoration(
                    hintText: "Enter your Email here",
                    hintStyle: const TextStyle(color: AppColors.ash),
                    label: const Text(
                      "Email",
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
              const SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.ash,
                      offset: const Offset(0, 0),
                      blurRadius: 10,
                    ),
                  ],
                ),
                child: TextField(
                  controller: _password,
                  obscureText: _obscurePassword,
                  decoration: InputDecoration(
                    hintText: "Enter your Password here",
                    hintStyle: const TextStyle(color: AppColors.ash),
                    label: const Text(
                      "Password",
                      style: TextStyle(color: AppColors.ash),
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscurePassword
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscurePassword = !_obscurePassword;
                        });
                      },
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
              SizedBox(height: 10),
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
                  controller: _birthday,
                  readOnly: true,
                  decoration: InputDecoration(
                    hintText: "Select Your Birthday",
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
                        _birthday.text =
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
                    hintText: "Enter Your Mobile Number",
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
                    hintText: "Select Your Gender",
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
                    setState(() {
                      selectedGender = value;
                    });
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
                  readOnly: false,
                  controller: _address,
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
                    hintText: "Enter Your School or University Here",
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
                  validateFields(context);
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

  void validateFields(BuildContext context) {
    if (_first_name.text.trim().isEmpty) {
      showError(context, "First Name is required");
      return;
    }

    if (_last_name.text.trim().isEmpty) {
      showError(context, "Last Name is required");
      return;
    }

    if (_birthday.text.trim().isEmpty) {
      showError(context, "Please select your Birthday");
      return;
    }

    if (_mobile_number.text.trim().isEmpty) {
      showError(context, "Mobile Number is required");
      return;
    }

    if (_mobile_number.text.trim().length != 10) {
      showError(context, "Enter a valid 10-digit Mobile Number");
      return;
    }

    if (selectedGender == null) {
      showError(context, "Please select Gender");
      return;
    }

    if (_address.text.trim().isEmpty) {
      showError(context, "Address is required");
      return;
    }

    if (_school_university.text.trim().isEmpty) {
      showError(context, "School/University is required");
      return;
    }

    /// ✅ All validations passed
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("All fields are valid ✅")),
    );
  }

  void showError(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
      ),
    );
  }
}
