import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constant/app_route.dart';
import '../../../core/functions/valid_input.dart';
import '../widget/custom_outlined_button.dart';
import '../widget/logo_text_card.dart';
import '../widget/password_icon.dart';
import '../widget/primary_button.dart';
import 'widgets/auth_description.dart';
import 'widgets/auth_input.dart';
import 'widgets/auth_label.dart';
import 'package:babysitter_v1/src/view/controllers/login_screen_controller.dart';
import 'widgets/auth_text_row.dart';
import 'package:babysitter_v1/src/core/constant/app_color.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final LoginController controller = Get.put(LoginController());
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: controller.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Center(
                    child: LogoTextCard(text: "Caring for Little Smiles!")),
                const Center(child: Text("Se connecter")),
                const SizedBox(height: 10),
                const AuthDescription(
                  "Cette étape est appropriée pour sélectionner votre propre espace.",
                ),
                const SizedBox(height: 30),
                const AuthLabel("Email"),
                const SizedBox(height: 10),
                GetBuilder<LoginController>(
                  builder: (controller) => AuthInput(
                    hintText: "e.g. john@mail.com",
                    controller: controller.emailController,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) => validInput(value!, 6, 50, "email"),
                    readOnly: controller.isLoading.value,
                  ),
                ),
                const SizedBox(height: 12),
                const AuthLabel("Mot de passe"),
                const SizedBox(height: 10),
                GetBuilder<LoginController>(
                  builder: (controller) => AuthInput(
                    hintText: "e.g. *********",
                    controller: controller.passwordController,
                    validator: (value) => validInput(value!, 4, 25, "password"),
                    obscure: !controller.isShowPassword.value,
                    suffix: PasswordIcon(
                      icon: controller.isShowPassword.value
                          ? Icons.visibility
                          : Icons.visibility_off,
                      onTap: () => controller.handleShowPassword(),
                    ),
                    readOnly: controller.isLoading.value,
                  ),
                ),
                const SizedBox(height: 25),
                GetBuilder<LoginController>(
                  builder: (controller) => PrimaryButton(
                    name: "Se connecter",
                    onPressed: () {
                      if (!controller.isLoading.value) {
                        controller.login();
                      }
                    },
                    loading: controller.isLoading.value,
                  ),
                ),
                const SizedBox(height: 15),
                Align(
                  alignment: Alignment.center,
                  child: GestureDetector(
                    onTap: () {
                      Get.toNamed(AppRoute.forget);
                    },
                    child: const Text(
                      "Forgot password ?",
                      style: TextStyle(
                        color: Color.fromARGB(255, 50, 50, 50),
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                Center(
                  child: TextButton(
                    onPressed: () {
                      // Replace with your Google Sign-In logic
                    },
                    child: Text(
                      "ou continuer avec",
                      style: TextStyle(color: AppColor.blueGray255),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                TextButton(
                  onPressed: () {
                    controller.signInWithGoogle();
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        'assets/icons/google_icon.png', // chemin de l'icône Google
                        height: 20.0,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        "Google",
                        style: TextStyle(color: AppColor.blueGray255),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * .21),
                AuthTextRow(
                  title: "Vous n'avez pas de compte ? ",
                  subTitle: "Inscrivez-vous.",
                  onTap: () {
                    Get.toNamed(AppRoute.inscription);
                  },
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
