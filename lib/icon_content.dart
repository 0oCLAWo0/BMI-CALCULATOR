import 'package:flutter/material.dart';
import 'constants.dart';

class IconContent extends StatelessWidget {
  IconContent(this.icon, this.label);

  final IconData icon;
  final String label; // Name for u-i

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: kicon_size,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          label,
          style: klabelTextStyle,
        ),
      ],
    );
  }
}
