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
      appBar: AppBar(
        backgroundColor: Colors.grey,
        elevation: 0.0,
        title: Text('SINGIUP'),
        actions: <Widget>[
          FlatButton.icon(
            onPressed: (){widget.toggleView();},
            icon: Icon(Icons.person),
            label: Text('Singin'),)
        ],
      ),
      body: Container(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
          child: Form(
            key: _formKey,
            child: ListView(
              children: <Widget>[
                SizedBox(height: 50),
                TextFormField(
                  decoration: textImputDecorations.copyWith(hintText:'Email'),
                  validator: (val)=>val.isEmpty?'Enter Email':null,
                  onChanged: (val) {
                    setState(() => email = val);
                  },
                ),
                SizedBox(height: 50),
                TextFormField(
                    decoration: textImputDecorations.copyWith(hintText:'Password'),
                    validator: (val)=>val.length<6?'password 6+ sym':null,
                    obscureText: true,
                    onChanged: (val) {
                      setState(() => password = val);
                    }
                ),
                SizedBox(height: 50),
                RaisedButton(
                    color: Colors.pink[400],
                    child: Text(
                        'SINGUP',
                        style: TextStyle(color: Colors.white)
                    ),
                    onPressed: () async {
                      if (_formKey.currentState.validate()){
                        setState(() => loading = true);
                        dynamic result = await _auth.registerWithEmailAndPassword(email,password);
                        if (result == null){

                          setState((){
                            loading = false;
                            error = 'register if u hnt got acc';
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