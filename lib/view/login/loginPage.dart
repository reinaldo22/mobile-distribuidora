import 'package:distribuidora/view/signup/signup.dart';
import 'package:flutter/material.dart';

import '../../utils/contants.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: fundo,
      body: _body(context),
    );
  }

  _body(BuildContext context) {
    return SafeArea(
      child: ListView(
        children: [
          Padding(
            padding: EdgeInsets.all(50.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(children: [
                  Center(
                    child: SizedBox(
                      height: 150.0,
                      width: 150.0,
                      child: Container(
                        child: Image.asset('asset/images/login.png'),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Column(
                    children: [
                      TextField(
                        decoration: InputDecoration(
                          labelText: "Email",
                          border: OutlineInputBorder(),
                        ),
                        keyboardType: TextInputType.emailAddress,
                      ),
                      SizedBox(
                        height: 40.0,
                      ),
                      TextField(
                        autofocus: false,
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: "Password",
                          border: OutlineInputBorder(),
                        ),
                        keyboardType: TextInputType.visiblePassword,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Signup()),
                              );
                            },
                            child: Text(
                              "Cadastre-se",
                              style: TextStyle(color: kPrimaryColor),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 40.0,
                      ),
                      SizedBox(
                        height: 50.0,
                        width: 350,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text("Entre"),
                          style: ElevatedButton.styleFrom(
                            primary: Kbutton,
                          ),
                        ),
                      ),
                    ],
                  )
                ])
              ],
            ),
          )
        ],
      ),
    );
  }
}
