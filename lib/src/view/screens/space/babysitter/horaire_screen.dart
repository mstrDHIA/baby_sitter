/*import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:babysitter_v1/src/view/controllers/babysitter/horaire_controller.dart';
import 'package:babysitter_v1/src/view/screens/space/widgets/register_steps.dart';
import 'package:babysitter_v1/src/view/screens/space/widgets/title_baby.dart';
import 'package:babysitter_v1/src/view/screens/widget/logo_text_card.dart';
import 'package:babysitter_v1/src/view/screens/widget/primary_button.dart';
import 'package:babysitter_v1/src/view/screens/authentification/widgets/auth_input.dart';
import 'package:babysitter_v1/src/view/screens/authentification/widgets/auth_label.dart';

class PlanificationBabySitterTapeThreeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final PlanificationBabysitterController controller = Get.put(PlanificationBabysitterController());

    return SafeArea(
      child: Scaffold(
        body: GetBuilder<PlanificationBabysitterController>(
          builder: (controller) {
            return ListView(
              padding: EdgeInsets.all(20),
              children: [
                Center(
                  child: LogoTextCard(text: "Prendre soin des petits sourires !"),
                ),
                RegisterSteps(nbSteps: 5, currentStep: 4),
                SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                TitleBabyIdentity(title: "Configurer Votre Emploi Du Temps"),
                
                SizedBox(height: 25),
                AuthLabel("Sélectionnez le jour de travail"),
                SizedBox(height: 15),
                Wrap(
                  spacing: 10,
                  children: controller.weekdays.map((weekday) {
                    bool isSelected = controller.selectedDays.contains(weekday);
                    return GestureDetector(
                      onTap: () => _showTimeSelectionDialog(context, controller, weekday),
                      child: Container(
                        decoration: BoxDecoration(
                          color: isSelected ? Color(0xFFA30E39) : Color(0xFFFFCDD2),
                          shape: BoxShape.circle,
                          border: Border.all(color: Color(0xFFA30E39), width: 2),
                        ),
                        padding: EdgeInsets.all(12),
                        child: Text(
                          weekday.substring(0, 3),
                          style: TextStyle(
                            color: isSelected ? Colors.white : Color(0xFFA30E39),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
                SizedBox(height: 30),
              ],
            );
          },
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(15),
          child: PrimaryButton(
            name: "Étape suivante",
            onPressed: () => controller.nextStep(),
          ),
        ),
      ),
    );
  }

  void _showTimeSelectionDialog(BuildContext context, PlanificationBabysitterController controller, String selectedDay) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Sélectionnez les heures de travail pour $selectedDay"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AuthLabel("Début"),
              SizedBox(height: 10),
              GestureDetector(
                onTap: () => controller.selectTime(context, selectedDay, true),
                child: AbsorbPointer( // Prevent the field from opening the keyboard
                  child: AuthInput(
                    hintText: "e.g. 08:00",
                    controller: controller.getStartController(selectedDay),
                  ),
                ),
              ),
              SizedBox(height: 20),
              AuthLabel("Fin"),
              SizedBox(height: 10),
              GestureDetector(
                onTap: () => controller.selectTime(context, selectedDay, false),
                child: AbsorbPointer( // Prevent the field from opening the keyboard
                  child: AuthInput(
                    hintText: "e.g. 17:00",
                    controller: controller.getEndController(selectedDay),
                  ),
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                controller.onDaySelected(selectedDay);
                Navigator.of(context).pop();
              },
              child: Text("OK"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Annuler"),
            ),
          ],
        );
      },
    );
  }
}*/
