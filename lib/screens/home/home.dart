import 'package:brew_crew/models/Brew.dart';
import 'package:brew_crew/screens/home/settings_form.dart';
import 'package:brew_crew/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:brew_crew/services/database.dart';
import 'package:provider/provider.dart';
import 'brewlist.dart';

class Home extends StatelessWidget {

  final AuthService _auth=AuthService();

  @override
  Widget build(BuildContext context) {

    void _showSettings(){
      showModalBottomSheet(context: context, builder: (context){
        return FractionallySizedBox(
          widthFactor: 1,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal:20,vertical: 20),
            child: SettingsForm(),
          ),
        );
      });
    }
    return StreamProvider<List<Brew?>?>.value(
      initialData: null,
      value: DatabaseService().brews,
      child: Scaffold(
        backgroundColor: Colors.brown[100],
        appBar: AppBar(
          title: Text("Brew Crew"),
          centerTitle: true,
          backgroundColor: Colors.brown[400],
          elevation: 0.0,
          actions: <Widget>[
            TextButton.icon(onPressed: () async{
              await _auth.signOut();
            },
                icon: Icon(Icons.account_circle),
                label: Text("Log Out")),
            TextButton.icon(onPressed: () {
              _showSettings();
            },
                icon: Icon(Icons.settings),
                label: Text("Settings"))
          ],
        ),
      body: BrewList(),
      ),
    );
  }
}
