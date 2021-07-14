import 'package:flutter/material.dart';
import 'package:scb_hackathon/custom/BorderBox.dart';
import 'package:scb_hackathon/utils/constants.dart';
import 'package:scb_hackathon/utils/widget_functions.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final ThemeData themeData = Theme.of(context);
    final double padding = 25;
    final sidePadding = EdgeInsets.symmetric(horizontal: padding);

    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                  "https://i.ibb.co/Kh7YYVy/scb-building-4.jpg"), // <-- BACKGROUND IMAGE
              fit: BoxFit.cover,
              colorFilter: new ColorFilter.mode(
                  Colors.black.withOpacity(0.4), BlendMode.dstATop),
            ),
          ),
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
                      child: Icon(
                        Icons.menu,
                        color: COLOR_BLACK,
                      ),
                    ),
                    BorderBox(
                      height: 50,
                      width: 50,
                      padding: null,
                      child: Icon(
                        Icons.settings,
                        color: COLOR_BLACK,
                      ),
                    ),
                  ],
                ),
              ),

              // Main Logo
              Center(
                heightFactor: 1,
                child: Text(
                  'Welcome to',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.paytoneOne(
                    textStyle: Theme.of(context).textTheme.headline4,
                    fontSize: 43,
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
              Center(
                heightFactor: 1,
                child: Text(
                  'iSCB',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.paytoneOne(
                    textStyle: Theme.of(context).textTheme.headline4,
                    fontSize: 48,
                    fontWeight: FontWeight.w700,
                    // fontStyle: FontStyle.italic,
                    color: Colors.green.shade600,
                  ),
                ),
              ),
              // Nav button
              Center(
                heightFactor: 1,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green.shade700,
                    onPrimary: Colors.white,
                    onSurface: Colors.green.shade700,
                  ),
                  child: Text(
                    'Enter',
                    textScaleFactor: 4,
                  ),
                  onPressed: () {
                    print('heres where we navigate');
                    // Navigate to second route when tapped.
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

