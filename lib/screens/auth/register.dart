import 'package:flutter/material.dart';
import 'package:flutter_appruslantest/service/authServise.dart';
import 'package:flutter_appruslantest/constants.dart';
import 'package:flutter_appruslantest/spinkit.dart';

class Register extends StatefulWidget {
  final Function toggleView;
  Register ({this.toggleView});
  @override
  _RegisterState createState() => _RegisterState();
}
class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  bool loading = false;
  String email = '';
  String password = '';
  String error = '';
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
      backgroundColor: Colors.white,
      body: Container(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
          child: Form(
            key: _formKey,
            child: ListView(
              children: <Widget>[
                SizedBox(height: 50),
                Text('Введите email'),
                TextFormField(
               //  decoration: InputDecoration(
               //      border: OutlineInputBorder(
               //          borderRadius:BorderRadius.circular(30.0)),
               //      hintText:'email'
               //  ),
                  validator: (val)=>val.isEmpty?'Enter Email':null,
                  onChanged: (val) {
                    setState(() => email = val);
                  },
                ),
                SizedBox(height: 50),
                Text('Введите пароль'),
                TextFormField(
                  // decoration: InputDecoration(
                  //     border: OutlineInputBorder(
                  //         borderRadius:BorderRadius.circular(30.0)),
                  //     hintText:'Password'
                  // ),
                    validator: (val)=>val.length<6?'password 6+ sym':null,
                    obscureText: true,
                    onChanged: (val) {
                      setState(() => password = val);
                    }
                ),
                SizedBox(height: 50),
                FloatingActionButton(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(30.0))),
                    child: Text(
                        'Зарегистрироватся',
                        style: TextStyle(color: Colors.white)
                    ),
                    onPressed: () async {
                      if (_formKey.currentState.validate()){
                        setState(() => loading = true);
                        dynamic result = await _auth.registerWithEmailAndPassword(email,password);
                        if (result == null){

                          setState((){
                            loading = false;
                            error = 'Введите правильное мыло и пароль не меньше 6 символов';
                          });
                        }
                      }
                    }
                ),
                SizedBox(height: 12),
                Text(error,style: TextStyle(color: Colors.red)),
              ],
            ),
          )
      ),
    );
  }
}