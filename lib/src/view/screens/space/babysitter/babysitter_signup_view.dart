import 'package:babysitter_v1/src/core/constant/app_route.dart';
import 'package:babysitter_v1/src/core/functions/valid_input.dart';
import 'package:babysitter_v1/src/view/controllers/babysitter/babysitter_signup_controller.dart';
import 'package:babysitter_v1/src/view/screens/authentification/login_screen.dart';
import 'package:babysitter_v1/src/view/screens/authentification/widgets/auth_description.dart';
import 'package:babysitter_v1/src/view/screens/authentification/widgets/auth_input.dart';
import 'package:babysitter_v1/src/view/screens/authentification/widgets/auth_label.dart';
import 'package:babysitter_v1/src/view/screens/widget/logo_text_card.dart';
import 'package:babysitter_v1/src/view/screens/widget/password_icon.dart';
import 'package:babysitter_v1/src/view/screens/widget/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final RegisterController controller = Get.put(RegisterController());
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
          child: Form(
            key: controller.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Center(child: LogoTextCard(text: "Caring for Little Smiles!")),
                const SizedBox(height: 5),
                const Text(
                  "           Créer Un Compte",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 10),
                const AuthDescription(
                  "Cette étape est appropriée pour sélectionner votre propre espace.",
                ),
                const SizedBox(height: 30),
                const AuthLabel("Votre Genre"),
                Row(
                  children: [
                    Obx(() => Radio(
                      value: 'Femme',
                      groupValue: controller.gender.value,
                      onChanged: (value) {
                        controller.gender.value = value!;
                      },
                    )),
                    const Text('Femme'),
                    Obx(() => Radio(
                      value: 'Homme',
                      groupValue: controller.gender.value,
                      onChanged: (value) {
                        controller.gender.value = value!;
                      },
                    )),
                    const Text('Homme'),
                  ],
                ),
                const AuthLabel("Nom"),
                const SizedBox(height: 10),
                AuthInput(
                  hintText: "Nom",
                  controller: controller.nameController,
                  validator: (value) => validInput(value!, 1, 50, "name"),
                ),
                const SizedBox(height: 12),
                const AuthLabel("Prénom"),
                const SizedBox(height: 10),
                AuthInput(
                  hintText: "Prénom",
                  controller: controller.surnameController,
                  validator: (value) => validInput(value!, 1, 50, "surname"),
                ),
                const SizedBox(height: 12),
                const AuthLabel("Votre Date De Naissance"),
                GestureDetector(
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1900),
                      lastDate: DateTime.now(),
                    );
                    if (pickedDate != null) {
                      String formattedDate = "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
                      controller.dateController.text = formattedDate;
                    }
                  },
                  child: AbsorbPointer(
                    child: AuthInput(
                      hintText: "Votre Date De Naissance",
                      controller: controller.dateController,
                      validator: (value) => validInput(value!, 1, 50, "name"),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                // Implement date picker input here
                const AuthLabel("Numéro de téléphone"),
                const SizedBox(height: 10),
                AuthInput(
                  hintText: "Numéro de téléphone",
                  controller: controller.phoneController,
                  keyboardType: TextInputType.phone,
                  validator: (value) => validInput(value!, 10, 15, "phone"),
                ),
                const SizedBox(height: 12),
                const AuthLabel("Email"),
                const SizedBox(height: 10),
                AuthInput(
                  hintText: "youremail@gmail.com",
                  controller: controller.emailController,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) => validInput(value!, 6, 50, "email"),
                ),
                const SizedBox(height: 12),
                const AuthLabel("Mot de passe"),
                const SizedBox(height: 10),
                Obx(() => AuthInput(
                  hintText: "************",
                  controller: controller.passwordController,
                  validator: (value) => validInput(value!, 4, 25, "password"),
                  obscure: !controller.isShowPassword.value,
                  suffix: PasswordIcon(
                    icon: controller.isShowPassword.value
                        ? Icons.visibility
                        : Icons.visibility_off,
                    onTap: () => controller.handleShowPassword(),
                  ),
                )),
                const SizedBox(height: 12),
                const AuthLabel("Confirme mot de passe"),
                const SizedBox(height: 10),
                AuthInput(
                  hintText: "************",
                  controller: controller.confirmPasswordController,
                  validator: (value) {
                    if (value != controller.passwordController.text) {
                      return "Les mots de passe ne correspondent pas";
                    }
                    return validInput(value!, 4, 25, "password");
                  },
                  obscure: !controller.isShowPassword.value,
                ),
               const SizedBox(height: 25),
                Obx(() => PrimaryButton(
                  name: "register",
                  onPressed: ()  {
                     controller.register();
                   
                    },
                 
                  loading: controller.isLoading.value,
                )),
                 const SizedBox(height: 25),
                // Obx(() => PrimaryButton(
                //   name: "continuer",
                //   onPressed: ()  {
                //   Get.offNamed(AppRoute.espace);
                   
                //     },
                 
                //   loading: controller.isLoading.value,
                // )),
                const SizedBox(height: 15),
                Align(
                  alignment: Alignment.center,
                  child: GestureDetector(
                    onTap: () {
                      Get.off(LoginScreen());
                    },
                    child: const Text(
                      "Vous avez un compte ? Connectez-vous",
                      style: TextStyle(
                        color: Colors.grey,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
