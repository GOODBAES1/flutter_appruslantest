import 'package:flutter/material.dart';
import 'package:flutter_appruslantest/screens/auth/sing_in.dart';
import 'register.dart';
class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showSignIn = true;
  void toggleView(){
    setState(()=>showSignIn = !showSignIn);
  }
  @override
  Widget build(BuildContext context) {
    if (showSignIn){
    return SingIn(toggleView: toggleView);
    }else{
    return Register(toggleView: toggleView);
    }
  }
}


