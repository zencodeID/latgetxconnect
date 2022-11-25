import 'package:belajar_getx/bindings/addB.dart';
import 'package:belajar_getx/bindings/profileB.dart';
import 'package:belajar_getx/pages/add_page.dart';
import 'package:belajar_getx/pages/home_page.dart';
import 'package:belajar_getx/pages/profile_page.dart';
import 'package:belajar_getx/routes/route_name.dart';
import 'package:get/get.dart';



class AppPages {
  static final pages = [
    GetPage(
      name: RouteName.home,
      page: () => HomePage(),
    ),
    GetPage(
      name: RouteName.profile,
      page: () => ProfilePage(),
      binding: ProfileB(),
    ),
    GetPage(
      name: RouteName.add,
      page: () => AddPage(),
      binding: AddUserB(),
    ),
  ];
}
