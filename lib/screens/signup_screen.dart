import 'package:NewsApp/main.dart';
import 'package:NewsApp/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:NewsApp/reusable_widgets/reusabe_widgets.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({Key key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreen();
}

class _SignUpScreen extends State<SignUpScreen> {
  TextEditingController _emailTextcontroller = TextEditingController();
  TextEditingController _passwordTextcontroller = TextEditingController();
  TextEditingController _userNameTextcontroller = TextEditingController();
  bool ischecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.red,
        elevation: 0,
        title: const Text(
          "SIGN UP",
          style: TextStyle(
              color: Colors.black87, fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          color: Colors.white10,
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
                20, MediaQuery.of(context).size.height * 0.2, 20, 0),
            child: Column(
              children: <Widget>[
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Create an account',
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
                      'Username',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.start,
                    )),
                ReusableTextField("Username", Icons.person_outline, false,
                    _userNameTextcontroller),
                const SizedBox(
                  height: 20,
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
                const SizedBox(
                  height: 20,
                ),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Contact No',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.start,
                    )),
                InternationalPhoneNumberInput(
                  onInputChanged: (value) {},
                  hintText: '9876543210',
                ),
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
                ReusableTextField("********", Icons.lock_outline, true,
                    _passwordTextcontroller),
                const SizedBox(
                  height: 5,
                ),
                
                    Row(
                      children: [
                        Checkbox(
                    checkColor: Color.fromARGB(96, 251, 0, 0),
                    
                    value: ischecked,
                    onChanged: (bool value) {
                      setState(() {
                        ischecked = !value;
                      });
                    }),
                        Text("I agree with ",style: TextStyle(color: Colors.black, ),),
                        Text(" terms and conditions",style: TextStyle(color: Colors.red, ),),
                      ],
                    ),
                const SizedBox(
                  height: 20,
                ),
                signInsignUpButton(context, Colors.red, false, () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomePage()));
                  //   FirebaseAuth.instance
                  //     .createUserWithEmailAndPassword(
                  //         email: _emailTextcontroller.text,
                  //         password: _passwordTextcontroller.text)
                  //     .then((value) {
                  //    Navigator.push(
                  //       context,
                  //       MaterialPageRoute(
                  //           builder: (context) => HomePageScreen()));
                  // }).onError((error, stackTrace) {
                  //   print("Error ${error.toString()}");
                  // });
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
