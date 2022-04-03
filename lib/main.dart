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
        primaryColor: Color.fromARGB(255, 4, 125, 141),
        appBarTheme: const AppBarTheme(
          elevation: 0,
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textSelectionTheme: TextSelectionThemeData(cursorColor: KtextField),
      ),
      home: const LoginPage(),
    );
  }
}
