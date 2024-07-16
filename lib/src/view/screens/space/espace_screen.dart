  import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../core/constant/app_color.dart';
import '../../../core/constant/app_font.dart';
import '../../../core/constant/app_image.dart';
import '../../../data/datasource/space.dart';
import '../widget/logo_text_card.dart';
import 'widgets/button_espace.dart';
import 'package:babysitter_v1/src/view/controllers/espace_screen_controller.dart';

class EspaceScreen extends StatelessWidget {
  const EspaceScreen({super.key});

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
                  AppImage.logo,
                  height: 177,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Column(
              children: [
                const SizedBox(height: 47),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const LogoTextCard(),
                        Text(
                          "Commençons !",
                          style: Get.textTheme.bodyLarge!.copyWith(
                            color: AppColor.red800,
                            fontWeight: FontWeight.bold,
                            fontFamily: AppFont.futuraPT,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          "Cette étape est appropriée pour sélectionner votre propre espace.",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: Get.textTheme.bodyLarge!.copyWith(
                            fontFamily: AppFont.futuraPT,
                            height: 1.30,
                          ),
                        ),
                        const SizedBox(height: 40),
                        ListView.separated(
                          shrinkWrap: true,
                          padding: const EdgeInsets.symmetric(horizontal: 35),
                          itemCount: espaceList.length,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) => ButtonEspace(
                            text: espaceList[index]["espace"]!,
                            onPressed: () {
                              controller.goToLoginScreen(espaceList[index]["id"]!);
                             
                            },
                          ),
                          separatorBuilder: (context, index) =>
                              const SizedBox(height: 25),
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
