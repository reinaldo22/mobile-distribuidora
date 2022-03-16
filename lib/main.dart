import 'package:distribuidora/utils/contants.dart';
import 'package:distribuidora/view/login/loginPage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: TextButton.styleFrom(
            backgroundColor: Colors.red[900],
          ),
        ),
        textSelectionTheme:
            TextSelectionThemeData(cursorColor: Colors.redAccent),
      ),
      home: const LoginPage(),
    );
  }
}
