import 'package:activities_app/consts/app_colors.dart';
import 'package:activities_app/controllers/home_content_controller.dart';
import 'package:activities_app/models/activity.dart';
import 'package:activities_app/utils/datetime_utils.dart';
import 'package:activities_app/widgets/activity_item.dart';
import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import 'package:get/get.dart';

class HomeContentScreen extends StatefulWidget {
  const HomeContentScreen({Key? key}) : super(key: key);

  @override
  State<HomeContentScreen> createState() => _HomeContentScreenState();
}

class _HomeContentScreenState extends State<HomeContentScreen> {
  HomeContentController homeContentController =
      Get.put(HomeContentController());

  Map<String, List<ActivityElement>>? groupList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Activities'),
        bottom: PreferredSize(
          preferredSize: const Size(double.infinity, 70),
          child: Container(
            height: 70,
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      color: AppColors.white,
                    ),
                    child: const Center(
                        child: Text(
                      'Open',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    )),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.white),
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: const Center(
                      child: Text(
                        'Complete',
                        style: TextStyle(
                          color: AppColors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(
          Icons.add,
          size: 36,
        ),
        onPressed: homeContentController.goToEditActivity,
      ),
      body: Obx(() {
        if (homeContentController.isLoading.value) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          homeContentController.list
              .sort(((a, b) => a.when!.compareTo(b.when!)));
          groupList = homeContentController.list.groupListsBy((element) {
            return DateTimeUtils.getDateTimeWithDayName(element.when);
          });
          return RefreshIndicator(
            onRefresh: homeContentController.getActivites,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView.builder(
                  itemCount: groupList?.length,
                  itemBuilder: (ctx, i) {
                    String? keys = groupList?.keys.elementAt(i);
                    List<ActivityElement>? values =
                        groupList?.values.elementAt(i) ?? [];
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          keys ?? '',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Column(
                          children: values.map(
                            (activity) {
                              return ActivityItem(
                                activity: activity,
                                onTap: () => homeContentController
                                    .goToDetailActivity(activity),
                              );
                            },
                          ).toList(),
                        ),
                        const SizedBox(height: 16),
                      ],
                    );
                  }),
            ),
          );
        }
      }),
    );
  }
}
