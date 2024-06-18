import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practice1/apicalls/AuthController.dart';

class Authmiddleware extends GetMiddleware{
  @override
  RouteSettings? redirect(String? route){
    final Authcontroller authcontroller=Get.find();
    if(!authcontroller.isAuthenticated()){
      return RouteSettings(name:'/login');
    }
    return null;
  }
}