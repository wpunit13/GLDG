import 'package:GLDG/screens/list_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/icon_content.dart';
import '../components/reusable_card.dart';
import '../data/constants.dart';
import '../components/bottom_button.dart';
import '../components/calculator_brain.dart';
import '../components/round_icon_button.dart';
import 'multi_select.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../data/input_list.dart';
import '../classes/patient.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColour = kInactiveCardColour;
  Color femaleCardColour = kInactiveCardColour;

  List<String> countriesTravelled = [];
  List<String> symptoms = [];
  List<String> medicalHistory = [];
  Gender selectedGender = Gender.male;
  int height = 180;
  int weight = 60;
  int age = 25;
  IconData boxIcon = FontAwesomeIcons.mars;
  String boxText = 'MALE';

  _getCountryList(BuildContext context, List inputList, String title) async {
    List tempList;
    tempList = await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                MultipleSelect(title: title, inputList: inputList)));
    //print('Person has travelled in following countries $tempList)');
    return tempList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Patient System'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        if (selectedGender == Gender.male) {
                          selectedGender = Gender.female;
                          boxIcon = FontAwesomeIcons.venus;
                          boxText = 'FEMALE';
                        } else {
                          selectedGender = Gender.male;
                          boxIcon = FontAwesomeIcons.mars;
                          boxText = 'MALE';
                        }
                      });
                    },
                    colour: kActiveCardColour,
                    cardChild: IconContent(
                      boxIcon: boxIcon,
                      boxText: boxText,
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: () async {
                      countriesTravelled = await _getCountryList(
                          context, countryList, 'Country travelled');
                    },
                    colour: kActiveCardColour,
                    cardChild: IconContent(
                      boxIcon: FontAwesomeIcons.globe,
                      boxText: 'Country travelled',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    onPress: () async {
                      symptoms = await _getCountryList(
                          context, symptomList, 'Symptoms');
                    },
                    colour: kActiveCardColour,
                    cardChild: IconContent(
                      boxIcon: FontAwesomeIcons.stethoscope,
                      boxText: 'Symptoms',
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: () async {
                      medicalHistory = await _getCountryList(
                          context, medicalHistoryList, 'Medical History');
                    },
                    colour: kActiveCardColour,
                    cardChild: IconContent(
                      boxIcon: FontAwesomeIcons.fileMedical,
                      boxText: 'Medical History',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    colour: kContainerColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Weight',
                          style: kBoxTextStyle,
                        ),
                        Text(weight.toString(), style: kNumberTextStyle),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              onPressed: () {
                                setState(() {
                                  weight += 1;
                                });
                              },
                              child: FontAwesomeIcons.plus,
//                              backgroundColor: Color(0xFF4C4F5E),
                            ),
                            SizedBox(
                              width: 5.0,
                            ),
                            RoundIconButton(
                              onPressed: () {
                                setState(() {
                                  weight -= 1;
                                });
                              },
                              child: FontAwesomeIcons.minus,
//                              child: Icon(
//                                Icons.remove,
//                                color: Colors.white,
//                              ),
//                              backgroundColor: Color(0xFF4C4F5E),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: kContainerColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Age',
                          style: kBoxTextStyle,
                        ),
                        Text(age.toString(), style: kNumberTextStyle),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              onPressed: () {
                                setState(() {
                                  age += 1;
                                });
                              },
                              child: FontAwesomeIcons.plus,
//                              backgroundColor: Color(0xFF4C4F5E),
                            ),
                            SizedBox(
                              width: 5.0,
                            ),
                            RoundIconButton(
                              onPressed: () {
                                setState(() {
                                  age -= 1;
                                });
                              },
                              child: FontAwesomeIcons.minus,
//                              child: Icon(
//                                Icons.remove,
//                                color: Colors.white,
//                              ),
//                              backgroundColor: Color(0xFF4C4F5E),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              colour: kActiveCardColour,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Height',
                    style: kBoxTextStyle,
                  ),
                  Row(
                    textBaseline: TextBaseline.alphabetic,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        height.toString(),
                        style: kNumberTextStyle,
                      ),
                      Text('cm', style: kBoxTextStyle)
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 12.0),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 24.0),
                        thumbColor: Color(0xFFEB1555),
                        activeTrackColor: Colors.white,
                        inactiveTrackColor: Color(0xFF8D8E98),
                        overlayColor: Color(0x29EB1555)),
                    child: Slider(
                      value: height.toDouble(),
                      min: 80,
                      max: 220,
                      //activeColor: Color(0xFFEB1555),
                      //inactiveColor: Color(0xFF8D8E98),
                      onChanged: (value) {
                        setState(() {
                          height = value.round();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          BottomButton(
            onTap: () {
              CalculatorBrain calc =
                  CalculatorBrain(weight: weight, height: height);
              calc.calculateBMI();

              if (countriesTravelled.isEmpty ||
                  symptoms.isEmpty ||
                  medicalHistory.isEmpty) {
                Alert(
                  context: context,
                  title: "Not Yet",
                  desc:
                      "You have not entered all the details. Symptoms, medical or travel history is yet to be selected",
                  buttons: [
                    DialogButton(
                      child: Text(
                        "Go Back",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      onPressed: () => Navigator.pop(context),
                      width: 120,
                    )
                  ],
                ).show();
              } else {
                Patient newPatient = Patient(
                    age: age,
                    gender: selectedGender,
                    weight: weight,
                    height: height,
                    countriesTravelled: countriesTravelled,
                    symptoms: symptoms,
                    medicalHistory: medicalHistory);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TileApp(
                              newPatient: newPatient,
                            )));
              }
            },
            title: 'Finalize',
          )
        ],
      ),
    );
  }
}

//selectedGender = Gender.female;
//FloatingActionButton(
//child: Icon(Icons.add),
//onPressed: () {
//_getCountryList(context);
//},
//),
