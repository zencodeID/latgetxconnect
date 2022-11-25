import 'dart:convert';

import 'package:get/get.dart';

class UserProvider extends GetConnect {
  final url =
      "https://latihangetconnect-default-rtdb.asia-southeast1.firebasedatabase.app/";
  // Get request
  // Future<Response> getUser(int id) => get('http://youapi/users/$id');

  // simpan ke database
  Future<Response> postData(String name, String email, String phone) {
    final body = json.encode({
      // "id": id, tidak usah karena id sudah memakai id generate dari firebase
      "name": name,
      "email": email,
      "phone": phone,
    });
    return post(url + "user.json", body);
  }
  //delete database and memory

  Future<Response> deleteData(String id) {
    return delete(url + "users/$id.json");
  }

//edit databasae n memory
  Future<Response> editData(
      String id, String name, String email, String phone) {
    final body = json.encode({
      "name": name,
      "email": email,
      "phone": phone,
    });
    return patch(url + "users/$id.json", body);
  }
}
