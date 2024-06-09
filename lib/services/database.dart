import 'package:brew_crew/models/Brew.dart';
import 'package:brew_crew/models/UserModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class DatabaseService {

  final String? uid;
  DatabaseService({this.uid});
  final CollectionReference brewCollection = FirebaseFirestore.instance.collection("brews");

  Future updateData(String sugars, String name, int strength) async{
    return await brewCollection.doc(uid).set({
      'sugars':sugars,
      'name': name,
      'strength':strength
    });
  }

  UserData _userData(DocumentSnapshot snapshot){
    var data = snapshot.data() as Map<String, dynamic>?;
    return UserData(
        uid: uid!,
        strength: data?['strength'] ?? 0,
        name: data?['name'] ?? '',
        sugars: data?['sugars'] ?? ''
    );
  }

  List<Brew?> _getBrewList(QuerySnapshot snapshot){
    return snapshot.docs.map((doc) {
      var data = doc.data() as Map<String, dynamic>?;
      return data != null ? Brew(
          name: data['name'] ?? '',
          sugars: data['sugars'] ?? '',
          strength: data['strength'] ?? 0
      ) : null;
    }).toList();
  }

  Stream<List<Brew?>> get brews {
    return brewCollection.snapshots()
    .map(_getBrewList);
  }

  Stream<UserData> get userData {
    return brewCollection.doc(uid).snapshots()
        .map(_userData);
  }

}