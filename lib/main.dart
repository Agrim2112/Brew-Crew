import 'package:brew_crew/models/UserModel.dart';
import 'package:brew_crew/screens/wrapper.dart';
import 'package:brew_crew/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
        apiKey: 'AIzaSyCKPAjUNeAII7TEg_B8wVE04aDwlCJSTvo',
        appId: '1:66476035835:android:8ad2da04a1e33e606fea5e',
        messagingSenderId: '66476035835	',
        projectId: 'brewcrew-e3db7',
        storageBucket: '1:66476035835:android:8ad2da04a1e33e606fea5e', ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamProvider<UserModel?>.value(
      initialData: null,
      value: AuthService().user,
      child: MaterialApp(
        home: Wrapper(),
      ),
    );
  }
}


