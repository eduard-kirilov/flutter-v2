import 'package:flutter/material.dart';
import 'package:flutter1/screens/auth.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Max Fitness',
        theme: ThemeData(
            primaryColor: Color.fromRGBO(50, 65, 85, 1),
            textTheme: TextTheme(headline1: TextStyle(color: Colors.white))),
        home: AuthorizationPage());
  }
}
