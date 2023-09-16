import 'package:flutter/material.dart';
import 'constants.dart';
import 'input_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ReusableCard extends StatelessWidget {
  ReusableCard(this.colour, this.cardChild);

  final Color colour;
  final Widget cardChild;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10.0),
      margin: kcardMargin,
      decoration: BoxDecoration(
        color: colour,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: cardChild,
    );
  }
}

class AgeWeightCard extends StatelessWidget {
  final int ageWeight;
  final String label;
  final VoidCallback onPressMinus;
  final VoidCallback onPressPlus;

  const AgeWeightCard({Key? key, required this.ageWeight, required this.label, required this.onPressMinus, required this.onPressPlus}) : super(key: key);

  

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: ReusableCard(
        kactiveCardColor,
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              label,
              style: klabelTextStyle,
            ),
            Text(
              ageWeight.toString(),
              style: kcalculatorTextstyle,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                MyButton(
                  onPressed: onPressMinus,
                  icon: FontAwesomeIcons.minus,
                ),
                const SizedBox(
                  width: 20.0,
                ),
                MyButton(
                  onPressed: onPressPlus,
                  icon: FontAwesomeIcons.plus,
                ),
              ],
            ),
          ],
        ), // child male
      ),
    );
  }
}

class ContainerCard extends StatelessWidget {
  final VoidCallback ontap;
  final String containerLabel;

  const ContainerCard({Key? key, required this.ontap, required this.containerLabel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        color: const Color(0xFFEB1555),
        margin: const EdgeInsets.only(top: 10.0),
        width: double.infinity,
        child: Center(
          child: Text(
            containerLabel,
            style: const TextStyle(
              fontSize: 23.0,
            ),
          ),
        ),
        height: 60.0,
      ),
    );
  }
}
