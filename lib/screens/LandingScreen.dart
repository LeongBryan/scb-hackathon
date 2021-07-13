import 'package:flutter/material.dart';
import 'package:scb_hackathon/custom/BorderBox.dart';
// import 'package:scb_hackathon/custom/OptionButton.dart';
// import 'package:scb_hackathon/sample_data.dart';
import 'package:scb_hackathon/utils/constants.dart';
import 'package:scb_hackathon/utils/widget_functions.dart';
import 'package:local_auth/local_auth.dart';
import 'dart:async';

String authStatus = 'Not Authenticated';
int _start = 10;

class LandingScreen extends StatefulWidget {
  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final ThemeData themeData = Theme.of(context);
    final double padding = 13;
    final sidePadding = EdgeInsets.symmetric(horizontal: padding);
    final LocalAuthentication _localAuthentication = LocalAuthentication();

    Timer _timer;
    void startTimer() {
      const oneSec = const Duration(seconds: 1);
      _timer = new Timer.periodic(
        oneSec,
        (Timer timer) {
          if (_start == 0) {
            setState(() {
              timer.cancel();
              authStatus = 'Not Authenticated';
            });
          } else {
            setState(() {
              _start--;
              print(_start);
            });
          }
        },
      );
    }

    Future<bool> checkingForBioMetrics() async {
      bool canCheckBiometrics = await _localAuthentication.canCheckBiometrics;
      print(canCheckBiometrics);
      return canCheckBiometrics;
    }

    Future<void> _authenticateMe() async {
      bool authenticated = false;
      try {
        authenticated = await _localAuthentication.authenticateWithBiometrics(
          localizedReason: "Authenticate for Testing",
          useErrorDialogs: true,
          stickyAuth: true,
        );
        setState(() {
          authStatus = authenticated ? "Authenticated" : "Not Authenticated";
          print(authStatus);
          if (authenticated == true) {
            _start = 10;
            startTimer();
          }
        });
      } catch (e) {
        print(e);
      }
      if (!mounted) return;
    }

    List<Widget> getQr() {
      print('authStatus: ' + authStatus);

      if (authStatus == "Authenticated") {
        return <Widget>[
          new Image.network(
            'https://i.ibb.co/N294xQz/obiwan-qrcode.png',
            fit: BoxFit.fitHeight,
            width: 300,
            height: 300,
          ),
          Text('QR is valid for : ' + _start.toString()),
        ];
      } else {
        return <Widget>[
          addVerticalSpace(padding * 13),
          IconButton(
            constraints: BoxConstraints(
              minHeight: 100,
              minWidth: 100,
            ),
            onPressed: _authenticateMe,
            icon: Icon(
              Icons.fingerprint_outlined,
              size: 85,
            ),
            splashColor: Color.fromRGBO(10, 190, 10, 1.0),
            splashRadius: 48,
          ),
          Text('Scan Fingerprint to Authenticate'),
        ];
      }
    }

    @override
    void initState() {
      checkingForBioMetrics();
      super.initState();
    }

    // Begin Actual components
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                  "https://i.ibb.co/K7JwCY2/scb-logo.png"), // <-- BACKGROUND IMAGE
              fit: BoxFit.cover,
              colorFilter: new ColorFilter.mode(
                  Colors.black.withOpacity(0.1), BlendMode.dstATop),
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

              // Details and profile pic
              Padding(
                padding: sidePadding,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Details
                        addVerticalSpace(padding),
                        addDetailField('Name:', "Kenobi, Obiwan", 0, themeData),
                        addVerticalSpace(padding),
                        addDetailField('PSID:', "1626151", 0, themeData),
                        addVerticalSpace(padding),
                        addDetailField(
                            'Job Designation:', "Force User", 0, themeData),
                        addVerticalSpace(padding),
                        addDetailField(
                            'Department:', "Risk Functions T&I", 0, themeData),
                        addVerticalSpace(padding),
                        addDetailField('All Accessible Locations:',
                            "CBP1-4, CBP1-5", 0, themeData),
                        addVerticalSpace(padding),
                      ],
                    ),
                    // profile pic
                    ClipRRect(
                      borderRadius: BorderRadius.circular(30.0),
                      child: Image.network(
                        'https://i.ibb.co/6ybFMQs/obiwan-profile.jpg',
                        width: 170,
                        height: 180,
                      ),
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
              Center(
                  child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: getQr())),
            ],
          ),
        ),
      ),
    );
  }
}
