import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/svg.dart';
import 'package:babysitter_v1/src/core/constant/app_image.dart';
import 'package:babysitter_v1/src/view/screens/widget/logo_text_card.dart';
import 'package:babysitter_v1/src/view/screens/widget/custom_text_style.dart';
import 'package:babysitter_v1/src/view/controllers/espace_screen_controller.dart';

import 'package:babysitter_v1/src/data/datasource/list_role.dart';
import 'package:babysitter_v1/src/view/screens/widget/button_space.dart';


class EspaceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final EspaceController controller = Get.put(EspaceController());

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
                  AppImage.imgSettings,
                  height: 177,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Column(
              children: [
                SizedBox(height: 47),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        LogoTextCard(),
                        Text("Commençons !",
                            style: CustomTextStyles.headlineLargeFuturaPTRed800),
                        SizedBox(height: 10),
                        Text(
                          "Cette étape est appropriée pour sélectionner votre propre espace.",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: CustomTextStyles.bodyLargeFuturaPTBlack90003
                              .copyWith(
                            height: 1.30,
                          ),
                        ),
                        SizedBox(height: 40),
                        ListView.separated(
                          shrinkWrap: true,
                          padding: EdgeInsets.symmetric(horizontal: 35),
                          itemCount: espaceList.length,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) => ButtonEspace(
                            text: espaceList[index]["espace"]!,
                            onPressed: () => controller.goToLoginScreen(espaceList[index]["id"]!),
                          ),
                          separatorBuilder: (context, index) => SizedBox(height: 25),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
