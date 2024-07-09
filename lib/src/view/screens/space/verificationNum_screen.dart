import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../core/constant/app_color.dart';
import '../widget/primary_button.dart';
import '../widget/logo_text_card.dart';
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
                Text(
                  "Vérifiez Votre Boîte SMS",
                  style: Get.textTheme.headlineLarge!.copyWith(fontSize: 25),
                ),
                const SizedBox(height: 20),
                Text(
                  "Entrer Votre Code Envoyé Sur",
                  style: Get.textTheme.bodyLarge!.copyWith(fontSize: 18),
                ),
                const SizedBox(height: 10),
                Text(
                  phoneNumber,
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(5, (index) {
                      return Column(
                        children: [
                          SizedBox(
                            width: 40,
                            child: TextFormField(
                              controller: controller.codeControllers[index],
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              style: const TextStyle(fontSize: 24),
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                              ),
                              onChanged: (value) {
                                if (value.length == 1 && index < 4) {
                                  FocusScope.of(context).nextFocus();
                                } else if (value.isEmpty && index > 0) {
                                  FocusScope.of(context).previousFocus();
                                }
                              },
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return '';
                                }
                                return null;
                              },
                            ),
                          ),
                          Container(
                            height: 2,
                            width: 30,
                            color: Colors.black,
                          ),
                        ],
                      );
                    }),
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
                      style: TextStyle(
                        color: controller.countdown == 0 ? AppColor.primaryColor : AppColor.blueGray900,
                      ),
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
