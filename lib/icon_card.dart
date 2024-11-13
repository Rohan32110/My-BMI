import 'package:flutter/material.dart';
import 'constants.dart';

class ReusableCard extends StatelessWidget {
  ReusableCard({required this.colour, this.cardChild, this.onPress});

  final Color colour;
  final Widget? cardChild;
  final onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPress();
      },
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
            color: colour, borderRadius: BorderRadius.circular(10.0)),
      ),
    );
  }
}

class cardDesign extends StatelessWidget {
  cardDesign({this.icon, this.text});

  final icon;
  final text;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, size: 85.0),
        SizedBox(
          height: 10.0,
        ),
        Text(
          text,
          style: kCardTextStyle,
        )
      ],
    );
  }
}

class RoundIconButton extends StatelessWidget {
  RoundIconButton({required this.icons, required this.onPress});

  final IconData icons;
  final onPress;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 0.9,
      constraints: const BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      shape: CircleBorder(),
      fillColor: Color(0xFF24253A),
      child: Icon(icons),
      onPressed: onPress,
    );
  }
}

class BottomButton extends StatelessWidget {
  BottomButton({required this.buttonText, this.onTap});

  final String buttonText;
  final onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        child: Text(
          buttonText,
          style: kLargeButTextStyle,
        ),
        color: kBtmContColour,
        width: double.infinity,
        height: kBottomContHeight,
        margin: EdgeInsets.only(top: 05.0),
      ),
    );
  }
}
