import 'package:flutter/material.dart';
import 'package:scb_hackathon/custom/BorderBox.dart';
// import 'package:scb_hackathon/custom/OptionButton.dart';
// import 'package:scb_hackathon/sample_data.dart';
import 'package:scb_hackathon/utils/constants.dart';
import 'package:scb_hackathon/utils/widget_functions.dart';

class LandingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final ThemeData themeData = Theme.of(context);
    final double padding = 25;
    final sidePadding = EdgeInsets.symmetric(horizontal: padding);
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: size.width,
          height: size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              addVerticalSpace(padding),
              Padding(
                padding: sidePadding,
                child: 
                // Top icons
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BorderBox(
                      height: 50,
                      width: 50,
                      padding: null,
                      child: Icon(Icons.menu, color: COLOR_BLACK,),
                    ),
                    BorderBox(
                      height: 50,
                      width: 50,
                      padding: null,
                      child: Icon(Icons.settings, color: COLOR_BLACK,),
                    ),
                  ],
                ),
              ),

              // Details and profile pic
              Padding(
                padding: sidePadding,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Details
                        addVerticalSpace(padding),
                        addDetailField('Name:', "Kenobi, Obiwan", 0, themeData),
                        addVerticalSpace(padding),
                        addDetailField('Job Designation:', "Force User", 0, themeData),
                        addVerticalSpace(padding),
                        addDetailField('Department:', "Risk Functions T&I", 0, themeData),
                        addVerticalSpace(padding),
                        addDetailField('All Accessible Locations:', "CBP1-4, CBP1-5", 0, themeData),
                        addVerticalSpace(padding),
                      ],
                    ),
                    // profile pic
                    //   new Image.asset("images/obiwan_profile.jpg", width: 200, height: 200),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(30.0),
                        child: Image.network('https://i.ibb.co/6ybFMQs/obiwan-profile.jpg', width: 160, height:160,),
                        // child: Image.asset('images/obiwan_profile.jpg', width: 200, height:200,),
                    ),
                  ],
                ),
              ),
              
              // Divider
              Padding(
                padding: sidePadding,
                child: Divider(
                  height: padding,
                  color: COLOR_GREY,
                ),
              ),

              // QR image
              Row(
                mainAxisAlignment : MainAxisAlignment.center,
                // mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Align(
                    alignment: Alignment.topCenter,
                    child: new Image.network('https://i.ibb.co/N294xQz/obiwan-qrcode.png',
                                        fit: BoxFit.fitHeight, 
                                        width: 300,
                                        height: 300,),
                  )
                ],
              ),
            ],
      ),
    ),
   ),
    );
  }
}
