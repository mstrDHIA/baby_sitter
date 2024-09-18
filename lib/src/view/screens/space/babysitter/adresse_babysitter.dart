import 'package:babysitter_v1/src/core/constant/app_route.dart';
import 'package:babysitter_v1/src/core/functions/valid_input.dart';
import 'package:babysitter_v1/src/view/controllers/babysitter/adressebabysitter_controller.dart';
import 'package:babysitter_v1/src/view/screens/authentification/widgets/auth_input.dart';
import 'package:babysitter_v1/src/view/screens/authentification/widgets/auth_label.dart';
import 'package:babysitter_v1/src/view/screens/widget/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

const List<String> governorates = [
  'Tunis', 'Ariana', 'Ben Arous', 'Manouba', 'Nabeul', 'Zaghouan',
  'Bizerte', 'Béja', 'Jendouba', 'Le Kef', 'Siliana', 'Sousse',
  'Monastir', 'Mahdia', 'Sfax', 'Kairouan', 'Kasserine', 'Sidi Bouzid',
  'Gabès', 'Mednine', 'Tataouine', 'Gafsa', 'Tozeur', 'Kébili'
];

class AdresseBabysitterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AdresseBabysitterController>(
      init: AdresseBabysitterController(),
      builder: (controller) {
        return Scaffold(
          body: ListView(
            children: [
              Image.network(
                "https://www.tourmag.com/photo/art/grande/8599774-13555214.jpg?v=1448986872",
                fit: BoxFit.cover,
                height: MediaQuery.sizeOf(context).height * .45,
                width: MediaQuery.sizeOf(context).width,
              ),
              Form(
                key: controller.formKey,
                child: Padding(
                  padding: EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Entrer votre adresse détaillée",
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(height: 15),
                      AuthLabel("Adresse"),
                      SizedBox(height: 10),
                      AuthInput(
                        hintText: "e.g. 53, rue de la paix",
                        controller: controller.adresseController,
                        validator: (value) => validAdresse(value),
                      ),
                      SizedBox(height: 10),
                      AuthLabel("Numéro postal*"),
                      SizedBox(height: 10),
                      AuthInput(
                        hintText: "e.g. 8011",
                        controller: controller.postaleController,
                        keyboardType: TextInputType.number,
                        validator: (value) => validZipCode(value),
                      ),
                      SizedBox(height: 10),
                      AuthLabel("Dépendance"),
                      SizedBox(height: 10),
                      InputDecorator(
                        decoration: InputDecoration(
                          hintText: "Sélectionnez votre dépendance",
                          contentPadding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            value: controller.selectedDependance,
                            isDense: true,
                            onChanged: (newValue) {
                              controller.setDependance(newValue);
                            },
                            items: governorates.map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                      SizedBox(height: 25),
                    ],
                  ),
                ),
              ),
            ],
          ),
          bottomNavigationBar: Padding(
            padding: EdgeInsets.all(15),
            child: PrimaryButton(
              name: "Étape suivante",
              onPressed: () {
                // Call the controller's nextStep method
                controller.nextStep(context);
              },
              isSecondary: true,
              
              //loading: controller.isLoading,
            ),
          ),
        );
      },
    );
  }
}
