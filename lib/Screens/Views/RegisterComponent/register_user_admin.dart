import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practice1/Screens/Views/LoginComponent/Login_user_Admin.dart';
import 'register_user_admin_controller.dart'; // Adjust the import to your actual controller file

class RegisterUserAdmin extends StatelessWidget {
  final RegisterUserAdminController controller = Get.put(RegisterUserAdminController());
  final formKey1 = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register"),
      ),
      body: GetBuilder<RegisterUserAdminController>(
        builder: (controller) {
          return SingleChildScrollView(
            child: Card(
              color: Colors.blue.shade900,
              child: Form(
                key: formKey1,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [

                      Text("Create New Account"),
                      TextFormField(
                        controller:controller.nameController ,
                        validator: (val) {
                          if (val == null || val.isEmpty) {
                            return "Please enter the username";
                          }
                          if(controller.isUsernameUnique.value==true){
                            return "Plz enter other username";
                          }
                          return null;
                        },
                        onTapOutside: (val) {
                          print(val);
                          controller.ValidateUsername();
                        },
                        decoration: InputDecoration(
                          hintText: "Please enter username",
                          labelText: "Username",
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(height: 20),
                     TextFormField(
                         controller:controller.passwordController,
                        validator: (val) {
                          if (val == null || val.isEmpty) {
                            return "Please enter the password";
                          }
                          return null;
                        },
                        onChanged: (val) {
                           print(val);
                          controller.userAdmin.value.password.value = val;
                        },
                        decoration: InputDecoration(
                          hintText: "Password",
                          labelText: "Password",
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        controller:controller.mobileController,
                        validator: (val) {
                          if (val == null || val.isEmpty) {
                            return "Please enter the mobile number";
                          }
                          return null;
                        },
                        onChanged: (val) {
                          print(val);
                          controller.userAdmin.value.mobileNumber.value = int.parse(val);
                        },
                        decoration: InputDecoration(
                          hintText: "Please enter mobile number",
                          labelText: "Mobile Number",
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(height: 20),
                    TextFormField(
                      controller:controller.MailController,
                        validator: (val) {
                          if (val == null || val.isEmpty) {
                            return "Please enter the mail ID";
                          }
                          return null;
                        },
                        onChanged: (val) {
                        print(val);
                          controller.userAdmin.value.mailId.value = val;
                        },
                        decoration: InputDecoration(
                          hintText: "Please enter mail ID",
                          labelText: "Mail ID",
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(height: 20),
                      DropdownButtonFormField<String>(
                        onChanged: (val) {
                          print(val);
                          controller.RoleController.text = val ?? 'select';
                        },
                        validator: (val) {
                          if (val == "select" || val == null || val.isEmpty) {
                            return "Please select a role";
                          }
                          return null;
                        },
                        items: [
                          DropdownMenuItem(child: Text("select"), value: "select"),
                          DropdownMenuItem(child: Text("Admin"), value: "Admin"),
                          DropdownMenuItem(child: Text("User"), value: "User"),
                        ],
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Role',
                        ),
                      ),
                      SizedBox(height: 20),
                      controller.Isloading.value?CircularProgressIndicator():ElevatedButton(
                        onPressed: () {
                          if (formKey1.currentState!.validate()) {
                            controller.insertIntoAdmin();
                            print(controller.InsertResponse.value);
                            if(controller.InsertResponse.value==1){
                              Get.defaultDialog(
                                title:"Account Created Successfully",
                                textConfirm: "ok",
                                  textCancel:"cancel",
                                onConfirm: (){
                                  Get.to(LoginUserAdmin());
                                }

                              );                            }
                          }
                        },
                        child: Text("Register"),
                      ),
                      TextButton(onPressed: (){
                        Get.to(LoginUserAdmin());
                      }, child: Text("Already have an account")),
                      TextButton(onPressed: (){
                        Get.toNamed("/doctorAdmin");
                      }, child: Text("doctor")),


                    ],
                  ),
                ),
              ),
            ),
          );
        }
      ),
    );
  }
}
