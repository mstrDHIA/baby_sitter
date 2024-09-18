import 'package:babysitter_v1/src/view/controllers/babysitter/tarif_controller.dart';
import 'package:babysitter_v1/src/view/screens/space/babysitter/home_page_screen.dart';
import 'package:babysitter_v1/src/view/screens/space/widgets/count_row.dart';
import 'package:babysitter_v1/src/view/screens/space/widgets/register_steps.dart';
import 'package:babysitter_v1/src/view/screens/space/widgets/title_baby.dart';
import 'package:babysitter_v1/src/view/screens/widget/logo_text_card.dart';
import 'package:babysitter_v1/src/view/screens/widget/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TarifScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<PlanificationController>(
      init: PlanificationController(),
      builder: (controller) {
        return SafeArea(
          child: Scaffold(
            body: ListView(
              padding: EdgeInsets.all(15),
              children: [
                Center(
                  child: LogoTextCard(
                    text: "Prendre soin des petits sourires !",
                  ),
                ),
                RegisterSteps(nbSteps: 5, currentStep: 5),
                SizedBox(height: MediaQuery.of(context).size.height * .06),
                TitleBabyIdentity(title: "Configurer votre coût horaire"),
                SizedBox(height: 30),
                CoutEnfantRow(
                  title: "1 enfant",
                  controller: controller.coutEnfant1,
                  readOnly: controller.isDisabled,
                ),
                SizedBox(height: 10),
                CoutEnfantRow(
                  title: "2 enfants",
                  controller: controller.coutEnfant2,
                  readOnly: controller.isDisabled,
                ),
                SizedBox(height: 10),
                CoutEnfantRow(
                  title: "3 enfants",
                  controller: controller.coutEnfant3,
                  readOnly: controller.isDisabled,
                ),
                SizedBox(height: 10),
                CoutEnfantRow(
                  title: "4 enfants",
                  controller: controller.coutEnfant4,
                  readOnly: controller.isDisabled,
                ),
                SizedBox(height: 10),
                CoutEnfantRow(
                  title: "5 enfants",
                  controller: controller.coutEnfant5,
                  readOnly: controller.isDisabled,
                ),
              ],
            ),
            bottomNavigationBar: Container(
              padding: EdgeInsets.all(15),
              child: PrimaryButton(
                name: "Étape suivante",
                onPressed: () async {
                  controller.nextStep(context);
                  if (!controller.isDisabled) {
                    Get.dialog(
                      AlertDialog(
                        title: Text("Inscription réussie"),
                        content: Text("Vous êtes inscrit avec succès !"),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Get.back(); 
                              Get.offAll(ProfileScreen  ()); 
                            },
                            child: Text("Terminer"),
                          ),
                        ],
                      ),
                      barrierDismissible: false,
                    );
                  }
                },
                disabled: controller.isDisabled,
                loading: controller.isLoading,
              ),
            ),
          ),
        );
      },
    );
  }
}
