import 'package:babysitter_v1/widget/logo_text_card.dart';
import 'package:flutter/material.dart';
import 'widgets/auth_description.dart';
import 'widgets/auth_label.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Form(
            // key: formKey,
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
                // AuthInput(
                //   hintText: "e.g. john@mail.com",
                //   controller: emailController,
                //   keyboardType: TextInputType.emailAddress,
                //   validator: (value) => validEmail(value),
                //   readOnly: _isLoading,
                // ),
                const SizedBox(height: 12),
                const AuthLabel("Mot de passe"),
                const SizedBox(height: 10),
                // AuthInput(
                //   hintText: "e.g. *********",
                //   controller: passwordController,
                //   validator: (value) => validPassword(value),
                //   obscure: !isShowPassword,
                //   suffix: PasswordIcon(
                //     icon: isShowPassword
                //         ? Icons.visibility
                //         : Icons.visibility_off,
                //     onTap: () => handleShowPassword(),
                //   ),
                //   readOnly: _isLoading,
                // ),
                const SizedBox(height: 25),
                // PrimaryButton(
                //     name: "Se connecter",
                //     onPressed: () => login(),
                //     loading: _isLoading),
                const SizedBox(height: 15),
                // Align(
                //   alignment: Alignment.centerRight,
                //   child: CustomTextButton(
                //       text: "Forgot password ?",
                //     /*  onTap: () => goToForgetPasswordScreen()),*/
                // ),
                SizedBox(height: MediaQuery.sizeOf(context).height * .21),
                // const AuthTextRow(
                //   title: "Vous n'avez pas de compte ? ",
                //   subTitle: "Inscrivez-vous.",
                // /*  onTap: () => goToRegisterScreen(),*/
                // ),
                const SizedBox(height: 25),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
