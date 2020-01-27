import 'package:flutter/material.dart';
import 'package:flutter_appruslantest/screens/auth/register.dart';
import 'package:flutter_appruslantest/service/authServise.dart';
import 'package:flutter_appruslantest/constants.dart';
import 'package:flutter_appruslantest/spinkit.dart';
import 'package:flutter_appruslantest/screens/auth/sing_in.dart';

class noauth extends StatefulWidget {
  final Function toggleView;
  noauth ({this.toggleView});
  @override
  _noauthState createState() => _noauthState();
}

final _formKey = GlobalKey<FormState>();
final AuthService _auth = AuthService();
bool loading = false;
String email = '';
String password = '';
String error = '';

class _noauthState extends State<noauth> {
  @override
  Widget build(BuildContext context) {
    return loading ? Loading(): Scaffold(
      backgroundColor: Colors.white,
      body: Container(

          child: Form(
            key: _formKey,
            child: ListView(
                padding: EdgeInsets.fromLTRB(50,0,50,0),

                children: <Widget>[
                SizedBox(height: 25),
            SizedBox(
              width: 300,
              height: 280,
              child: Image(image: AssetImage('assets/vector.png')),),
            Text(
              'Добро пожаловать!',
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30,fontFamily: 'Roboto'),
            ),
            SizedBox(height: 10),
            Text(
              '''Сделайте первый шаг к улучшению 
нашего города''',
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 16,fontFamily: 'Roboto'),
            ),
            SizedBox(height: 25),
            SizedBox(height: 10),
            FloatingActionButton(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(30.0))),
                child: Text(
                    'Регистрация',
                    style: TextStyle(color: Colors.white, fontFamily: 'Roboto', fontSize: 16, fontWeight: FontWeight.bold )
                ),
                onPressed:()  {
                  Register();
                }
            ),
            SizedBox(height: 10),
            Text(error,style: TextStyle(color: Colors.red)),
                  InkWell(
                    child: Text("Hello"),
                    onTap: () {Register();},
                  )
              ],
            ),
          )
      ),
    );
  }
}
