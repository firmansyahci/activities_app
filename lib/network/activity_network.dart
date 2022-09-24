import 'package:activities_app/models/activity.dart';
import 'package:activities_app/services/base_client.dart';

class ActivityNetwork {
  final _baseClient = BaseClient();

  Future<Activity> getAllActivities() async {
    try {
      final response = await _baseClient.get('/activities');
      return activityFromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  Future<ActivityElement> getActivityById(int id) async {
    try {
      final response = await _baseClient.get('/activities/$id');
      return activityElementFromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  Future<ActivityElement> postActivity(ActivityElement data) async {
    try {
      final response =
          await _baseClient.post('/activities', activityElementToJson(data));

      return activityElementFromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  Future<ActivityElement> putActivity(ActivityElement data, int id) async {
    try {
      final response =
          await _baseClient.put('/activities/$id', activityElementToJson(data));

      return activityElementFromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}
