import 'package:flutter/material.dart';
import '../data/constants.dart';

class IconContent extends StatelessWidget {
  final IconData boxIcon;
  final String boxText;

  const IconContent({@required this.boxIcon, @required this.boxText});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          boxIcon,
          size: kIconSize,
        ),
        SizedBox(
          height: kBoxSpacing,
        ),
        Text(
          boxText,
          style: TextStyle(
            fontSize: kBoxFontSize,
          ),
        )
      ],
    );
  }
}
