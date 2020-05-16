import 'package:GLDG/screens/input_page.dart';
import 'mytile.dart';

import 'package:json_annotation/json_annotation.dart';

part 'patient.g.dart';

@JsonSerializable()
class Patient {
  Gender gender;
  List<String> countriesTravelled;
  List<String> symptoms;
  List<String> medicalHistory;
  int weight;
  int age;
  int height;

  Patient(
      {this.gender,
      this.medicalHistory,
      this.symptoms,
      this.countriesTravelled,
      this.height,
      this.weight,
      this.age});

  List<MyTile> converter() {
    List<MyTile> temp = <MyTile>[];
    List<MyTile> child = <MyTile>[];

    temp.add(MyTile('Age', <MyTile>[MyTile(this.age.toString())]));
    temp.add(MyTile('Weight', <MyTile>[MyTile(this.weight.toString())]));
    temp.add(MyTile('Height', <MyTile>[MyTile(this.height.toString())]));
    temp.add(MyTile('Countries travelled'));
    for (int i = 0; i < this.countriesTravelled.length; i++) {
      child.add(MyTile(this.countriesTravelled[i]));
    }
    temp[3].children = child;
    child = [];
    temp.add(MyTile('Symptoms'));
    for (int i = 0; i < this.symptoms.length; i++) {
      child.add(MyTile(this.symptoms[i]));
    }
    temp[4].children = child;
    child = [];
    temp.add(MyTile('Medical History'));
    for (int i = 0; i < this.medicalHistory.length; i++) {
      child.add(MyTile(this.medicalHistory[i]));
    }
    temp[5].children = child;
    child = [];
    return temp;
  }

  factory Patient.fromJson(Map<String, dynamic> json) =>
      _$PatientFromJson(json);
  Map<String, dynamic> toJson() => _$PatientToJson(this);
}
