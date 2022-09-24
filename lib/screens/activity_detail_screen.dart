import 'package:activities_app/controllers/activity_detail_controller.dart';
import 'package:activities_app/utils/datetime_utils.dart';
import 'package:activities_app/widgets/reusable_button.dart';
import 'package:activities_app/widgets/reusable_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ActivityDetailScreen extends StatelessWidget {
  ActivityDetailScreen({Key? key}) : super(key: key);

  ActivityDetailController activityDetailController =
      Get.put(ActivityDetailController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Activity Info'),
      ),
      body: Obx(() {
        final activity = activityDetailController.activity.value;
        return activityDetailController.isLoading.value
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Details',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                                '${activity.activityType} with ${activity.institution} at ${DateTimeUtils.getDateTime(activity.when)} to discuss about ${activity.objective}'),
                            const SizedBox(height: 8),
                            ReusableButton(
                              onPressed:
                                  activityDetailController.onEditActivity,
                              title: 'Edit Activity',
                              buttonType: ButtonType.primary,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 24),
                      const Text(
                        'What is the result ?',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 8),
                        child: ReusableTextField(
                          hintText:
                              'Customer setuju untuk membeli dalam jumlah banyak',
                          maxLines: 3,
                          keyboardType: TextInputType.multiline,
                        ),
                      ),
                      const SizedBox(height: 8),
                      ReusableButton(
                        height: 60,
                        onPressed: () {},
                        title: 'Complete Activity',
                        buttonType: ButtonType.secondary,
                      ),
                    ],
                  ),
                ),
              );
      }),
    );
  }
}
