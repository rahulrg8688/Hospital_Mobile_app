import 'SpecialityModel.dart';

class doctors {
  int? doctorId;
  String? doctorName;
  int? doctorSpeciality;
  String? doctorExp;
  int? fee;
  String? gender;
  Specialities? specialities;

  List<doctors> doct=[];

  doctors(
      {this.doctorId,
        this.doctorName,
        this.doctorSpeciality,
        this.doctorExp,
        this.fee,
        this.gender,
        this.specialities,
       });

  doctors.fromJson(Map<String, dynamic> json) {
    doctorId = json['doctorId'];
    doctorName = json['doctorName'];
    doctorSpeciality = json['doctorSpeciality'];
    doctorExp = json['doctorExp'];
    fee = json['fee'];
    gender = json['gender'];
    specialities = json['specialities'] != null
        ? new Specialities.fromJson(json['specialities'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['doctorId'] = this.doctorId;
    data['doctorName'] = this.doctorName;
    data['doctorSpeciality'] = this.doctorSpeciality;
    data['doctorExp'] = this.doctorExp;
    data['fee'] = this.fee;
    data['gender'] = this.gender;
    if (this.specialities != null) {
      data['specialities'] = this.specialities!.toJson();
    }
    return data;
  }
}

