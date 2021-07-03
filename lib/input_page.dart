import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'my_icon.dart';
import 'reusable_card.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

const Color activeCardColor = Color(0xff1d1e33);
const Color inactiveCardColor = Color(0x43121228);
enum Gender { MALE, FEMALE }

class _InputPageState extends State<InputPage> {
  Color currentMaleColor = inactiveCardColor;
  Color currentFemaleColor = inactiveCardColor;

  void onClickGender(Gender g) {
    setState(() {
      currentMaleColor = g == Gender.MALE
          ? currentMaleColor == activeCardColor
              ? inactiveCardColor
              : activeCardColor
          : inactiveCardColor;
      currentFemaleColor = g == Gender.FEMALE
          ? currentFemaleColor == activeCardColor
              ? inactiveCardColor
              : activeCardColor
          : inactiveCardColor;
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
          children: [
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  ReusableCard(
                    color: currentMaleColor,
                    child: MyIcon(
                      icon: FontAwesomeIcons.mars,
                      text: "MALE",
                    ),
                    onPress: () {
                      onClickGender(Gender.MALE);
                    },
                  ),
                  ReusableCard(
                    color: currentFemaleColor,
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
            ReusableCard(color: activeCardColor),
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  ReusableCard(color: activeCardColor),
                  ReusableCard(color: activeCardColor),
                ],
              ),
            ),
            FlatButton(
              padding: EdgeInsets.all(0),
              onPressed: () {},
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
