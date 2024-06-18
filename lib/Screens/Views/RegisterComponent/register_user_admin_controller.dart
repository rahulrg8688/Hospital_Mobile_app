import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../Models/UserAdminModel.dart';
// Adjust the import to your actual model file

class ApiCalls {
  final String baseUrl = "your_backend_base_url";
}

class RegisterUserAdminController extends GetxController {
  final ApiCalls apiCalls = ApiCalls();
  TextEditingController nameController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  TextEditingController mobileController=TextEditingController();
  TextEditingController MailController=TextEditingController();
  TextEditingController RoleController=TextEditingController();
  var userAdmin = UserAdmin().obs;
  var Message=''.obs;
  var isUsernameUnique = ''.obs;
  var Isloading=false.obs;
  var InsertResponse=0.obs;

  Future<void> ValidateUsername() async{

    print("function called");
    final response=await http.get(Uri.parse("https://10.0.2.2:7103/api/Admin/FindDupUsername?Username=${nameController.text}"),
    headers: {'Content-Type':'application/json'},


    );

    if(response.statusCode==200){
      final res=jsonDecode(response.body);
      print(res.isUnique);
      isUsernameUnique.value=res.isUnique;

      update();
      print("function done");
    }
    else{
      print("${response.statusCode}");
    }
  }


  Future<void> insertIntoAdmin() async {
    Isloading.value=true;
    update();
 UserAdmin userdetails=UserAdmin(
      username: nameController.text,
      password: passwordController.text,
      role:RoleController.text,
    mobileNumber: int.parse(mobileController.text),
    mailId: MailController.text,
  );
    final response = await http.post(
      Uri.parse("https://10.0.2.2:7103/api/Admin/InsertAdminUser"),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(
        {
         userdetails.toJson()
        }
      ),
    );

    Isloading.value=false;
    update();
    if (response.statusCode == 200) {
      final res=jsonDecode(response.body);
      print(res);
      InsertResponse.value=res['status']??0;
      update();
    } else {
      InsertResponse.value=0;
      update();
      print("Registration failed: ${response.body}");
    }
  }
}
