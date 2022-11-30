import 'package:flutter/material.dart';
import 'package:project_test/res/colors.dart';

class DateContainer extends StatelessWidget {
  const DateContainer({
    Key? key,
    required this.screenWidth,
    required this.date,
  }) : super(key: key);

  final double screenWidth;
  final String date;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: screenWidth * 0.02,
        right: screenWidth * 0.02,
        bottom: screenWidth * 0.05,
      ),
      width: double.infinity,
      color: primaryColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: screenWidth * 0.03),
            child: Text(
              'Date :',
              style: TextStyle(
                  fontSize: screenWidth * 0.03,
                  color: kBlack,
                  fontWeight: FontWeight.w400),
            ),
          ),
          SizedBox(
            height: screenWidth * 0.02,
          ),
          Padding(
            padding: EdgeInsets.only(left: screenWidth * 0.03),
            child: Text(
              date,
              style: TextStyle(
                  fontSize: screenWidth * 0.03,
                  color: kBlack,
                  fontWeight: FontWeight.w700),
            ),
          ),
          Container(
            color: kBlack,
            height: screenWidth * 0.002,
          )
        ],
      ),
    );
  }
}
