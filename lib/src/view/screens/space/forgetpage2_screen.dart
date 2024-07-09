import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:babysitter_v1/src/core/constant/app_color.dart';
import '../widget/logo_text_card.dart';
import '../widget/primary_button.dart';
import '../authentification/widgets/auth_description.dart';
import '../authentification/widgets/auth_label.dart';
import 'package:babysitter_v1/src/view/controllers/forgetpage2_controller.dart';
import '../../../core/constant/app_route.dart';

class ForgetScreen extends StatelessWidget {
  const ForgetScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ForgetController controller = Get.put(ForgetController());
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
                const AuthLabel("Numéro De Téléphone"),
                const SizedBox(height: 10),
                GetBuilder<ForgetController>(
                  builder: (controller) => InternationalPhoneNumberInput(
                    onInputChanged: controller.onPhoneNumberChanged,
                    onInputValidated: controller.onPhoneNumberValidated,
                    selectorConfig: const SelectorConfig(
                      selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                    ),
                    ignoreBlank: false,
                    autoValidateMode: AutovalidateMode.onUserInteraction,
                    initialValue: controller.phoneNumber.value,
                    textFieldController: controller.phoneController,
                    formatInput: false,
                    keyboardType: const TextInputType.numberWithOptions(signed: true, decimal: true),
                    inputDecoration: const InputDecoration(
                      hintText: 'Enter phone number',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(),
                      ),
                    ),
                    onSaved: (PhoneNumber number) {
                      controller.phoneNumber.value = number;
                    },
                  ),
                ),
                const SizedBox(height: 20),
                GetBuilder<ForgetController>(
                  builder: (controller) => PrimaryButton(
                    name: "Confirmer",
                    onPressed: () {
                     // if (!controller.isLoading.value) {
                       // controller.sendResetPasswordSMS();
                        
                     // }
                      Get.toNamed(AppRoute.verification);
                    },
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
