import 'package:get/get.dart';

class UserAdmin {
  var id = 0.obs;
  var username = ''.obs;
  var password = ''.obs;
  var role = 'select'.obs;
  var mobileNumber = 0.obs;
  var mailId = ''.obs;

  UserAdmin({
    int id = 0,
    String username = '',
    String password = '',
    String role = 'select',
    int mobileNumber = 0,
    String mailId = '',
  }) {
    this.id.value = id;
    this.username.value = username;
    this.password.value = password;
    this.role.value = role;
    this.mobileNumber.value = mobileNumber;
    this.mailId.value = mailId;
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id.value,
      'username': username.value,
      'password': password.value,
      'role': role.value,
      'mobileNumber': mobileNumber.value,
      'mailId': mailId.value,
    };
  }
}
