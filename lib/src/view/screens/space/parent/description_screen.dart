import 'package:babysitter_v1/src/core/constant/app_route.dart';
import 'package:babysitter_v1/src/core/constant/app_theme.dart';
import 'package:babysitter_v1/src/view/controllers/babysitter/description_controller.dart';
import 'package:babysitter_v1/src/view/controllers/parent/parent_description_controller.dart';
import 'package:babysitter_v1/src/view/screens/authentification/widgets/auth_input.dart';
import 'package:babysitter_v1/src/view/screens/authentification/widgets/auth_label.dart';
import 'package:babysitter_v1/src/view/screens/space/widgets/register_steps.dart';
import 'package:babysitter_v1/src/view/screens/widget/custon_radio.dart';
import 'package:babysitter_v1/src/view/screens/widget/logo_text_card.dart';
import 'package:babysitter_v1/src/view/screens/widget/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class ParentDescriptionScreen extends StatelessWidget {
  final ParentDescriptionController controller = Get.put(ParentDescriptionController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DescriptionController>(
      builder: (_) {
        return SafeArea(
          child: Scaffold(
            body: Form(
              key: controller.formKey,
              child: ListView(
                padding: EdgeInsets.all(20),
                children: [
                  Center(
                    child: LogoTextCard(text: "Prendre soin des petits sourires !"),
                  ),
                  RegisterSteps(nbSteps: 5, currentStep: 2),
                  SizedBox(height: 25),
                  Text(
                    "Dites-nous à votre sujet",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleLarge!
                        .copyWith(fontFamily: "Popins", fontSize: 16),
                  ),
                  SizedBox(height: 40),
                  AuthLabel("Description"),
                  SizedBox(height: 10),
                  AuthInput(
                    hintText: "e.g. Les activitees des enfants, des besoins specifique ...",
                    controller: controller.descriptionController,
                    maxLines: 5,
                  ),
                  SizedBox(height: 10),
                  AuthLabel("Nombre des enfants"),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: controller.experienceController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "e.g. 5",
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Champ obligatoire";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 15),
                  // AuthLabel("Effectue des gardes d'enfants"),
                  // SizedBox(height: 5),
                  // Row(
                  //   children: [
                  //     CustomRadio(
                  //       text: "Non",
                  //       value: "Non",
                  //       groupValue: controller.selectedGarde,
                  //       onChange: (value) => controller.handleGarde(value!),
                  //     ),
                  //     SizedBox(width: 20),
                  //     CustomRadio(
                  //       text: "Oui",
                  //       value: "Oui",
                  //       groupValue: controller.selectedGarde,
                  //       onChange: (value) => controller.handleGarde(value!),
                  //     ),
                  //   ],
                  // ),
                  SizedBox(height: 10),
                  AuthLabel("Langue maternelle"),
                  SizedBox(height: 10),
                  DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Sélectionner la langue maternelle",
                    ),
                    value: controller.selectedLangueMaternelle,
                    items: controller.langues
                        .map((langue) => DropdownMenuItem(
                              value: langue,
                              child: Text(langue),
                            ))
                        .toList(),
                    onChanged: controller.onSelectLangueMaternelle,
                    validator: (value) =>
                        value == null ? "Champ obligatoire" : null,
                  ),
                  // SizedBox(height: 10),
                  // AuthLabel("Autre Langue"),
                  // SizedBox(height: 10),
                  // DropdownButtonFormField<String>(
                  //   decoration: InputDecoration(
                  //     border: OutlineInputBorder(),
                  //     hintText: "Sélectionner une autre langue",
                  //   ),
                  //   value: controller.selectedLangueAutre,
                  //   items: controller.langues
                  //       .map((langue) => DropdownMenuItem(
                  //             value: langue,
                  //             child: Text(langue),
                  //           ))
                  //       .toList(),
                  //   onChanged: controller.onSelectLangueAutre,
                  //   validator: (value) =>
                  //       value == null ? "Champ obligatoire" : null,
                  // ),
                  SizedBox(height: 25),
                ],
              ),
            ),
            bottomNavigationBar: Padding(
              padding: EdgeInsets.all(15),
              child: PrimaryButton(
                name: "Étape suivante",
                onPressed: () => //Get.toNamed(AppRoute.cin) ,
                controller.nextStep(context),
                isSecondary: true,
               // disabled: controller.isDisabled,
                 //loading: controller.isLoading,
              ),
            ),
          ),
        );
      },
    );
  }
}
