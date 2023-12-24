
import 'package:cloud_firestore/cloud_firestore.dart';

typedef FSDocumentMap = DocumentSnapshot<Map<String, dynamic>>;
typedef FSDocumentRef = DocumentReference<Map<String, dynamic>>;

typedef FSCollectionList = QuerySnapshot<Map<String, dynamic>>;
typedef FSCollectionRef = CollectionReference<Map<String, dynamic>>;

typedef RestaurantStatus = (bool isComplete,bool isVerify);

enum FSOperation{
  add,
  update,
  set,
  delete
}