import 'package:flutter/material.dart';
import 'package:bmicalc/calculator.dart';

// ignore: must_be_immutable
class ResultPage extends StatelessWidget {
  ResultPage(
      {super.key,
      required this.myText,
      required this.bmiResult,
      required this.overView});
  String myText;
  String bmiResult;
  String overView;

  String myString() {
    if (overView == '"Empower Your Health: Achieve Your Ideal Weight"') {
      return 'UNDERWEIGHT';
    } else if (overView == '"Your Perfect Balance: Live Well, Feel Well"') {
      return 'NORMAL';
    } else if (overView ==
        '"Commit to Fit: A Healthier Tomorrow Starts Today"') {
      return 'OBESE';
    } else if (overView ==
        '"Transform Your Life: Healthier Choices, Brighter Future"') {
      return 'OVERWEIGHT';
    } else if (overView ==
        '"Don\'t Be Shy! Type a Value to See the Results!"') {
      return '--------------';
    } else {
      return 'EXTREMELY OBESE';
    }
  }

  int myColor() {
    if (overView == '"Empower Your Health: Achieve Your Ideal Weight"') {
      return 0xFF5C62D6;
    } else if (overView == '"Your Perfect Balance: Live Well, Feel Well"') {
      return 0xFF4FB06D;
    } else if (overView ==
        '"Commit to Fit: A Healthier Tomorrow Starts Today"') {
      return 0xFFFFCE30;
    } else if (overView ==
        '"Transform Your Life: Healthier Choices, Brighter Future"') {
      return 0xFFEE6C2B;
    } else if (overView ==
        '"Don\'t Be Shy! Type a Value to See the Results!"') {
      return 0xFFFF0000;
    } else {
      return 0xFFE83845;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(),
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 8,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    ' Your Result',
                    style: TextStyle(
                        fontFamily: 'SignikaNegative-VariableFont_wght.ttf',
                        fontSize: 50,
                        fontWeight: FontWeight.bold),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 30, horizontal: 26),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade600,
                              spreadRadius: 1,
                              blurRadius: 15,
                              blurStyle: BlurStyle.normal,
                            )
                          ],
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              myString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily:
                                      'SignikaNegative-VariableFont_wght.ttf',
                                  fontSize: 35,
                                  color: Color(myColor())),
                            ),
                            Text(
                              bmiResult,
                              style: const TextStyle(
                                fontWeight: FontWeight.w900,
                                fontSize: 80,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Text(
                                overView,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontFamily:
                                      'SignikaNegative-VariableFont_wght.ttf',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 26,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Calculator(
              myText: 'CALCULATE AGAIN',
              myFunc: () {
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );
  }
}
