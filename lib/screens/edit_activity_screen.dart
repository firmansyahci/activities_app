import 'package:activities_app/controllers/edit_activity_controller.dart';
import 'package:activities_app/widgets/option_bottom_sheet.dart';
import 'package:activities_app/widgets/reusable_bottom_sheet.dart';
import 'package:activities_app/widgets/reusable_button.dart';
import 'package:activities_app/widgets/reusable_dialog.dart';
import 'package:activities_app/widgets/reusable_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditActivityScreen extends StatelessWidget {
  EditActivityController editActivityController =
      Get.put(EditActivityController());

  EditActivityScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(editActivityController.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Form(
          key: editActivityController.form,
          child: ListView(
            children: [
              const Text(
                'What do you want to do ?',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 16),
                child: ReusableTextField(
                  controller: editActivityController.activityTypeController,
                  hintText: 'Meeting or Calling',
                  suffixIcon: const Icon(Icons.keyboard_arrow_down),
                  readOnly: true,
                  validator: (value) =>
                      editActivityController.onValidate(value),
                  onTap: () => ReusableBottomSheet.show(
                    OptionBottomSheet(
                      data: editActivityController.activityType,
                      onTap: (String? selected) => editActivityController
                          .onSelectedActivityType(selected),
                      selectedData:
                          editActivityController.activityTypeController.text,
                    ),
                  ),
                ),
              ),
              const Text(
                'Who do you want to meet/call ?',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 16),
                child: ReusableTextField(
                  controller: editActivityController.institutionController,
                  hintText: 'CV Anugrah Jaya',
                  maxLines: 1,
                  suffixIcon: const Icon(Icons.search),
                  textInputAction: TextInputAction.next,
                  validator: (value) =>
                      editActivityController.onValidate(value),
                ),
              ),
              const Text(
                'When do you want to meet/call CV Anugrah Jaya ?',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 16),
                child: ReusableTextField(
                  controller: editActivityController.whenController,
                  hintText: 'dd-MMM-yyyy HH:mm',
                  suffixIcon: const Icon(Icons.date_range),
                  readOnly: true,
                  validator: (value) =>
                      editActivityController.onValidate(value),
                  onTap: () => editActivityController.showCalendar(context),
                ),
              ),
              const Text(
                'Why do you want to meet/call CV Anugrah Jaya ?',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 16),
                child: ReusableTextField(
                  controller: editActivityController.objectiveController,
                  hintText: 'New Order, Invoice, New Leads',
                  maxLines: 1,
                  suffixIcon: const Icon(Icons.keyboard_arrow_down),
                  textInputAction: TextInputAction.next,
                  validator: (value) =>
                      editActivityController.onValidate(value),
                ),
              ),
              const Text(
                'Could you describe it more details ?',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 16),
                child: ReusableTextField(
                  controller: editActivityController.remarksController,
                  hintText: 'Placeholder',
                  maxLines: 3,
                  keyboardType: TextInputType.multiline,
                  validator: (value) =>
                      editActivityController.onValidate(value),
                ),
              ),
              const SizedBox(height: 8),
              ReusableButton(
                height: 60,
                onPressed: editActivityController.onSubmit,
                title: 'Submit',
                buttonType: ButtonType.secondary,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
