import 'package:flutter/material.dart';
// import 'package:scb_hackathon/utils/constants.dart';

Widget addVerticalSpace(double height){
  return SizedBox(
    height:height
  );
}

Widget addHorizontalSpace(double width){
  return SizedBox(
      width:width
  );
}

Widget addDetailField(String header, String value, double padding, ThemeData themeData){
  return Padding(
            padding: EdgeInsets.symmetric(horizontal: padding),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(header, style: themeData.textTheme.bodyText2,),
                addVerticalSpace(2),
                Text(value, style: themeData.textTheme.headline3,),
              ],
            )
          );
}