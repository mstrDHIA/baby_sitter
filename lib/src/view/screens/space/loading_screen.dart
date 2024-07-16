import 'package:babysitter_v1/src/core/constant/app_color.dart';
import 'package:babysitter_v1/src/core/constant/app_image.dart';
import 'package:babysitter_v1/src/view/controllers/loading_controller.dart';
import 'package:babysitter_v1/src/view/screens/widget/logo_text_card.dart';
import 'package:babysitter_v1/src/view/screens/widget/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'package:babysitter_v1/src/view/controllers/loading_controller.dart';

class LoadingScreen extends StatelessWidget {
  final LoadingController controller = Get.put(LoadingController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Positioned(
              bottom: -20,
              right: -30,
              child: Opacity(
                opacity: .1,
                child: SvgPicture.asset(
                 AppImage.logo,
                  height: MediaQuery.sizeOf(context).height * .2,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Positioned(
              top: 20,
              right: 0,
              left: 0,
              child: LogoTextCard(text: "Caring for Little Smiles!"),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Obx(() {
                    return Text(
                      controller.isVerified.value
                          ? "Bienvenue! Votre inscription a été approuvée."
                          : "Merci de vous être inscrit!",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        color: AppColor.blueGray900,
                        fontWeight: FontWeight.w600,
                        fontFamily: "Poppins",
                      ),
                    );
                  }),
                  SizedBox(height: 15),
                  Obx(() {
                    return Text(
                      controller.isVerified.value
                          ? "Vous pouvez maintenant commencer à utiliser l'application. Bienvenue! pour plus d'informations, veuillez contacter l'administrateur. Merci!"
                          : "Maintenant, vous devez attendre que l'administrateur approuve votre inscription.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 13,
                        color:AppColor.blueGray300,
                        fontWeight: FontWeight.w400,
                        fontFamily: "Poppins",
                      ),
                    );
                  }),
                ],
              ),
            ),
            Positioned(
              bottom: 20,
              right: 20,
              left: 20,
              child: Obx(() {
                return PrimaryButton(
                  name: controller.isVerified.value ? "Continuer" : "Logout",
                  onPressed: (){}// => controller.handleClick(),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
