import 'package:flutter/material.dart';
import 'package:flutter_appruslantest/screens/auth/register.dart';
import 'package:flutter_appruslantest/screens/auth/sing_in.dart';
import 'package:flutter_appruslantest/screens/withoutauth.dart';
  Route<dynamic> generateRoute(RouteSettings settings){
    switch  (settings.name){
      case  '/':
        return MaterialPageRoute(builder: (_) => Noauth());
      case  '/register':
        return MaterialPageRoute(builder: (_) => Register());
      case '/signin':
        return MaterialPageRoute(builder: (_) => SingIn());
    }
  }
