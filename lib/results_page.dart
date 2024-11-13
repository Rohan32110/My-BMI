import 'package:bmi/constants.dart';
import 'package:flutter/material.dart';
import 'icon_card.dart';

class ResultsPage extends StatelessWidget {
  const ResultsPage(
      {super.key,
      required this.bmiResult,
      required this.resultInfo,
      required this.resultWord});

  final String bmiResult;
  final String resultWord;
  final String resultInfo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BMI Calculator"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Expanded(
            child: Center(
              child: Text(
                "Your Result",
                style: kTitleTextStyle,
              ),
            ),
          ),
          Expanded(
            flex: 7,
            child: ReusableCard(
              colour: const Color(0xFF1C1D2D),
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    resultWord,
                    style: kResultTextStyle,
                  ),
                  Text(
                    bmiResult,
                    style: kBMItextStyle,
                  ),
                  const Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text("Normal BMI range:", style: kCardTextStyle),
                      Text("18.5 to 24.9 kg/m²", style: kInfoTextStyle),
                    ],
                  ),
                  Text(
                    resultInfo,
                    textAlign: TextAlign.center,
                    style: kInfoTextStyle,
                  )
                ],
              ),
            ),
          ),
          BottomButton(
            buttonText: "RE-CALCULATE",
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
