import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../Models/UserAdminModel.dart';
import '../../Models/doctorModel.dart';

class DoctorAdminController extends GetxController{

doctors doctorModel=doctors();
  RxList<doctors> data=<doctors>[].obs;
  List<doctors> data1=[];

  @override
  void onInit() {
    GetAllDoctors();
    // TODO: implement onInit
    super.onInit();
  }

  Future<void> GetAllDoctors() async{
    final response=await http.get(Uri.parse("https://10.0.2.2:7103/api/Admin/GetAllDoctors"),
    headers: {'Content-Type':'application/json'},
    ).timeout(Duration(seconds: 120));

    if(response.statusCode==200){
      print("Raw data: ${response.body}");
      List<dynamic> res=jsonDecode(response.body);
      print("parsed data is ${res}");
    //  data.value=res.map((e)=>doctors.fromJson(e)).toList();
      data.value=res.map((e)=>doctors.fromJson(e)).toList();
      doctorModel=doctors.fromJson({"doct":res});
    }
    else{
      print("Failed to load ${response.statusCode}");
    }

  }
}