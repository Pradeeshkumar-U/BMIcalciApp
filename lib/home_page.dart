import 'package:auto_size_text/auto_size_text.dart';
import 'package:bmicalc/result_page.dart';
import 'package:bmicalc/round_icon_button.dart';
import 'gendercolumn.dart';
import 'package:flutter/material.dart';
import 'genderbox.dart';
import 'cardbox.dart';
import 'calculator.dart';
import 'package:bmicalc/brain.dart';

double maleMar = 5;
double femaleMar = 5;
int weight = 25;
bool validate = false;

int num = 18;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _MyAppState();
}

class _MyAppState extends State<HomePage> {
  void _increment() {
    setState(() {
      num += 1;
    });
  }

  void _decrement() {
    if (num > 0) {
      setState(() {
        num -= 1;
      });
    } else {
      setState(() {
        num = 0;
      });
    }
  }

  void maleBox() {
    setState(() {
      maleMar = 0;
      femaleMar = 10;
    });
  }

  void femaleBox() {
    setState(() {
      maleMar = 10;
      femaleMar = 0;
    });
  }

  Future<void> _showAlert(BuildContext context) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Padding(
            padding: EdgeInsets.all(15.0),
            child: Text(
              'HEIGHT',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 29,
                  fontWeight: FontWeight.bold),
            ),
          ),
          content: SizedBox(
            height: 45,
            width: 140,
            child: TextField(
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 40,
                  fontWeight: FontWeight.w900),
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              maxLength: 3,
              controller: myController,
              decoration: InputDecoration(
                errorText: validate ? 'height is not given!' : null,
                suffixIcon: const Text(
                  'cm',
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                ),
                counter: const Offstage(),
                enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                hintText: '00',
                hintStyle: const TextStyle(
                  color: Color.fromARGB(165, 0, 0, 0),
                  fontSize: 30,
                ),
              ),
            ),
          ),
          actions: [
            TextButton(
                onPressed: () {
                  setState(() {
                    Navigator.of(context).pop();
                  });
                },
                child: const Center(
                  child: Icon(
                    Icons.check,
                    color: Colors.blue,
                    size: 30,
                  ),
                ))
          ],
        );
      },
    );
  }

  TextEditingController myController = TextEditingController();
  // int height = int.parse(myController.text);
  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        initialRoute: '/',
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            title: const Text(
              'BMI calculator',
              style: TextStyle(
                color: Colors.black,
                fontSize: 30.0,
                fontWeight: FontWeight.w900,
              ),
            ),
            backgroundColor: const Color.fromARGB(255, 249, 240, 248),
          ),
          body: SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Column(
              children: [
                Expanded(
                  flex: 8,
                  child: Column(children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Flexible(
                                child: GestureDetector(
                              onTap: maleBox,
                              child: GenderBox(
                                  Colors.blue,
                                  GenderColumn(
                                    iconData: const Icon(
                                      Icons.male,
                                      color: Colors.white,
                                      size: 95.0,
                                    ),
                                    myText: 'male',
                                  ),
                                  maleMar),
                            )),
                            Flexible(
                                child: GestureDetector(
                              onTap: femaleBox,
                              child: GenderBox(
                                  Colors.pink.shade300,
                                  GenderColumn(
                                      iconData: const Icon(
                                        Icons.female,
                                        color: Colors.white,
                                        size: 95.0,
                                      ),
                                      myText: 'female'),
                                  femaleMar),
                            ))
                          ],
                        ),
                      ),
                    ),
                    Flexible(
                        child: CardBox(
                            Colors.blueGrey,
                            Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(top: 5.0),
                                    child: Text(
                                      'WEIGHT',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Flexible(
                                    child: FittedBox(
                                      fit: BoxFit.scaleDown,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.baseline,
                                        textBaseline: TextBaseline.alphabetic,
                                        children: [
                                          Text(
                                            weight.toString(),
                                            style: const TextStyle(
                                                fontSize: 70,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w900),
                                          ),
                                          const Text(
                                            'kg',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w700,
                                                fontSize: 26,
                                                color: Colors.white),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Flexible(
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 1.0),
                                      child: Slider(
                                          label:
                                              'Move the slider to set weight',
                                          value: weight.toDouble(),
                                          activeColor: Colors.pinkAccent,
                                          thumbColor: Colors.white,
                                          inactiveColor: Colors.white70,
                                          min: 1,
                                          max: 150,
                                          onChanged: (value) {
                                            setState(() {
                                              weight = value.round();
                                            });
                                          }),
                                    ),
                                  )
                                ],
                              ),
                            ))),
                    Flexible(
                      child: Row(
                        children: [
                          Expanded(
                            child: CardBox(
                                Colors.teal.shade400,
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      const Text(
                                        'AGE',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 30,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      AutoSizeText(
                                        minFontSize: 35,
                                        maxFontSize: 50,
                                        overflow: TextOverflow.ellipsis,
                                        '$num',
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w900),
                                      ),
                                      Flexible(
                                        child: Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              12, 12, 12, 5),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              RoundIconButton(
                                                  icon: Icons.remove,
                                                  onPressed: _decrement),
                                              RoundIconButton(
                                                  onPressed: _increment,
                                                  icon: Icons.add)
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                )),
                          ),
                          Expanded(
                              child: CardBox(
                                  Colors.teal.shade400,
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      const Text(
                                        'HEIGHT',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 29,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      TextButton(
                                        style: const ButtonStyle(
                                          enableFeedback: false,
                                          splashFactory: NoSplash.splashFactory,
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            _showAlert(context);
                                          });
                                        },
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              myController.text.isEmpty
                                                  ? '00'
                                                  : myController.text,
                                              style: const TextStyle(
                                                  fontSize: 35,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white),
                                            ),
                                            const Text(
                                              ' cm',
                                              style: TextStyle(
                                                  fontSize: 35,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const Text('')
                                    ],
                                  )))
                        ],
                      ),
                    ),
                  ]),
                ),
                Calculator(
                    myText: 'CALCULATE',
                    myFunc: () {
                      setState(() {
                        if (myController.text.isEmpty) {
                          validate = true;
                          myController.text = '1';
                        } else {
                          validate = false;
                        }
                      });
                      Brain calc = Brain(
                          height: int.parse(myController.text), weight: weight);

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ResultPage(
                            myText: calc.resultText(),
                            bmiResult: calc.calc(),
                            overView: calc.resultOverview(),
                          ),
                        ),
                      );
                    }),
              ],
            ),
          ),
          backgroundColor: Colors.white,
        ));
  }
}
/**/