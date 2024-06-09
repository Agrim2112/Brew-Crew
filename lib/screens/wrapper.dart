import 'package:brew_crew/models/UserModel.dart';
import 'package:brew_crew/screens/authenticate/authenticate.dart';
import 'package:brew_crew/screens/home/home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {

    final user = Provider.of<UserModel?>(context);
    print(user);

    if(user==null){
      return Authenticate();
    }
    else{
      return Home();
    }
  }
}
