import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/functions/valid_input.dart';
import '../authentification/widgets/auth_description.dart';
import '../authentification/widgets/auth_input.dart';
import '../authentification/widgets/auth_label.dart';
import '../widget/custom_outlined_button.dart';
import '../widget/logo_text_card.dart';
import '../widget/password_icon.dart';
import '../widget/primary_button.dart';
import '../../../core/constant/app_color.dart';
import 'package:babysitter_v1/src/view/controllers/inscription_controller.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final RegisterController controller = Get.put(RegisterController());
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
                const Center(child: Text("Créer Un Compte")),
                const SizedBox(height: 10),
                const AuthDescription(
                  "Cette étape est appropriée pour sélectionner votre propre espace.",
                ),
                const SizedBox(height: 30),
                const AuthLabel("Nom"),
                const SizedBox(height: 10),
                GetBuilder<RegisterController>(
                  builder: (controller) => AuthInput(
                    hintText: "Nom",
                    controller: controller.nameController,
                    validator: (value) => validInput(value!, 3, 50, "text"), // Ajout des arguments nécessaires
                    readOnly: controller.isLoading,
                  ),
                ),
                const SizedBox(height: 12),
                const AuthLabel("Prénom"),
                const SizedBox(height: 10),
                GetBuilder<RegisterController>(
                  builder: (controller) => AuthInput(
                    hintText: "Prénom",
                    controller: controller.firstNameController,
                    validator: (value) => validInput(value!, 3, 50, "text"), // Ajout des arguments nécessaires
                    readOnly: controller.isLoading,
                  ),
                ),
                const SizedBox(height: 12),
                const AuthLabel("Email"),
                const SizedBox(height: 10),
                GetBuilder<RegisterController>(
                  builder: (controller) => AuthInput(
                    hintText: "e.g. john@mail.com",
                    controller: controller.emailController,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) => validInput(value!, 6, 50, "email"), // Ajout des arguments nécessaires
                    readOnly: controller.isLoading,
                  ),
                ),
                const SizedBox(height: 12),
                const AuthLabel("Mot de passe"),
                const SizedBox(height: 10),
                GetBuilder<RegisterController>(
                  builder: (controller) => AuthInput(
                    hintText: "e.g. *********",
                    controller: controller.passwordController,
                    validator: (value) => validInput(value!, 4, 25, "password"), // Ajout des arguments nécessaires
                    obscure: !controller.isShowPassword,
                    suffix: PasswordIcon(
                      icon: controller.isShowPassword ? Icons.visibility : Icons.visibility_off,
                      onTap: () => controller.handleShowPassword(),
                    ),
                    readOnly: controller.isLoading,
                  ),
                ),
                const SizedBox(height: 12),
                const AuthLabel("Confirme mot de passe"),
                const SizedBox(height: 10),
                GetBuilder<RegisterController>(
                  builder: (controller) => AuthInput(
                    hintText: "e.g. *********",
                    controller: controller.confirmPasswordController,
                    validator: (value) => validConfirmPassword(value!, controller.passwordController.text), // Validation du mot de passe confirmé
                    obscure: !controller.isShowConfirmPassword,
                    suffix: PasswordIcon(
                      icon: controller.isShowConfirmPassword ? Icons.visibility : Icons.visibility_off,
                      onTap: () => controller.handleShowConfirmPassword(),
                    ),
                    readOnly: controller.isLoading,
                  ),
                ),
                const SizedBox(height: 25),
                Row(
                  children: [
                    GetBuilder<RegisterController>(
                      builder: (controller) => Checkbox(
                        value: controller.isRememberMe,
                        onChanged: (value) => controller.handleRememberMe(),
                      ),
                    ),
                    const Text('Remember me and keep me logged in'),
                  ],
                ),
                const SizedBox(height: 25),
                GetBuilder<RegisterController>(
                  builder: (controller) => PrimaryButton(
                    name: "Créer Un Compte",
                    onPressed: () {
       if (!controller.isLoading) {
       controller.register();
  }
},

                    loading: controller.isLoading,
                  ),
                ),
                const SizedBox(height: 15),
                Center(
                  child: TextButton(
                    onPressed: () {
                      // Replace with your login navigation
                    },
                    child: Text(
                      "Vous avez un compte ? Connectez-vous.",
                      style: TextStyle(color: AppColor.blueGray255),
                    ),
                  ),
                ),
                const SizedBox(height: 25),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
