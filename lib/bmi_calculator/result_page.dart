
import 'package:flutter/material.dart';
import '../Themes.dart';
import '../main.dart';
import 'constants.dart';
import 'resuable.dart';
import 'bottom_button.dart';

class ResultPage extends StatelessWidget {
  ResultPage(
      {@required this.bmiResult,
      @required this.bmiNormal,
      @required this.bmiDescription});

  final String bmiResult;
  final String bmiNormal;
  final String bmiDescription;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.arrow_back_ios,color:DARK_BLUE)),
        elevation: 0,
        titleSpacing: 0.0,
        title:customTextWidget.boldText(text: "BMI Calculator",size: 25,color: DARK_BLUE),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(12),
              child: Text(
                'Your Result',
                style: kResultPageTitle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableContainer(
              rang: kHexColor,
              cardChild: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    bmiNormal.toUpperCase(),
                    style: kNormalTextStyle,
                  ),
                  Text(
                    bmiResult,
                    style: kNumberResultStyle,
                  ),
                  Text(
                    bmiDescription,
                    style: kDescriptionResultStyle,
                  ),
                ],
              ),
            ),
          ),
          BottomButton(
            onPress: () {
              Navigator.pop(context);
            },
            buttonTitle: 'RE-CALCULATE',
          ),
        ],
      ),
    );
  }
}
