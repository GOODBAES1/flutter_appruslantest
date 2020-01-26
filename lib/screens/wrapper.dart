import 'package:flutter_appruslantest/screens/auth/authenticate.dart';
import 'package:flutter_appruslantest/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_appruslantest/model/user.dart';
import 'package:provider/provider.dart';
import 'package:flutter_appruslantest/screens/auth/register.dart';
class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     final user = Provider.of<User>(context);

     if (user == null) {
       return Authenticate();
     } else {
       return Home();
     }
  }
}
