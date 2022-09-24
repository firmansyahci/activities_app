import 'package:activities_app/consts/app_colors.dart';
import 'package:activities_app/consts/route_names.dart';
import 'package:activities_app/route/app_route.dart';
import 'package:activities_app/screens/home_screen.dart';
import 'package:activities_app/utils/color_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Activities',
      theme: ThemeData(
        primarySwatch: ColorUtils.buildMaterialColor(AppColors.navy),
      ),
      home: HomeScreen(),
      getPages: AppRoute.all,
      initialRoute: RouteNames.home,
    );
  }
}
