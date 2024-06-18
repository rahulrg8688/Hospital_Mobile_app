class Specialities {
  int? spid;
  String? specialityName;

  Specialities({this.spid, this.specialityName});

  Specialities.fromJson(Map<String, dynamic> json) {
    spid = json['spid'];
    specialityName = json['specialityName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['spid'] = this.spid;
    data['specialityName'] = this.specialityName;
    return data;
  }
}