class UserModel{
  final String uid;

  UserModel({required this.uid});
}

class UserData{
  final String uid;
  final String? sugars;
  final String? name;
  final int strength;

  UserData({required this.uid,this.sugars,this.name,required this.strength});
}