import 'dart:convert';

Activity activityFromJson(String str) => Activity.fromJson(json.decode(str));

String activityToJson(Activity data) => json.encode(data.toJson());

class Activity {
  Activity({
    this.activities,
  });

  List<ActivityElement>? activities;

  factory Activity.fromJson(Map<String, dynamic> json) => Activity(
        activities: json["activities"] == null
            ? null
            : List<ActivityElement>.from(
                json["activities"].map((x) => ActivityElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "activities": activities == null
            ? null
            : List<dynamic>.from(activities!.map((x) => x.toJson())),
      };
}

ActivityElement activityElementFromJson(String str) =>
    ActivityElement.fromJson(json.decode(str));

dynamic activityElementToJson(ActivityElement data) =>
    json.encode(data.toJson());

class ActivityElement {
  ActivityElement({
    this.id,
    this.activityType,
    this.institution,
    this.when,
    this.objective,
    this.remarks,
  });

  int? id;
  String? activityType;
  String? institution;
  DateTime? when;
  String? objective;
  String? remarks;

  factory ActivityElement.fromJson(Map<String, dynamic> json) =>
      ActivityElement(
        id: json["id"],
        activityType: json["activityType"],
        institution: json["institution"],
        when: json["when"] == null
            ? null
            : DateTime.parse(json["when"]).toLocal(),
        objective: json["objective"],
        remarks: json["remarks"],
      );

  Map<String, dynamic> toJson() => {
        "activityType": activityType,
        "institution": institution,
        "when": when?.toUtc().toIso8601String(),
        "objective": objective,
        "remarks": remarks,
      };
}
