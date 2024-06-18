import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:practice1/Screens/Views/DoctorsComponent/Doctor_Admin.dart';
import 'package:practice1/Screens/Views/LoginComponent/Login_user_Admin.dart';
import 'package:practice1/Screens/Views/UserComponent/user_patient.dart';
import 'package:practice1/apicalls/AuthController.dart';

import 'Screens/Dashboard.dart';
import 'Screens/Views/RegisterComponent/register_user_admin.dart';
import 'Screens/overrides.dart';
import 'apicalls/AuthMiddleware.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();
  await GetStorage.init();
  final Authcontroller authcontroller=Get.put(Authcontroller());

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
MyApp({super.key});

  final Authcontroller authcontroller=Get.put(Authcontroller());

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',

      theme:ThemeData(
        scaffoldBackgroundColor: Colors.black,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.blue
        )
      ),
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: ()=>RegisterUserAdmin()),
        GetPage(name: '/login', page:()=>LoginUserAdmin()),
        GetPage(name: '/doctorAdmin', page:()=>DoctorAdmin(),middlewares: [Authmiddleware()]),
        GetPage(name: '/userPatient', page:()=>userPatient(),middlewares: [Authmiddleware()]),
      ],
    );
  }
}

