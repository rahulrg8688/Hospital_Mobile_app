import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:practice1/Screens/Models/UserAdminModel.dart';

class LoginUserAdminController extends GetxController{
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GetStorage Storage=GetStorage();

  TextEditingController nameController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  var message=''.obs;
var UsernameNotFound=''.obs;
var PasswordNotMatch=''.obs;
var Role=''.obs;
var token=''.obs;
var IsLoading=false.obs;

@override
void onInit() {
    super.onInit();

    UsernameNotFound.listen((_) => formKey.currentState?.validate());
    PasswordNotMatch.listen((_) => formKey.currentState?.validate());
  }
  Future<void> ValidateUserAdmin() async {
    PasswordNotMatch.value='';
    print("Function called");
    IsLoading.value = true;
    UserAdmin userdetails=UserAdmin(
      username: nameController.text,
      password: passwordController.text
    );
    update();
    final response = await http.post(
      Uri.parse("https://10.0.2.2:7103/api/Admin/ValidateUserAdmin"),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(
        userdetails.toJson()
      ),
    );
    IsLoading.value = false;
    update();
    if (response != null) {


      if (response.statusCode == 200) {
        final res = jsonDecode(response.body);
        print(res);
        if (res['status'] == 1) {
          UsernameNotFound.value = res['message'];
          update();
        }
        else {
          UsernameNotFound.value = '';
          update();
        }
          if (res['status'] == 2) {
            PasswordNotMatch.value = res['message'];
            update();
          }
          else {
            PasswordNotMatch.value = '';
            update();
          }
          if (res['status'] == 3) {
            message.value = res['message'];
            Role.value = res['retval']['Role'];
            token.value = res['token'];
            Storage.write("Jwt_token",token.value);
            if(Role.value.toUpperCase()=="ADMIN"){
              Get.toNamed("/doctorAdmin");
            }
            else if(Role.value.toUpperCase()=="USER"){
              Get.toNamed("/userPatient");
            }
            update();
          }
        }
      else {
        print("Response StatusError ${response.body}");
      }

      }
    print("Data fetched ${Role.value}");
    print("Data fetched ${token}");
    print("Data fetched ${message}");

    }

  }
