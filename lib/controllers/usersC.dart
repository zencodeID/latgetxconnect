import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/user.dart';
import '../providers/usersP.dart';

class UsersC extends GetxController {
  var users = List<User>.empty().obs;

  void snackBarError(String msg) {
    Get.snackbar(
      "ERROR",
      msg,
      duration: Duration(seconds: 2),
    );
  }

  void add(String name, String email, String phone) {
    if (name != '' && email != '' && phone != '') {
      // String date = DateTime.now().toString();
      if (email.contains("@")) {
        UserProvider().postData(name, email, phone).then((value) {
          users.add(
            User(
              id: value.body["name"].toString(),
              name: name,
              email: email,
              phone: phone,
            ),
          );
        });

        // function simpan database
        Get.back();
      } else {
        snackBarError("Masukan email valid");
      }
    } else {
      snackBarError("Semua data harus diisi");
    }
  }

  User userById(String id) {
    return users.firstWhere((element) => element.id == id);
  }

  void edit(String id, String name, String email, String phone) {
    if (name != '' && email != '' && phone != '') {
      if (email.contains("@")) {
        UserProvider().editData(id, name, email, phone).then(
          (value) {
            final user = userById(id);
            user.name = name;
            user.email = email;
            user.phone = phone;
            users.refresh();
          },
        );
        Get.back();
      } else {
        snackBarError("Masukan email valid");
      }
    } else {
      snackBarError("Semua data harus diisi");
    }
  }

  Future<bool> delete(String id) async {
    bool _deleted = false;
    await Get.defaultDialog(
      title: "DELETE",
      middleText: "Apakah kamu yakin untuk menghapus data user ini?",
      textConfirm: "Ya",
      confirmTextColor: Colors.white,
      onConfirm: () {
        print(id);
        UserProvider().deleteData(id).then(
          (_) {
            users.removeWhere((element) => element.id == id);
            _deleted = true;
          },
        );

        Get.back();
      },
      textCancel: "Tidak",
    );
    return _deleted;
  }
}
