import 'package:flutter/material.dart';
import '../Themes.dart';
import 'constants.dart';

class BottomButton extends StatelessWidget {
  BottomButton({@required this.onPress, @required this.buttonTitle});

  final onPress;
  final String buttonTitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: Center(
          child: Text(
            buttonTitle,
            style: kContainerTextStyle,
          ),
        ),
        color: ORANGE,
        padding: EdgeInsets.only(bottom: 25),
        margin: EdgeInsets.only(top: 11),
        width: double.infinity,
        height: kBottomButtonHeight,
      ),
    );
  }
}
