import 'package:flutter/material.dart';
import 'constants.dart';

class IconContent extends StatelessWidget {
  IconContent({@required this.babal, this.text});

  final IconData babal;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          babal,
          size: 89,
          color: Colors.white,
        ),
        SizedBox(
          height: 17,
        ),
        Text(
          text,
          style: kDescriptionResultStyle,
        ),
      ],
    );
  }
}
