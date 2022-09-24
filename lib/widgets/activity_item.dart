import 'package:activities_app/consts/app_colors.dart';
import 'package:activities_app/models/activity.dart';
import 'package:activities_app/utils/datetime_utils.dart';
import 'package:flutter/material.dart';

class ActivityItem extends StatelessWidget {
  final ActivityElement? activity;
  final VoidCallback? onTap;
  const ActivityItem({this.activity, this.onTap, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                DateTimeUtils.getTime(activity?.when),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Container(
                  height: 40,
                  padding: const EdgeInsets.symmetric(
                    vertical: 4,
                    horizontal: 8,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: AppColors.steelBlue,
                  ),
                  child: Text(
                    '${activity?.activityType} with ${activity?.institution}',
                    style: const TextStyle(
                      color: AppColors.white,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ],
          ),
          const Divider(color: AppColors.grey),
        ],
      ),
    );
  }
}
