import 'package:cryptospace_app/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const CryptoSpace());
}

class CryptoSpace extends StatelessWidget {
  const CryptoSpace({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      routes: {
        HomeScreen.id: (context) => HomeScreen(),
      },
      initialRoute: HomeScreen.id,
    );
  }
}
