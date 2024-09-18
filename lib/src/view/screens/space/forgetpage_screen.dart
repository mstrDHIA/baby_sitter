import 'package:babysitter_v1/src/view/screens/space/forgetpage2_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/functions/valid_input.dart';
import '../authentification/widgets/auth_description.dart';
import '../authentification/widgets/auth_input.dart';
import '../authentification/widgets/auth_label.dart';
import '../widget/logo_text_card.dart';
import '../widget/primary_button.dart';
import '../../../core/constant/app_color.dart';
import 'package:babysitter_v1/src/view/controllers/forgetpage_controller.dart';
import'package:babysitter_v1/src/core/constant/app_route.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ForgetPasswordController controller = Get.put(ForgetPasswordController());
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: controller.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Center(child: LogoTextCard(text: "Caring for Little Smiles!")),
                const Center(child: Text("Mots De Passe Oublié")),
                const SizedBox(height: 10),
                const AuthDescription(
                  "Choisir Par Quelle Plateforme Vous Pouvez Réinitialiser Votre Mot De Passe",
                ),
                const SizedBox(height: 30),
                const AuthLabel("Email"),
                const SizedBox(height: 10),
                GetBuilder<ForgetPasswordController>(
                  builder: (controller) => AuthInput(
                    hintText: "e.g. john@mail.com",
                    controller: controller.emailController,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) => validInput(value!, 6, 50, "email"),
                    readOnly: controller.isLoading.value,
                  ),
                ),
                const SizedBox(height: 20),
                GetBuilder<ForgetPasswordController>(
                  builder: (controller) => PrimaryButton(
                    name: "Envoyer",
                    onPressed: () {
                      Get.to(ForgetScreen());
                      
                      if (!controller.isLoading.value) {
                        controller.sendResetPasswordEmail();
                      }
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
