import 'package:babysitter_v1/src/view/screens/widget/logo_text_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constant/app_color.dart';
import '../widget/primary_button.dart';
import 'package:babysitter_v1/src/view/controllers/verificationNum_controller.dart';


class VerificationScreen extends StatelessWidget {
  final String phoneNumber;

  VerificationScreen({required this.phoneNumber});

  @override
  Widget build(BuildContext context) {
    final VerificationController controller = Get.put(VerificationController());
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: controller.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Center(child: LogoTextCard(text: "Caring for Little Smiles!")),
                const SizedBox(height: 10),
                // TextStyle(fontSize: 24, fontWeight: FontWeight.bold)
                 Text("Vérifiez Votre Boîte SMS", style: Get.textTheme.headlineLarge!.copyWith(
                  fontSize: 25
                 )),
                const SizedBox(height: 20),
                 Text("Entrer Votre Code Envoyé Sur", style: Get.textTheme.bodyLarge!.copyWith(fontSize: 18)),
                const SizedBox(height: 10),
                Text(phoneNumber, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: TextFormField(
                    controller: controller.codeController,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 24, letterSpacing: 8),
                    decoration: const InputDecoration(
                      hintText: '-----',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.length != 5) {
                        return 'Code invalide';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(height: 20),
                GetBuilder<VerificationController>(
                  builder: (controller) => Text(
                    'Vous Ne Recevez Pas Un Code ?',
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
                GetBuilder<VerificationController>(
                  builder: (controller) => TextButton(
                    onPressed: controller.countdown == 0 ? controller.resendCode : null,
                    child: Text(
                      controller.countdown == 0
                          ? 'Renvoyer Le Code'
                          : 'Renvoyer Le Code Dans ${controller.countdown}',
                      style: TextStyle(color: controller.countdown == 0 ? AppColor.primaryColor : AppColor.blueGray900),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                GetBuilder<VerificationController>(
                  builder: (controller) => PrimaryButton(
                    name: "Confirmer",
                    onPressed: () {
                      if (!controller.isLoading) {
                        controller.verifyCode();
                      }
                    },
                    loading: controller.isLoading,
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
