import 'package:babysitter_v1/src/core/constant/app_image.dart';
import 'package:babysitter_v1/src/view/controllers/babysitter/babysitterPhoto_controller.dart';
import 'package:babysitter_v1/src/view/screens/widget/logo_text_card.dart';
import 'package:babysitter_v1/src/view/screens/widget/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:flutter_svg/flutter_svg.dart';


class AjoutBabysitterPhotoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AjoutPhotobabyController>(
      init:AjoutPhotobabyController(),
      builder: (controller) {
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
                      height: 177,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 10),
                      Center(
                        child: LogoTextCard(text: "Caring for Little Smiles!"),
                      ),
                      GetBuilder<AjoutPhotobabyController>(
                        builder: (controller) => CircleAvatar(
                          radius: 80,
                          backgroundColor: Colors.pink,
                          child: CircleAvatar(
                            radius: 75,
                            backgroundImage: controller.imageUrl != null
                                ? NetworkImage(controller.imageUrl!)
                                : null,
                            child: Stack(
                              children: [
                                Align(
                                  alignment: Alignment.bottomRight,
                                  child: CircleAvatar(
                                    backgroundColor: Colors.pink,
                                    radius: 25,
                                    child: InkWell(
                                      onTap: () => controller.handleUploadImageFromFolder,
                                      child: const Icon(
                                        Icons.camera_alt,
                                        color: Colors.white,
                                        size: 20,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 50),
                      Text(
                        "Veuillez importer une image de profil pour continuer.",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 20,
                  left: 15,
                  right: 15,
                  child: GetBuilder<AjoutPhotobabyController>(
                    builder: (controller) => PrimaryButton(
                      name: "Étape suivante",
                      onPressed: () => controller.handleNext,
                      isSecondary: true,
                      disabled: controller.isDisabledImport,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
