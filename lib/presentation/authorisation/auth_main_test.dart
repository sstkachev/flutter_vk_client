import 'package:flutter/material.dart';

import '../../core/locator.dart';
import 'auth_screen.dart';

void main() {
  runApp(
    FutureBuilder(
      future: setupLocator(),
      builder: (context, snapshot) {
        return const AuthScreenTest();
      },
    ),
  );
}

class AuthScreenTest extends StatelessWidget {
  const AuthScreenTest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bottom Bar',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: const AuthScreen(),
    );
  }
}
