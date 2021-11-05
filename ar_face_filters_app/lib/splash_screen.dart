import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

import 'cmaera_with_mask_filters_screen.dart';

class MySplashScreen extends StatefulWidget {
  @override
  _MySplashScreenState createState() => _MySplashScreenState();
}

class _MySplashScreenState extends State<MySplashScreen> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 10,
      navigateAfterSeconds: CameraWithMaskFiltersScreen(),
      title: Text(
        "AR Face Filters App",
        style: TextStyle(
          fontSize: 55,
          color: Colors.deepPurpleAccent,
          fontFamily: "Signatra",
        ),
      ),
      image: Image.asset("images/icon.png"),
      backgroundColor: Colors.white,
      photoSize: 140,
      loaderColor: Colors.deepPurple,
      loadingText: Text(
        "from Ajay Raikar",
        style: TextStyle(
          color: Colors.deepPurpleAccent,
          fontSize: 16.0,
          fontFamily: "Brand Band",
        ),
      ),
    );
  }
}
