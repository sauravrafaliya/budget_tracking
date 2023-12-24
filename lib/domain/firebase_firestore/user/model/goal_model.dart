// *******************************
// Develop by : Saurav Rafaliya
// Date : 24 December,2023
// Path : lib/domain/firebase_firestore/user/model
// *******************************


import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

Goal goalFromJson(String str) => Goal.fromJson(json.decode(str));

String goalToJson(Goal data) => json.encode(data.toJson());

class Goal {
  String? id;
  String? goal;
  DateTime? goalDate;
  DateTime? createAt;
  DateTime? updateAt;
  double? amount;
  List<Contribute>? contribute;


  Goal.fromDocumentSnapshot({DocumentSnapshot<Map<String,dynamic>>? documentSnapshot}) {
    Map data = documentSnapshot!.data() as Map;
    goal = data['goal'];
    if(data["contribute"] != null){
      contribute = (data["contribute"] as List).map((e) {
        return Contribute.fromJson(e);
      }).toList();
    }
    goalDate = data['goal_date']?.toDate();
    createAt = data['create_at']?.toDate();
    updateAt = data['update_at']?.toDate();
    amount = double.tryParse(data['amount'].toString());
    id = documentSnapshot.id;
  }

  Goal.fromQueryDocumentSnapshot(
      {QueryDocumentSnapshot? queryDocSnapshot}) {
    Map data = queryDocSnapshot!.data() as Map;
    goal = data['goal'];
    if(data["contribute"] != null){
      contribute = (data["contribute"] as List).map((e) {
        return Contribute.fromJson(e);
      }).toList();
    }
    goalDate = data['goal_date']?.toDate();
    updateAt = data['update_at']?.toDate();
    createAt = data['create_at']?.toDate();
    updateAt = data['update_at']?.toDate();
    amount = double.tryParse(data['amount'].toString());;
    id = queryDocSnapshot.id;
  }

  Goal({
    this.id,
    this.goal,
    this.goalDate,
    this.amount,
    this.contribute,
    this.updateAt,
    this.createAt
  });


  Goal copyWith({
    String? id,
    String? goal,
    DateTime? goalDate,
    double? amount,
    List<Contribute>? contribute,
    DateTime? updateAt,
    DateTime? createAt
  }){
    return Goal(
      updateAt: updateAt ?? this.updateAt,
      amount: amount ?? this.amount,
      createAt: createAt ?? this.createAt,
      contribute: contribute ?? this.contribute,
      goalDate: goalDate ?? this.goalDate,
      goal: goal ?? this.goal,
      id: id ?? this.id
    );
  }

  factory Goal.fromJson(Map<String, dynamic> json) => Goal(
    id: json["id"],
    goal: json["goal"],
    goalDate: json["goal_date"],
    createAt: json["create_at"],
    updateAt: json["update_at"],
    amount: double.tryParse(json["amount"].toString()),
    contribute: json["contribute"] == null ? [] : List<Contribute>.from(json["contribute"]!.map((x) => Contribute.fromJson(x))),
  );

  Map<String, dynamic>  toJson(){
    Map<String,dynamic> json = {};
    if(id != null){
      json["id"] = id;
    }
    if(goal != null){
      json["goal"] = goal;
    }
    if(goalDate != null){
      json["goal_date"] = goalDate;
    }
    if(createAt != null){
      json["create_at"] = createAt;
    }
    if(updateAt != null){
      json["update_at"] = updateAt;
    }
    if(amount != null){
      json["amount"] = amount;
    }
    if(contribute != null){
      json["contribute"] = List<dynamic>.from(contribute!.map((x) => x.toJson()));
    }
    return json;
  }
}

class Contribute {
  String? id;
  String? title;
  double? amount;
  DateTime? date;
  DateTime? createAt;
  DateTime? updateAt;

  Contribute({
    this.id,
    this.title,
    this.amount,
    this.date,
    this.updateAt,
    this.createAt
  });

  Contribute copyWith({
    String? id,
    String? title,
    double? amount,
    DateTime? date,
    DateTime? updateAt,
    DateTime? createAt
  }){
    return Contribute(
      updateAt: updateAt ?? this.updateAt,
      amount: amount ?? this.amount,
      createAt: createAt ?? this.createAt,
      id: id ?? this.id,
      title: title ?? this.title,
      date: date ?? this.date,
    );
  }

  Contribute.fromDocumentSnapshot({DocumentSnapshot? documentSnapshot}) {
    Map data = documentSnapshot!.data() as Map;
    title = data['title'];
    amount = double.tryParse(data['amount'].toString());
    date = data['date']?.toDate();
    createAt = data['create_at']?.toDate();
    updateAt = data['update_at']?.toDate();
    id = documentSnapshot.id;
  }

  Contribute.fromQueryDocumentSnapshot({QueryDocumentSnapshot? queryDocumentSnapshot}) {
    Map data = queryDocumentSnapshot!.data() as Map;
    title = data['title'];
    amount = double.tryParse(data['amount'].toString());
    createAt = data['create_at']?.toDate();
    date = data['date']?.toDate();
    updateAt = data['update_at']?.toDate();
    id = queryDocumentSnapshot.id;
  }

  factory Contribute.fromJson(Map<String, dynamic> json) => Contribute(
    id: json["id"],
    title: json["title"],
    amount: json["amount"],
    date: json["date"],
    createAt: json["create_at"],
    updateAt: json["update_at"],
  );

  Map<String, dynamic> toJson(){
    Map<String, dynamic> json = {};
    if(id != null){
      json["id"] = id;
    }
    if(title != null){
      json["title"] = title;
    }
    if(date != null){
      json["date"] = date;
    }
    if(createAt != null){
      json["create_at"] = createAt;
    }
    if(updateAt != null){
      json["update_at"] = updateAt;
    }
    if(amount != null){
      json["amount"] = amount;
    }
    return json;
  }
}
