import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/reusable_card.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  final String bmiResult;
  final String resultText;
  final String interpretation;

  const ResultPage({Key? key, required this.bmiResult, required this.resultText, required this.interpretation}) : super(key: key);

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
          Container(
            padding: EdgeInsets.fromLTRB(10.0, 20.0, 0.0, 0.0),
            alignment: Alignment.bottomLeft,
            child: Text(
              'Your Result',
              style: TextStyle(
                fontSize: 40.0,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Expanded(
            child: ReusableCard(
              Color(0xFF101427),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    resultText,
                    style: TextStyle(
                      color: Color(0xFF00c853),
                      fontWeight: FontWeight.w900,
                      letterSpacing: 1.0,
                    ),
                  ),
                  Text(
                    bmiResult,
                    style: kcalculatorTextstyle,
                  ),
                  Text(
                    interpretation,
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
          ContainerCard(
            ontap: () {
              Navigator.pop(context);
            },
            containerLabel: 'RE-CALCULATE',
          ),
        ],
      ),
    );
  }
}
