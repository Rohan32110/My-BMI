import 'package:bmi/results_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_card.dart';
import 'constants.dart';
import 'calculator_brain.dart';

enum GenderType {
  male,
  female,
}

enum measureType {
  plus,
  minus,
}

GenderType? selectedGender;

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  int height = 180;
  int weight = 60;
  int age = 30;

  Color maleCardColor = kInactiveCardColour;
  Color femaleCardColor = kInactiveCardColour;

  void measurement(measureType measure) {
    setState(() {
      measure == measureType.plus ? weight++ : weight--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(53.0), // Set AppBar height
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF1D2228),
                Color(0xFF4C5F72),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: AppBar(
            elevation: 11,
            title: const Text('BMI Calculator'),
            centerTitle: true,
            backgroundColor:
                Colors.transparent, // Ensure the AppBar itself is transparent
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = GenderType.male;
                      });
                    },
                    colour: (selectedGender == GenderType.male)
                        ? kActiveCardColour
                        : kInactiveCardColour,
                    cardChild: cardDesign(
                      icon: FontAwesomeIcons.mars,
                      text: "MALE",
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = GenderType.female;
                      });
                    },
                    colour: (selectedGender == GenderType.female)
                        ? kActiveCardColour
                        : kInactiveCardColour,
                    cardChild: cardDesign(
                      icon: FontAwesomeIcons.venus,
                      text: "FEMALE",
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
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const SizedBox(height: 2.5),
                  const Text("HEIGHT", style: kCardTextStyle),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: kCardNumberStyle,
                      ),
                      const Text(
                        "cm",
                        style: kCardTextStyle,
                      ),
                    ],
                  ),
                  //Inside where to show. make a default vlaue of height at state.

                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: const Color(0xFF8D8E98),
                      thumbColor: const Color(0xFFC91C50),
                      overlayColor: const Color(0x1FC91C50),
                      thumbShape:
                          const RoundSliderThumbShape(enabledThumbRadius: 15),
                      overlayShape:
                          const RoundSliderOverlayShape(overlayRadius: 30.0),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 122.0, //4ft
                      max: 213.0, //7ft
                      onChanged: (double newValue) {
                        setState(
                          () {
                            height = newValue.round();
                          },
                        );
                      },
                    ),
                  ),

                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 16.0),
                        child: Text(
                          "4ft",
                          style: kInfoTextStyle,
                        ),
                      ),
                      Text(
                        "5ft",
                        style: kInfoTextStyle,
                      ),
                      Text(
                        "6ft",
                        style: kInfoTextStyle,
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 16.0),
                        child: Text(
                          "7ft",
                          style: kInfoTextStyle,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 1.9),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    colour: kActiveCardColour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("WEIGHT", style: kCardTextStyle),
                        Text(weight.toString(), style: kCardNumberStyle),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                                icons: FontAwesomeIcons.minus,
                                onPress: () => measurement(measureType.minus)),
                            const SizedBox(width: 15.0),
                            RoundIconButton(
                                icons: FontAwesomeIcons.plus,
                                onPress: () => measurement(measureType.plus)),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: kActiveCardColour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("AGE", style: kCardTextStyle),
                        Text(age.toString(), style: kCardNumberStyle),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icons: FontAwesomeIcons.minus,
                              onPress: () {
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                            const SizedBox(width: 15.0),
                            RoundIconButton(
                                icons: FontAwesomeIcons.plus,
                                onPress: () {
                                  setState(() {
                                    age++;
                                  });
                                }),
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
            buttonText: "CALCULATE",
            onTap: () {
              CalculatorBrain calc =
                  CalculatorBrain(height: height, weight: weight);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultsPage(
                    bmiResult: calc.calculateBMI(),
                    resultWord: calc.getResult(),
                    resultInfo: calc.getInterpretation(),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
