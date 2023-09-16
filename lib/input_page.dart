import 'package:bmi_calculator/result_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'reusable_card.dart';
import 'constants.dart';
import 'calculator_Brain.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  int height = 180;
  int age = 19;
  int weight = 60;

  Color maleCardColour = kinactiveCardColor;
  Color femaleCardColour = kinactiveCardColor;
  Color calculatorCardColour = kinactiveCardColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('BMI CALCULATOR'),
        ),
      ),
      body: Column(
        children: <Widget>[
          // row 1:-->
          Expanded(
            flex: 1,
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        maleCardColour = maleCardColour == kinactiveCardColor
                            ? kactiveCardColor
                            : kinactiveCardColor;
                        femaleCardColour = kinactiveCardColor;
                      });
                    },
                    child: ReusableCard(
                      maleCardColour,
                      IconContent(
                        FontAwesomeIcons.mars,
                        'MALE',
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        femaleCardColour =
                            femaleCardColour == kinactiveCardColor
                                ? kactiveCardColor
                                : kinactiveCardColor;
                        maleCardColour = kinactiveCardColor;
                      });
                    },
                    child: ReusableCard(
                      femaleCardColour,
                      IconContent(
                        FontAwesomeIcons.venus,
                        'FEMALE',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ), // row 1

          // row 2--->
          Expanded(
            flex: 1,
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: ReusableCard(
                    kactiveCardColor,
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'HEIGHT',
                          style: klabelTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: <Widget>[
                            /* height count*/ Text(
                              height.toString(),
                              style: kcalculatorTextstyle,
                            ),
                            /* height unit(cm)*/ Text(
                              'cm',
                              style: klabelTextStyle,
                            ),
                          ],
                        ),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            thumbShape:
                                RoundSliderThumbShape(enabledThumbRadius: 10.0),
                          ),
                          child: Slider(
                            value: height.toDouble(),
                            min: 30.0,
                            max: 300,
                            activeColor: Color(0xFFEB1555),
                            inactiveColor: Color(0xFF8D8E98),
                            onChanged: (double newValue) {
                              setState(() {
                                height = newValue.round();
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ), // row 2
          // row 3--->
          Expanded(
            flex: 1,
            child: Row(
              children: <Widget>[
                AgeWeightCard(
                  ageWeight: weight,
                  label: 'WEIGHT (Kg)',
                  onPressPlus: () {
                    setState(() {
                      weight++;
                    });
                  },
                  onPressMinus: () {
                    setState(() {
                      weight--;
                    });
                  },
                ),
                AgeWeightCard(
                  ageWeight: age,
                  label: 'AGE',
                  onPressPlus: () {
                    setState(() {
                      age++;
                    });
                  },
                  onPressMinus: () {
                    setState(() {
                      age--;
                    });
                  },
                ),
              ],
            ),
          ), // row 3

          ContainerCard(
            ontap: () {
              CalculatorBrain calc =
                  CalculatorBrain(height: height, weight: weight);

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultPage(
                    bmiResult: calc.calculateBMI(),
                    resultText: calc.getResult(),
                    interpretation: calc.getInterpretation(),
                  ),
                ),
              );
            },
            containerLabel: 'CALCULATE BMI',
          ),
        ],
      ),
    );
  }
}

class MyButton extends StatelessWidget {
  MyButton({required this.icon, required this.onPressed});
  final IconData icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      child: Icon(icon),
      shape: CircleBorder(),
      fillColor: Color(0xFF272A4E),
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      elevation: 6.0,
    );
  }
}
