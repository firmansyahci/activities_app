import 'package:activities_app/controllers/home_content_controller.dart';
import 'package:activities_app/models/activity.dart';
import 'package:activities_app/services/app_exception.dart';
import 'package:activities_app/utils/datetime_utils.dart';
import 'package:activities_app/widgets/reusable_dialog.dart';
import 'package:activities_app/widgets/reusable_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditActivityController extends GetxController {
  HomeContentController? _homeContentController;
  ActivityElement? arguments;

  final List<String> activityType = ['Meeting', 'Calling'];

  String title = 'New Activity';

  DateTime? when;

  late TextEditingController activityTypeController;
  late TextEditingController institutionController;
  late TextEditingController whenController;
  late TextEditingController objectiveController;
  late TextEditingController remarksController;

  final form = GlobalKey<FormState>();

  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    _homeContentController = Get.find<HomeContentController>();
    activityTypeController = TextEditingController();
    institutionController = TextEditingController();
    whenController = TextEditingController();
    objectiveController = TextEditingController();
    remarksController = TextEditingController();
    if (Get.arguments != null) {
      arguments = Get.arguments;

      title = 'Edit Activity';

      activityTypeController.text = arguments!.activityType ?? '';
      institutionController.text = arguments!.institution ?? '';
      when = arguments!.when;
      whenController.text = DateTimeUtils.getDateTime(when);
      objectiveController.text = arguments!.objective ?? '';
      remarksController.text = arguments!.remarks ?? '';
    }
  }

  @override
  void dispose() {
    activityTypeController.dispose();
    institutionController.dispose();
    whenController.dispose();
    objectiveController.dispose();
    remarksController.dispose();
    super.dispose();
  }

  showCalendar(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2020),
        lastDate: DateTime(2050));

    if (pickedDate != null) {
      TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );

      if (pickedTime != null) {
        onSelectedDate(DateTime(
          pickedDate.year,
          pickedDate.month,
          pickedDate.day,
          pickedTime.hour,
          pickedTime.minute,
        ));
      }
    }
  }

  onSelectedDate(DateTime? pickedDate) {
    when = pickedDate;
    whenController.text = DateTimeUtils.getDateTime(pickedDate);
  }

  onSelectedActivityType(String? pickedActivityType) {
    activityTypeController.text = pickedActivityType ?? '';

    Get.back();
  }

  onValidate(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please provide a value';
    }
    return null;
  }

  Future<void> onSubmit() async {
    final isValid = form.currentState?.validate() ?? false;
    if (!isValid) {
      return;
    }
    ReusableDialog.showLoading();
    final ActivityElement newActivity = ActivityElement(
      id: arguments != null ? arguments!.id : null,
      activityType: activityTypeController.text,
      institution: institutionController.text,
      when: when,
      objective: objectiveController.text,
      remarks: remarksController.text,
    );
    if (arguments != null) {
      try {
        await _homeContentController?.editActivity(newActivity, arguments!.id!);

        ReusableDialog.hideLoading();
        Get.back(result: newActivity);
      } catch (e) {
        ReusableDialog.hideLoading();
        final error = e as AppException;
        ReusableSnackbar.error(error.message!);
      }
    } else {
      try {
        await _homeContentController?.addActivity(newActivity);

        ReusableDialog.hideLoading();
        Get.back();
      } catch (e) {
        ReusableDialog.hideLoading();
        final error = e as AppException;
        ReusableSnackbar.error(error.message!);
      }
    }
  }
}
