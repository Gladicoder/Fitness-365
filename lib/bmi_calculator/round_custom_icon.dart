import 'package:flutter/material.dart';

class RoundCustomIcon extends StatelessWidget {
  RoundCustomIcon({@required this.plusminus, @required this.onPressed});

  final IconData plusminus;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(plusminus),
      onPressed: onPressed,
      elevation: 12,
      shape: CircleBorder(),
      fillColor: Color(0xff4c4f5e),
      constraints: BoxConstraints.tightFor(
        width: 49.0,
        height: 49.0,
      ),
    );
  }
}
