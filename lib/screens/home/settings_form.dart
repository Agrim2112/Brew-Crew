import 'package:brew_crew/models/UserModel.dart';
import 'package:brew_crew/services/database.dart';
import 'package:flutter/material.dart';
import 'package:brew_crew/shared/constants.dart';
import 'package:provider/provider.dart';

class SettingsForm extends StatefulWidget {

  @override
  State<SettingsForm> createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {

  final _formKey = GlobalKey<FormState>();
  final List<String> sugars = ['0','1','2','3','4'];

  String? currentName;
  String? currentSugars;
  int? currentStrength;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserModel?>(context);

    return StreamBuilder<UserData>(
      stream: DatabaseService(uid:user?.uid).userData,
      builder: (context,snapshot) {
        if (snapshot.hasData) {
          UserData? userData = snapshot.data;

          return Form(
            key: _formKey,
            child: Column(
              children: [
                Text("Update your brew settings",
                  style: TextStyle(
                      fontSize: 18.0
                  ),),
                SizedBox(height: 20.0,),
                TextFormField(
                  decoration: InputTextField.copyWith(hintText: "Name",),
                  initialValue: currentName ?? userData?.name,
                  validator: (val) =>
                  val!.isEmpty
                      ? "Please enter a name"
                      : null,
                  onChanged: (val) =>
                      setState(() {
                        currentName = val;
                      }),
                ),
                SizedBox(height: 20.0,),
                DropdownButtonFormField(
                    decoration: InputTextField,
                    value: currentSugars ?? userData?.sugars,
                    items: sugars.map((sugar) {
                      return DropdownMenuItem(
                          value: sugar,
                          child: Text("$sugar Sugars")
                      );
                    }).toList(),
                    onChanged: (val) =>
                        setState(() {
                          currentSugars = val!;
                        })),
                SizedBox(height: 20.0,),
                Slider(
                  min: 100,
                  max: 900,
                  divisions: 8,
                  activeColor: Colors.brown[currentStrength ?? userData!.strength],
                  onChanged: (val) {
                    currentStrength = val.round();
                    setState(() {});
                  },
                  value: (currentStrength ?? userData?.strength)!.toDouble(),
                ),
                SizedBox(height: 20.0,),
                ElevatedButton(
                  onPressed: () async {
                    if(_formKey.currentState!.validate()){
                      await DatabaseService(uid:user?.uid).updateData(
                          currentSugars?? userData!.sugars!,
                          currentName ?? userData!.name!,
                          currentStrength ?? userData!.strength
                      );
                    }
                  },
                  child: Text("Update",
                    style: TextStyle(
                        color: Colors.black
                    ),),
                )
              ],
            ),
          );
        }
        else {
          return CircularProgressIndicator(); // Return a loading indicator when snapshot has no data
        }
      }
    );
  }
}
