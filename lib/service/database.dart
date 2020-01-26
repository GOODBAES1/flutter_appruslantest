import 'package:cloud_firestore/cloud_firestore.dart';
class DatabaseService{
  final String uid;
  DatabaseService({this.uid});
  final CollectionReference someCollection = Firestore.instance.collection('brew');
  Future updateUserData(String sugars,String name, int strength) async{
  return await someCollection.document(uid).setData({
    'sugars': sugars,
    'name' : name,
    'strangth' : strength,
  });
  }
}
