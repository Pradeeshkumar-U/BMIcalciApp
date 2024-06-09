import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan[200], // WhatsApp-like background color
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const SizedBox(
                height: double.infinity,
                width: double.infinity,
              ),
              SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/bmi_calc_icon.png',
                        width: 100, height: 100),
                    const SizedBox(height: 20),
                    const Text(
                      'BMI CALCI',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: Center(
                    child: Text(
                  'PRADEESHKUMAR U',
                  style: TextStyle(
                    fontFamily: 'SignikaNegative-VariableFont_wght.ttf',
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
