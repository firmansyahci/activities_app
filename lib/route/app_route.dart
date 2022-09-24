import 'package:activities_app/consts/route_names.dart';
import 'package:activities_app/screens/activity_detail_screen.dart';
import 'package:activities_app/screens/edit_activity_screen.dart';
import 'package:activities_app/screens/home_screen.dart';
import 'package:get/route_manager.dart';

class AppRoute {
  static final all = [
    GetPage(
      name: RouteNames.home,
      page: () => HomeScreen(),
    ),
    GetPage(
      name: RouteNames.editActivity,
      page: () => EditActivityScreen(),
    ),
    GetPage(
      name: RouteNames.detailActivity,
      page: () => ActivityDetailScreen(),
    ),
  ];
}
