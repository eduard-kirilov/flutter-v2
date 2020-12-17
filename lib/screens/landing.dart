import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter1/domain/userFit.dart';
import 'package:flutter1/screens/auth.dart';
import 'package:provider/provider.dart';

import 'home.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final fireBaseUser = context != null ? context.watch<UserFit>() : null;
    return fireBaseUser != null ? HomePage() : AuthorizationPage();
  }
}
