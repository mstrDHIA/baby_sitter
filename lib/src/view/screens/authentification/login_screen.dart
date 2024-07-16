import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
import 'package:babysitter_v1/src/view/controllers/espace_screen_controller.dart';


class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final LoginController controller = Get.put(LoginController());
    final EspaceController espaceController =Get .put(EspaceController());
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
          child: Form(
            key: controller.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Center(child: LogoTextCard(text: "Caring for Little Smiles!")),
                const SizedBox(height: 10),
                const Text(
                  "Se Connecter",
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
                const AuthLabel("Email"),
                const SizedBox(height: 10),
                GetBuilder<LoginController>(
                  builder: (controller) => AuthInput(
                    hintText: "youremail@gmail.com",
                    controller: controller.emailController,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) => validInput(value!, 6, 50, "email"),
                   // readOnly: controller.isLoading.value,
                  ),
                ),
                const SizedBox(height: 12),
                const AuthLabel("Mot de passe"),
                const SizedBox(height: 10),
                GetBuilder<LoginController>(
                  builder: (controller) => AuthInput(
                    hintText: "************",
                    controller: controller.passwordController,
                    validator: (value) => validInput(value!, 4, 25, "password"),
                    obscure: !controller.isShowPassword,
                    suffix: PasswordIcon(
                      icon: controller.isShowPassword
                          ? Icons.visibility
                          : Icons.visibility_off,
                      onTap: () => controller.handleShowPassword(),
                    ),
                   // readOnly: controller.isLoading.value,
                  ),
                ),
                const SizedBox(height: 25),
                GetBuilder<LoginController>(
                  builder: (controller) => PrimaryButton(
                    name: "Se Connecter",
                    onPressed: () {
                    
                        controller.signInWithEmailPassword;
                       Get.toNamed(AppRoute.babysitter);
                         
                      },
                  
                   // loading: controller.isLoading.value,
                  ),
                ),
                const SizedBox(height: 15),
                Align(
                  alignment: Alignment.center,
                  child: GestureDetector(
                    onTap: () {
                      Get.offNamed(AppRoute.forget);
                    },
                    child: const Text(
                      "Mot de passe oublié?",
                      style: TextStyle(
                        color: Colors.grey,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Center(
                  child: Column(
                    children: [
                      const Text(
                        "Ou continuer avec",
                        style: TextStyle(color: Colors.black54),
                      ),
                      const SizedBox(height: 20),
                      OutlinedButton(
                        onPressed: () {
                         // controller.signInWithGoogle();
                        },
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: Colors.black12),
                          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                           minimumSize: Size(MediaQuery.of(context).size.width, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            FaIcon(FontAwesomeIcons.google, color: AppColor.blueGray255),
                            const SizedBox(width: 10),
                            const Text(
                              "Google",
                              style: TextStyle(color: AppColor.blueGray255),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 15),
                      OutlinedButton(
                        onPressed: () {
                          // Add Facebook sign-in logic here
                        },
                        style: OutlinedButton.styleFrom(
                          backgroundColor: Colors.black,
                          side: const BorderSide(color: AppColor.blueGray255),
                          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 60),
                          minimumSize: Size(MediaQuery.of(context).size.width, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            FaIcon(FontAwesomeIcons.facebook, color:  AppColor.white),
                            const SizedBox(width: 10),
                            const Text(
                              "Facebook",
                              style: TextStyle(color:AppColor.white),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height:15),
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
