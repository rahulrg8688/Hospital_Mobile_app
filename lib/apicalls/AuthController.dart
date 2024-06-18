import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class Authcontroller extends GetxController{
  final Storage=GetStorage();

  bool isAuthenticated(){
   final JwtToken= Storage.read('Jwt_token');
    if(JwtToken==null || JwtDecoder.isExpired(JwtToken)){
      print("Token no");
      return false;
    }
    return true;
  }

  void CheckAuth(){
    if(!isAuthenticated()){
      Get.offAllNamed("/login");
    }
  }

}
