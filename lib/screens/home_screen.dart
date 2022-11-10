import 'package:NewsApp/screens/signin_screen.dart';
import 'package:flutter/material.dart';


class HomePageScreen extends StatefulWidget {
  HomePageScreen({Key key}) : super(key: key);

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: ElevatedButton(
        child: Text("Logout"),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => SignInScreen()));
        },
      )),
    );
  }
}
