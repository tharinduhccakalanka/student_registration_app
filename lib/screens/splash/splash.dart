import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import 'package:student_registration_app/screens/onboarding/onboarding.dart';

import 'package:student_registration_app/utills/app_assets.dart';
import 'package:student_registration_app/utills/app_colors.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const Onboarding(),
        ),
      );
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AppAssets.logo,
              width: 300,
              height: 350,
              fit: BoxFit.fill,
            ),
            const SizedBox(height: 30),
            FadeInUp(
              child: const Text(
                "Your Trusted Learning Platform",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
