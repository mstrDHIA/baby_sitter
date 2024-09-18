import 'package:babysitter_v1/src/core/constant/app_route.dart';
import 'package:babysitter_v1/src/view/controllers/resetpassword_controller.dart';
import 'package:babysitter_v1/src/view/screens/authentification/widgets/auth_description.dart';
import 'package:babysitter_v1/src/view/screens/authentification/widgets/auth_input.dart';
import 'package:babysitter_v1/src/view/screens/authentification/widgets/auth_label.dart';
import 'package:babysitter_v1/src/view/screens/space/resetpasswordsucsses_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/functions/valid_input.dart';

import '../widget/logo_text_card.dart';
import '../widget/password_icon.dart';
import '../widget/primary_button.dart';




class ResetPasswordView extends StatelessWidget {
  const ResetPasswordView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ResetPasswordController controller = Get.put(ResetPasswordController());
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
          child: Form(
            key: GlobalKey<FormState>(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Center(child: LogoTextCard(text: "Caring for Little Smiles!")),
                const SizedBox(height: 10),
                const Text(
                  "Nouveau Mot De Passe",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
                const SizedBox(height: 10),
                const AuthDescription(
                  "Veuillez Saisir Le Nouveau Mot De Passe Et Le Confirmer.",
                ),
                const SizedBox(height: 30),
                const AuthLabel("Nouveau Mot De Passe"),
                const SizedBox(height: 10),
                GetBuilder<ResetPasswordController>(
                  builder: (controller) => AuthInput(
                    hintText: "************",
                    controller: controller.newPasswordController,
                    validator: (value) => validInput(value!, 6, 50, "password"),
                    obscure: !controller.isShowNewPassword.value,
                    suffix: PasswordIcon(
                      icon: controller.isShowNewPassword.value
                          ? Icons.visibility
                          : Icons.visibility_off,
                      onTap: () => controller.handleShowNewPassword(),
                    ),
                    readOnly: controller.isLoading.value,
                  ),
                ),
                const SizedBox(height: 12),
                const AuthLabel("Mot De Passe Confirmer"),
                const SizedBox(height: 10),
                GetBuilder<ResetPasswordController>(
                  builder: (controller) => AuthInput(
                    hintText: "************",
                    controller: controller.confirmPasswordController,
                    validator: (value) => validInput(value!, 6, 50, "password"),
                    obscure: !controller.isShowConfirmPassword.value,
                    suffix: PasswordIcon(
                      icon: controller.isShowConfirmPassword.value
                          ? Icons.visibility
                          : Icons.visibility_off,
                      onTap: () => controller.handleShowConfirmPassword(),
                    ),
                    readOnly: controller.isLoading.value,
                  ),
                ),
                const SizedBox(height: 25),
                GetBuilder<ResetPasswordController>(
                  builder: (controller) => PrimaryButton(
                    name: "Confirmer",
                    
                    onPressed: () {
                       Get.to(ResetPasswordSuccessView());
                      //if (!controller.isLoading.value) {
                        //controller.resetPassword();
                     // }
                    },
                    loading: controller.isLoading.value,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
