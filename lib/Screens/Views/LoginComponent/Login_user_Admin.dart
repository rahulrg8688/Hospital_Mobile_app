import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:practice1/Screens/Views/LoginComponent/Login_user_Admin_controller.dart';
import 'package:practice1/Screens/Views/UserComponent/user_patient.dart';

import '../DoctorsComponent/Doctor_Admin.dart';

class LoginUserAdmin extends StatelessWidget {
   LoginUserAdmin({super.key});
  //final GlobalKey<FormState> formKey=GlobalKey<FormState>();
  final LoginUserAdminController controller=Get.put(LoginUserAdminController());
  var sizedbox=SizedBox(height:20);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: GetBuilder<LoginUserAdminController>(
        builder: (controller) {
          return SingleChildScrollView(
            child: Form(
              key: controller.formKey,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                  CachedNetworkImage(imageUrl: "https://img.lovepik.com/element/45009/2341.png_300.png"),
                    sizedbox,
                    TextFormField(
                      controller: controller.nameController,
                      validator: (val){
                        if(val==null || val.isEmpty){
                          return "plz enter";
                        }
                        if(controller.UsernameNotFound.value.isNotEmpty){
                          return "Username does not Exist";
                        }
                        return null;
                      },
                      onChanged: (val){
                        controller.formKey.currentState?.validate();
                      },

                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Plz enter username",
                        labelText: "Username"
                      ),
                    ),
                    sizedbox,
                    TextFormField(
                      controller: controller.passwordController,
                      validator: (val){
                        if(val==null||val.isEmpty){
                          return "Plz Enter";
                        }
                        if(controller.PasswordNotMatch.value.isNotEmpty){
                          return "password did not match";
                        }
                        return null;
                      },

                      onChanged: (val){
                        controller.formKey.currentState?.validate();
                      },
                      decoration:InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Plz enter password",
                        labelText: "password",
                      ) ,
                    ),
                    sizedbox,
                    controller.IsLoading.value?CircularProgressIndicator():
                    ElevatedButton(onPressed: (){
                      print(controller.formKey.currentState?.validate());

                            controller.ValidateUserAdmin();}

                    ,style:ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape:RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                      )
                    ) ,child:Text("Login",style: TextStyle(
                      color:Colors.black,
                      backgroundColor: Colors.white,
                    ),
                    )),
                    TextButton(onPressed: (){
                      Get.offAllNamed("/doctorAdmin");
                    }, child: Text("doctor")),
                  ],
                ),
              ),
            ),
          );
        }
      ),
    );
  }
}
