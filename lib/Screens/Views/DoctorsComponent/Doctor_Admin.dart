import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:practice1/Screens/Views/DoctorsComponent/Doctor_admin_controller.dart';

class DoctorAdmin extends StatelessWidget {
   DoctorAdmin({super.key});
   final Storage=GetStorage();
   DoctorAdminController controller=Get.put(DoctorAdminController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar:AppBar(
            title: Text("Doctor_admin"),
            backgroundColor: Colors.blue,
              foregroundColor:Colors.white,

            actions: [
              IconButton(onPressed: (){
                Storage.remove('Jwt_token');
                Get.toNamed("/login");

              }, icon:Icon(Icons.logout_outlined))
            ],
          ),
      body:GetBuilder<DoctorAdminController>(
        builder: (controller) {
          return SingleChildScrollView(
            child: Column(
              children: [
                controller.data.length==0?CircularProgressIndicator():
                Text(controller.data.length.toString()),
              ],
            ),
          );

        }
      )
    );
  }
}
