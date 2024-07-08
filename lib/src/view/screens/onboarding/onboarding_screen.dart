import 'package:babysitter_v1/src/core/constant/app_color.dart';
import 'package:babysitter_v1/src/core/constant/app_size.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:babysitter_v1/src/view/controllers/onboarding/onboarding_controller.dart';
import '../widget/custom_outlined_button.dart';
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
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(27),
                  topRight: Radius.circular(27),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GetBuilder<OnboardingController>(
                    builder: (controller) => Text(
                      onboardedList[controller.currentPage].title.toUpperCase(),
                      style: onboardedList[controller.currentPage].titleStyle,
                    ),
                  ),
                  SizedBox(height: 15),
                  GetBuilder<OnboardingController>(
                    builder: (controller) => Container(
                      width: 305,
                      margin: EdgeInsets.only(left: 9),
                      child: Text(
                        onboardedList[controller.currentPage].description,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style: onboardedList[controller.currentPage].descriptionStyle,
                      ),
                    ),
                  ),
                  SizedBox(height: 35),
                  CustomTextButton(
                    text: "Next",
                    onTap:  () => controller.navigateToPage(context),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      onboardedList.length,
                      (index) => GetBuilder<OnboardingController>(
                        builder: (controller) => AnimatedContainer(
                          duration: Duration(milliseconds: 500),
                          margin: EdgeInsets.all(5),
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
                        ? SizedBox()
                        : InkWell(
                            onTap: () => controller.skipPage(),
                            child: Text("Skip"),
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

class OnboardingModel extends StatelessWidget {
  final String image;
  final String title;
  final String description;
  final TextStyle? titleStyle;
  final TextStyle? descriptionStyle;

  OnboardingModel({
    required this.image,
    required this.title,
    required this.description,
    this.titleStyle,
    this.descriptionStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(image),
        SizedBox(height: 20),
        Text(
          title,
          style: titleStyle ?? DefaultTextStyle.of(context).style,
        ),
        SizedBox(height: 10),
        Text(
          description,
          style: descriptionStyle ?? DefaultTextStyle.of(context).style,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
