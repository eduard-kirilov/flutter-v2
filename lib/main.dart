import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter1/screens/landing.dart';
import 'package:flutter1/services/auth.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthServise>(
            create: (_) => AuthServise(FirebaseAuth.instance)),
        StreamProvider(
            create: (context) => context.read<AuthServise>().currentUser)
      ],
      child: MaterialApp(
          title: 'Max Fitness',
          theme: ThemeData(
              primaryColor: Color.fromRGBO(50, 65, 85, 1),
              textTheme: TextTheme(headline1: TextStyle(color: Colors.white))),
          home: LandingPage()),
    );
  }
}
