import 'package:activities_app/consts/route_names.dart';
import 'package:activities_app/models/activity.dart';
import 'package:activities_app/network/activity_network.dart';
import 'package:activities_app/services/app_exception.dart';
import 'package:activities_app/widgets/reusable_snackbar.dart';
import 'package:get/get.dart';

class HomeContentController extends GetxController {
  final _activityNetwork = ActivityNetwork();

  var list = <ActivityElement>[].obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    getActivites();
  }

  Future<void> getActivites() async {
    isLoading.value = true;
    try {
      final response = await _activityNetwork.getAllActivities();
      list.value = response.activities ?? [];
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      final error = e as AppException;
      ReusableSnackbar.error(error.message!);
    }
  }

  Future<void> addActivity(ActivityElement activity) async {
    try {
      final response = await _activityNetwork.postActivity(activity);
      list.add(response);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> editActivity(ActivityElement activity, int id) async {
    try {
      final index = list.indexWhere((element) => element.id == id);
      final response = await _activityNetwork.putActivity(activity, id);
      list[index] = response;
    } catch (e) {
      rethrow;
    }
  }

  goToEditActivity() {
    Get.toNamed(RouteNames.editActivity);
  }

  goToDetailActivity(ActivityElement activity) {
    Get.toNamed(RouteNames.detailActivity, arguments: activity.id);
  }
}
