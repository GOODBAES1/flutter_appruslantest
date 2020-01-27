import 'package:flutter_appruslantest/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_appruslantest/model/user.dart';
import 'package:flutter_appruslantest/screens/withoutauth.dart';
import 'package:provider/provider.dart';
import 'package:flutter_appruslantest/screens/auth/register.dart';
import 'package:flutter_appruslantest/router.dart' as router;
class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     final user = Provider.of<User>(context);

     if (user == null) {
       return MaterialApp(

         onGenerateRoute: router.generateRoute,
           initialRoute: '/'
       );
     } else {
       return Home();
     }
  }
}
