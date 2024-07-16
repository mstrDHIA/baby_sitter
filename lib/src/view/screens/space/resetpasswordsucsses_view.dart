
import 'package:babysitter_v1/src/core/constant/app_color.dart';
import 'package:babysitter_v1/src/core/constant/app_image.dart';
import 'package:babysitter_v1/src/core/constant/app_route.dart';

import 'package:babysitter_v1/src/view/controllers/resetpasswordsucess_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widget/logo_text_card.dart';
import '../widget/primary_button.dart';

class ResetPasswordSuccessView extends StatelessWidget {
  const ResetPasswordSuccessView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ResetPasswordSuccessController controller = Get.put(ResetPasswordSuccessController());
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Center(child: LogoTextCard(text: "Caring for Little Smiles!")),
                const SizedBox(height: 20),
                const Text(
                  "Votre Mot De Passe A Été Réinitialisé !",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: AppColor.blueGray255,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                Image.asset(AppImage.success, height: 150), 
                const SizedBox(height: 30),
                PrimaryButton(
                  name: "Envoyer",
                  onPressed:()=> Get.offAllNamed(AppRoute.espace)

                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
