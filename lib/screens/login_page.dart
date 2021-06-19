import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:untitled/screens/utils/routes/Myroutes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool changeButton = false;
  final _formKey = GlobalKey<FormState>();

  moveToHome(BuildContext context) async {
    if(_formKey.currentState!.validate()) {
      setState(() {
        changeButton = true;
      });
      await Future.delayed(Duration(seconds: 1));
      await Navigator.pushNamed(context, MyRoutes.homeRoute);
      setState(() {
        changeButton = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Column(
        children: [
          Image.asset(
            "assets/images/login_image.png",
            fit: BoxFit.cover,
          ),
          Text(
            'Welcome',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 32),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "Enter UserName",
                      labelText: "username",
                    ),
                    validator: (value){
                      if(value!.isEmpty){
                        return "Username should not be Empty";
                      }
                      return null;
                    }
                    ,
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: "Enter Password",
                      labelText: "Password",
                    ),
                    validator: (value){
                      if(value!.isEmpty){
                        return "Password is Required";
                      }else if(value.length<8){
                        return "Password should be greater then 8 ";
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Material(
                    color: Colors.deepPurple,
                    borderRadius:
                    BorderRadius.circular(changeButton ? 50 : 10),
                    child: InkWell(
                      onTap: () {
                        moveToHome(context);

                      },
                      child: AnimatedContainer(
                        height: 50,
                        width: changeButton ? 50 : 150,
                        alignment: Alignment.center,
                        child: changeButton
                            ? Icon(Icons.done,color: Colors.white,)
                            : Text(
                                'Login',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                        // decoration: BoxDecoration(
                        //   color: Colors.purple,
                          // shape:
                          //     changeButton ? BoxShape.circle : BoxShape.rectangle,

                        //),
                        duration: Duration(seconds: 1),
                      ),
                    ),
                  ),
                  // ElevatedButton(
                  //   onPressed: () {
                  //    Navigator.pushNamed(context, MyRoutes.homeRoute);
                  //   },
                  //   child: Text('Login'),
                  //   style: TextButton.styleFrom(minimumSize: Size(150,30)),
                  // )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
