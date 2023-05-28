import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../AllText.dart';
import '../Themes.dart';
import '../main.dart';
import 'resuable.dart';
import 'icon-content.dart';
import 'constants.dart';
import 'result_page.dart';
import 'bottom_button.dart';
import 'round_custom_icon.dart';
import 'calculator_function.dart';

enum Gender {
  BOY,
  GIRL,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColor = kHexColor;
  Color femaleCardColor = kHexColor;

  Gender tappedGender;
  int height = 180;
  int weight = 51;
  int age = 13;

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
        children: <Widget>[

          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableContainer(
                    onTap: () {
                      setState(() {
                        tappedGender = Gender.BOY;
                      });
                    },
                    rang:
                        tappedGender == Gender.BOY ? ORANGE : kInactiveColor,
                    cardChild: IconContent(
                      babal: FontAwesomeIcons.mars,
                      text: "BOY",
                    ),
                  ),
                ),
                Expanded(
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: ReusableContainer(
                          onTap: () {
                            setState(() {
                              tappedGender = Gender.GIRL;
                            });
                          },
                          rang: tappedGender == Gender.GIRL
                              ? ORANGE
                              : kInactiveColor,
                          cardChild: IconContent(
                            babal: FontAwesomeIcons.venus,
                            text: "GIRL",
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableContainer(
              rang: kHexColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Center(
                    child: Text(
                      "Height",
                      style: kTextStyle,
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        height.toString(),
                        style: kHeavyStyle,
                      ),
                      Text(
                        'cm',
                        style: kTextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: Color(0xff8d8e98),
                      thumbColor: ORANGE,
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 35),
                      overlayColor: Color.fromRGBO(247, 131, 84, 1).withOpacity(0.5),
                      thumbShape: RoundSliderThumbShape(
                        enabledThumbRadius: 17,
                      ),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 20,
                      max: 500,
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableContainer(
                    rang: kHexColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "WEIGHT",
                          style: kTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kHeavyStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundCustomIcon(
                              plusminus: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                            SizedBox(
                              width: 12,
                            ),
                            RoundCustomIcon(
                              plusminus: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableContainer(
                    rang: kHexColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "AGE",
                          style: kTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kHeavyStyle,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundCustomIcon(
                              plusminus: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                            SizedBox(
                              width: 12,
                            ),
                            RoundCustomIcon(
                              plusminus: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            buttonTitle: 'CALCULATE',
            onPress: () {
              CalculatorFunction calculator = CalculatorFunction(
                height: height,
                weight: weight,
              );

              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ResultPage(
                            bmiResult: calculator.calculateBMI(),
                            bmiNormal: calculator.getNormal(),
                            bmiDescription: calculator.getDescription(),
                          )));
            },
          )
        ],
      ),
    );
  }
}
