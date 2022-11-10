import 'package:NewsApp/main.dart';
import 'package:NewsApp/reusable_widgets/reusabe_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import './home_screen.dart';
import './signup_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreen();
}

class _SignInScreen extends State<SignInScreen> {
  TextEditingController _emailTextcontroller = TextEditingController();
  TextEditingController _passwordTextcontroller = TextEditingController();
  bool isvalidemail = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('SocialX'),
          backgroundColor: Colors.red,
        ),
        body: Column(
          children: [
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.7,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      offset: const Offset(
                        5.0,
                        5.0,
                      ),
                      blurRadius: 10.0,
                      spreadRadius: 2.0,
                    ), //BoxShadow
                    BoxShadow(
                      color: Colors.white,
                      offset: const Offset(0.0, 0.0),
                      blurRadius: 0.0,
                      spreadRadius: 0.0,
                    ), //BoxShadow
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(40),
                  //border: Border.all(width:1)
                ),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(
                        20, MediaQuery.of(context).size.height * 0.1, 20, 0),
                    child: Column(
                      children: <Widget>[
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Sign in to your account',
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.start,
                            )),
                        const SizedBox(
                          height: 30,
                        ),
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Email',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.start,
                            )),
                        ReusableTextField("johndoe@gmail.com", Icons.person_outline,
                            false, _emailTextcontroller),
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              isvalidemail?'':'*invalid email password',
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.start,
                            )),
                        const SizedBox(
                          height: 20,
                        ),
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Password',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.start,
                            )),
                        ReusableTextField("Password", Icons.lock_outline,
                            true, _passwordTextcontroller),

                         InkWell(
                          onTap: (){},
                           child: Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                'Forgot Password?',
                                style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.start,
                              )),
                         ),
                        const SizedBox(
                          height: 20,
                        ),
                        
                        signUpoption(),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                                'Login with',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.start,
                              ),
                      const SizedBox(
                          height: 10,
                        ),
               
                  
                     
                      
                      Center(
                        child: SignInButton(
                          Buttons.Google, onPressed: (){},),
                      ),
                    Center(
                        child: SignInButton(
                          Buttons.Facebook, onPressed: (){},),
                      )
                
                

                      ],
                    ),
                  ),
                ),
              ),
            ),

            signInsignUpButton(context, Colors.red,true, () {
                          if (_emailTextcontroller.toString().contains('@')) {
                            setState(() {
                              isvalidemail = true;
                            });
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomePage()));
                          } 
                          else {
                            setState(() {
                              isvalidemail = false;
                            });
                            
                          }
                        }),
          ],
        ));
  }

  Row signUpoption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Don't have an account?",
          style: TextStyle(color: Colors.black),
        ),
        GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SignUpScreen()));
            },
            child: const Text(
              "Register now",
              style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ))
      ],
    );
  }
}
