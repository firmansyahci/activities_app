import 'package:activities_app/consts/route_names.dart';
import 'package:activities_app/models/activity.dart';
import 'package:activities_app/network/activity_network.dart';
import 'package:activities_app/services/app_exception.dart';
import 'package:activities_app/widgets/reusable_snackbar.dart';
import 'package:get/get.dart';

class ActivityDetailController extends GetxController {
  final _activityNetwork = ActivityNetwork();

  var activity = ActivityElement().obs;
  final int id = Get.arguments as int;
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    getActivity(id);
  }

  getActivity(int id) async {
    isLoading.value = true;
    try {
      final response = await _activityNetwork.getActivityById(id);
      activity.value = response;
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      final error = e as AppException;
      ReusableSnackbar.error(error.message!);
    }
  }

  onEditActivity() async {
    final newActivity =
        await Get.toNamed(RouteNames.editActivity, arguments: activity.value);
    if (newActivity != null) {
      activity.value = newActivity;
    }
  }
}
