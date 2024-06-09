import 'package:brew_crew/models/UserModel.dart';
import 'package:brew_crew/services/auth.dart';
import 'package:brew_crew/shared/Loading.dart';
import 'package:flutter/material.dart';
import 'package:brew_crew/shared/constants.dart';

class SignIn extends StatefulWidget {

  final Function toggleSignIn;

  SignIn({required this.toggleSignIn});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final AuthService _auth=AuthService();
  String email='';
  String password='';
  String error='';
  bool loading=false;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return loading? Loading(): Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[300],
        elevation: 0.0,
        title: Text("Sign In"),
        centerTitle: true,
        actions: <Widget>[
          TextButton.icon(onPressed: () {
            widget.toggleSignIn();
          },
              icon: Icon(Icons.account_box),
              label: Text("Sign Up"))
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 50.0,vertical: 20),
        child: Form(
        key: _formKey,
          child: Column(
            children: <Widget> [
              SizedBox(height: 20.0,),
              TextFormField(
                decoration: InputTextField.copyWith(hintText: "Email"),
                validator: (val)=> val!.isEmpty? "Enter an email" : null,
                onChanged: (val) {
                  email=val;
                },
              ),
              SizedBox(height: 20.0,),
              TextFormField(
                  decoration: InputTextField,
                validator: (val)=> val!.length<6? "Enter a password 6+ characters long" : null,
                obscureText: true,
                onChanged: (val) {
                  setState(() {
                    password=val;
                  });
                },
              ),
              SizedBox(height: 20.0,),
              ElevatedButton(
                  onPressed: () async{
                    if(_formKey.currentState!.validate()){
                      setState(() {
                        loading=true;
                      });
                      dynamic result = await _auth.signInWithEmailAndPassword(email, password);
                      if(result==null){
                        setState(() {
                          loading=false;
                          error="Please enter valid details";
                        });
                      }
                    }
              },
                  child: Text("Sign In",
                    style: TextStyle(
                    color: Colors.black
                  ),),
              ),
              SizedBox(height: 10.0,),
              Text(error,style: TextStyle(
                color: Colors.red,
                fontSize: 15.0
              ),)
            ],
          ),
        ),
      ),
    );
  }
}

