import 'package:flutter/material.dart';
import 'package:flutter_appruslantest/service/authServise.dart';
import 'package:flutter_appruslantest/constants.dart';
import 'package:flutter_appruslantest/spinkit.dart';
class SingIn extends StatefulWidget {
  final Function toggleView;
  SingIn ({this.toggleView});
  @override
  _SingInState createState() => _SingInState();
}
final _formKey = GlobalKey<FormState>();
final AuthService _auth = AuthService();
bool loading = false;
String email = '';
String password = '';
String error = '';
//: <Widget>[
//FlatButton.icon(
//onPressed: (){widget.toggleView();},
//icon: Icon(Icons.person),
//label: Text('register'),)
//],


class _SingInState extends State<SingIn> {
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
               SizedBox(
                 width: 300,
                 height: 300,
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
              SizedBox(height: 10),
              TextFormField(
                decoration: InputDecoration(

                    border: OutlineInputBorder(
                        borderRadius:BorderRadius.circular(30.0)),
                    hintText:'Email'
                ),
                validator: (val)=>val.isEmpty?'Enter Email':null,
                onChanged: (val){
                    setState(()=> email = val);
                },
              ),
              SizedBox(height: 10),
              TextFormField(
               decoration: InputDecoration(
                   border: OutlineInputBorder(
                       borderRadius:BorderRadius.circular(30.0)),
                   hintText:'Password'
               ),
                  validator: (val)=>val.length<6?'password 6+ sym':null,
                obscureText: true,
                onChanged: (val){
                  setState(()=> password =val);
                }
              ),
              SizedBox(height: 10),
              FloatingActionButton(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(30.0))),
                  child: Text(
                    'Вход',
                    style: TextStyle(color: Colors.white, fontFamily: 'Roboto', fontSize: 16, fontWeight: FontWeight.bold )
                ),
                onPressed:() async {
                  if (_formKey.currentState.validate()){
                    setState(() => loading = true );
                    dynamic result = await _auth.signWithEmailAndPassword(email, password);
                    if (result == null){
                      setState(() {
                        loading = false;
                        error = 'Could not signin with that data ';
                      });
                    }
                  }
                  }
              ),
              SizedBox(height: 10),
              Text(error,style: TextStyle(color: Colors.red)),
            ],
          ),
        )
                ),
            );
          }
}






