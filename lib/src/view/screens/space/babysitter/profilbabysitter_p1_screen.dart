import 'package:babysitter_v1/src/core/constant/app_color.dart';
import 'package:babysitter_v1/src/core/constant/app_image.dart';
import 'package:babysitter_v1/src/core/constant/app_route.dart';
import 'package:babysitter_v1/src/core/constant/app_size.dart';
import 'package:babysitter_v1/src/shared/spacer/vertical_spacer.dart';
import 'package:babysitter_v1/src/view/controllers/babysitter/profilbabysitter_p1_controller.dart';
import 'package:babysitter_v1/src/view/screens/widget/customimgview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class RegisterBabysitterScreen extends StatelessWidget {
  const RegisterBabysitterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RegisterBabysitterController());

    return SafeArea(
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        body: Container(
          width: AppSize.screenWidth,
          height: AppSize.screenHeight,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment(0.87, -0.05),
              end: Alignment(0, 1),
              colors: [
                AppColor.red800,
                AppColor.blueGray900,
              ],
            ),
          ),
          child: Container(
            width: double.maxFinite,
            padding: const EdgeInsets.symmetric(vertical: 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(AppImage.logo, width: 50, height: 50),
                const VerticalSpacer(2),
                const SizedBox(height: 55),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: RichText(
                      textAlign: TextAlign.left,
                      text: TextSpan(
                        text: 'bienvenue chez ',
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          height: 1.25,
                          color: AppColor.white,
                        ),
                        children: [
                          TextSpan(
                            text: 'Babysitter',
                            style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                              fontSize: 30,
                              color: AppColor.blueGray255,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                 const SizedBox(height: 15),
                CustomImageView(
                  imagePath: AppImage.baby,
                  height: 250,
                  width: 300,
                ),
                const SizedBox(height: 15),
                SizedBox(
                  height: 52,
                  width: 263,
                  child: ElevatedButton(
                    onPressed: () {
                      
                      Get.offNamed(AppRoute.babysingup);
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(AppColor.white),
                    ),
                    child: Text(
                      "Commencer",
                      style: TextStyle(
                        color: AppColor.blueGray255,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
