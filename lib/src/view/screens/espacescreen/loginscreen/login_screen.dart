import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:babysitter_v1/src/view/screens/widget/primary_button.dart';
import 'package:babysitter_v1/src/view/screens/widget/password_icon.dart';
import 'package:babysitter_v1/src/view/screens/espacescreen/auth/auth_input.dart';
import 'package:babysitter_v1/src/view/screens/espacescreen/auth/auth_label.dart';
import 'package:babysitter_v1/src/view/screens/espacescreen/auth/auth_description.dart';
import 'package:babysitter_v1/src/view/screens/widget/custom_text_style.dart';
import 'package:babysitter_v1/src/view/screens/widget/logo_text_card.dart';
import 'package:babysitter_v1/src/view/controllers/login_screen_controller.dart';
import 'package:babysitter_v1/src/view/screens/espacescreen/auth/auth_text_row.dart';
import 'package:babysitter_v1/src/view/screens/widget/custom_outlined_button.dart';

class LoginScreen extends StatelessWidget {
  final LoginController controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Form(
            key: controller.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Center(child: LogoTextCard(text: "Caring for Little Smiles!")),
                Center(
                    child: Text("Se connecter",
                        style: CustomTextStyles.titleLargePrimary)),
                SizedBox(height: 10),
                AuthDescription(
                  "Cette étape est appropriée pour sélectionner votre propre espace.",
                ),
                SizedBox(height: 30),
                AuthLabel("Email"),
                SizedBox(height: 10),
                AuthInput(
                  hintText: "e.g. john@mail.com",
                  controller: controller.emailController,
                  keyboardType: TextInputType.emailAddress,
                  validator: controller.validEmail,
                  readOnly: controller.isLoading.value,
                ),
                SizedBox(height: 12),
                AuthLabel("Mot de passe"),
                SizedBox(height: 10),
                Obx(() => AuthInput(
                      hintText: "e.g. *********",
                      controller: controller.passwordController,
                      validator: controller.validPassword,
                      obscure: !controller.isShowPassword.value,
                      suffix: PasswordIcon(
                        icon: controller.isShowPassword.value
                            ? Icons.visibility
                            : Icons.visibility_off,
                        onTap: controller.handleShowPassword,
                      ),
                      readOnly: controller.isLoading.value,
                    )),
                SizedBox(height: 25),
                Obx(() => PrimaryButton(
                    name: "Se connecter",
                    onPressed: controller.login,
                    loading: controller.isLoading.value)),
                SizedBox(height: 15),
                Align(
                  alignment: Alignment.centerRight,
                  child: CustomTextButton(
                    text: "Forgot password ?",
                    onTap: () {
                      Get.snackbar("Forgot password", "Implement functionality");
                      // Exemple de notification avec GetX
                      // controller.goToForgetPasswordScreen();
                    },
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * .21),
                AuthTextRow(
                  title: "Vous n'avez pas de compte ? ",
                  subTitle: "Inscrivez-vous.",
                  onTap: () {
                    Get.snackbar("Inscription", "Implement functionality");
                    // Exemple de notification avec GetX
                    // controller.goToRegisterScreen();
                  },
                ),
                SizedBox(height: 25),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
