import 'package:babysitter_v1/src/core/constant/app_color.dart';
import 'package:babysitter_v1/src/core/constant/app_font.dart';
import 'package:babysitter_v1/src/core/constant/app_size.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:babysitter_v1/src/view/controllers/onboarding/onboarding_controller.dart';
import '../../../../widget/custom_outlined_button.dart';
import '../../../data/datasource/onboard.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final OnboardingController controller = Get.put(OnboardingController());

    return Scaffold(
      body: Stack(
        children: [
          GetBuilder<OnboardingController>(
            builder: (controller) => Positioned(
              top: 0,
              right: 0,
              left: 0,
              bottom: AppSize.screenHeight! * 0.3,
              child: PageView.builder(
                controller: controller.pageController,
                itemCount: onboardedList.length,
                onPageChanged: (value) => controller.handlePage(value),
                itemBuilder: (context, index) {
                  return Image.asset(
                    onboardedList[index].image,
                    fit: BoxFit.fill,
                  );
                },
              ),
            ),
          ),
          Positioned(
            right: 0,
            left: 0,
            bottom: 0,
            child: Container(
              height: AppSize.screenHeight! * .45,
              width: AppSize.screenWidth,
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(27),
                    topRight: Radius.circular(27)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GetBuilder<OnboardingController>(
                    builder: (controller) => Text(
                        onboardedList[controller.currentPage]
                            .title
                            .toUpperCase(),
                        style: Get.textTheme.headlineLarge),
                  ),
                  const SizedBox(height: 15),
                  GetBuilder<OnboardingController>(
                    builder: (controller) => Container(
                      width: 305,
                      margin: const EdgeInsets.only(left: 9),
                      child: Text(
                        onboardedList[controller.currentPage].description,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style: Get.textTheme.bodyLarge!.copyWith(
                          fontWeight: FontWeight.w400,
                          fontFamily: AppFont.poppins,
                          color: AppColor.blueGray300,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 35),
                  CustomTextButton(
                    text: "Next",
                    onPressed: () => controller.navigateToPage(context),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      onboardedList.length,
                      (index) => GetBuilder<OnboardingController>(
                        builder: (controller) => AnimatedContainer(
                          duration: const Duration(milliseconds: 500),
                          margin: const EdgeInsets.all(5),
                          height: 10,
                          width: controller.currentPage == index ? 50 : 10,
                          decoration: BoxDecoration(
                            color: controller.currentPage == index
                                ? AppColor.second
                                : AppColor.redSplash,
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ),
                    ),
                  ),
                  GetBuilder<OnboardingController>(
                    builder: (controller) => SizedBox(
                      height: controller.isLastPage() ? 0 : 15,
                    ),
                  ),
                  GetBuilder<OnboardingController>(
                    builder: (controller) => controller.isLastPage()
                        ? const SizedBox()
                        : InkWell(
                            onTap: () => controller.skipPage(),
                            child: const Text("Skip"),
                          ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
