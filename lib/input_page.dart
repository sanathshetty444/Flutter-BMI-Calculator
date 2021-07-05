import 'package:bmi_calculator/result_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'my_icon.dart';
import 'reusable_card.dart';
import 'constants.dart';
import 'calculate_bmi.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

enum Gender { MALE, FEMALE }

class _InputPageState extends State<InputPage> {
  Gender currentGender = Gender.MALE;
  int height = 182;
  int weight = 60;
  int age = 20;

  void onClickGender(Gender g) {
    setState(() {
      currentGender = g == Gender.MALE ? Gender.MALE : Gender.FEMALE;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text('BMI CALCULATOR'),
          ),
        ),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  ReusableCard(
                    color: currentGender == Gender.MALE
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    child: MyIcon(
                      icon: FontAwesomeIcons.mars,
                      text: "MALE",
                    ),
                    onPress: () {
                      onClickGender(Gender.MALE);
                    },
                  ),
                  ReusableCard(
                    color: currentGender == Gender.FEMALE
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    child: MyIcon(
                      icon: FontAwesomeIcons.venus,
                      text: "FEMALE",
                    ),
                    onPress: () {
                      onClickGender(Gender.FEMALE);
                    },
                  ),
                ],
              ),
            ),
            ReusableCard(
              color: kActiveCardColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      "Height",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.normal),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    textBaseline: TextBaseline.alphabetic,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    children: [
                      Text(
                        height.toString(),
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 60,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "cm",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Expanded(
                    flex: 1,
                    child: SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                          activeTrackColor: kActiveSliderColor,
                          thumbShape:
                              RoundSliderThumbShape(enabledThumbRadius: 15.0),
                          overlayShape:
                              RoundSliderOverlayShape(overlayRadius: 30.0),
                          overlayColor: Color(0x29eb1555),
                          thumbColor: Color(0xffeb1555)),
                      child: Slider(
                        value: height.toDouble(),
                        min: 100,
                        max: 220,
                        onChanged: (double val) {
                          setState(() {
                            height = val.toInt();
                          });
                        },
                        inactiveColor: kInactiveSliderColor,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ReusableCard(
                    color: kActiveCardColor,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(
                            'Age',
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5.0),
                          child: Text(
                            age.toString(),
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: EdgeInsets.only(top: 12.0, bottom: 5.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                MyIconButton(
                                  icon: FontAwesomeIcons.plus,
                                  onPress: () {
                                    setState(() {
                                      age++;
                                    });
                                  },
                                ),
                                MyIconButton(
                                  icon: FontAwesomeIcons.minus,
                                  onPress: () {
                                    setState(() {
                                      age--;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  ReusableCard(
                    color: kActiveCardColor,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(
                            'Weight',
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5.0),
                          child: Text(
                            weight.toString(),
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: EdgeInsets.only(top: 12.0, bottom: 5.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                MyIconButton(
                                  icon: FontAwesomeIcons.plus,
                                  onPress: () {
                                    setState(() {
                                      weight++;
                                    });
                                  },
                                ),
                                MyIconButton(
                                  icon: FontAwesomeIcons.minus,
                                  onPress: () {
                                    setState(() {
                                      weight--;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            FlatButton(
              padding: EdgeInsets.all(0),
              onPressed: () {
                CalculatorBrain cb = new CalculatorBrain(
                    height: this.height, weight: this.weight);
                String bmi = cb.calculateBMI();
                String res = cb.getResult();
                String inter = cb.getInterpretation();

                Navigator.pushNamed(
                  context,
                  '/result',
                  arguments: Arguments(
                    res,
                    bmi,
                    inter,
                  ),
                );
              },
              child: Container(
                color: Color(0xffeb1555),
                width: double.infinity,
                child: Center(
                  child: Text(
                    "Calculate Your BMI",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                height: 50,
              ),
            )
          ],
        ));
  }
}

class MyIconButton extends StatelessWidget {
  final IconData icon;
  final Function onPress;
  MyIconButton({this.icon, @required this.onPress});
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPress,
      elevation: 0.0,
      fillColor: Color(0xFF4C4F5E),
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      shape: CircleBorder(),
      child: Icon(icon),
    );
  }
}
