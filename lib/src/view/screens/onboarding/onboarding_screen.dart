import 'package:babysitter_v1/src/core/constant/app_color.dart';
import 'package:babysitter_v1/src/core/constant/app_size.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:babysitter_v1/src/view/controllers/onboarding/onboarding_controller.dart';

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
            builder: (controller) => 
            Positioned(
              top: 0,
              right: 0,
              left: 0,
              bottom: AppSize.screenHeight! * 0.3,
              child: PageView.builder(
                controller: controller.pageController,
                itemCount: onboardedList.length,
                onPageChanged: controller.navigateToPage,
               
                  // setState(() {
                  //   _currentPage = index;
                  // });
                
                itemBuilder: (context, index) {
                  return Image.asset(onboardedList[index].image,
                      fit: BoxFit.fill);
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
                  Text(
                    onboardedList[controller.currentPage].title.toUpperCase(),
                    // style: CustomTextStyles.headlineSmallGray90001,
                  ),
                  SizedBox(height: 15),
                  Container(
                    width: 305,
                    margin: EdgeInsets.only(left: 9),
                    child: Text(
                      onboardedList[controller.currentPage].description,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      // style: CustomTextStyles.bodyLargeBluegray400
                      //     .copyWith(height: 1.30),
                    ),
                  ),
                  SizedBox(height: 35),
                  // CustomOutlinedButton(
                  //   height: 60,
                  //   text: "Next",
                  //   buttonStyle: CustomButtonStyles.fillBlack,
                  //   buttonTextStyle: CustomTextStyles.titleMediumGray10002,
                  //   onPressed: () => navigateToPage(),
                  // ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      onboardedList.length,
                      (index) =>    GetBuilder<OnboardingController>(
                        builder: (controller) => 
                        AnimatedContainer(
                          duration: Duration(milliseconds: 500),
                          margin: EdgeInsets.all(5),
                          height: 10,
                          width: controller.currentPage == index ? 50 : 10,
                          decoration: BoxDecoration(
                            color: controller.currentPage == index
                                ? AppColor.primaryColor
                                : AppColor.redSplash,
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ),
                    ),
                  ),
                   TextButton(
                              onPressed: () => controller.skipPage(),
                              style: ElevatedButton.styleFrom(
                               backgroundColor: Colors.black, 
                               padding: EdgeInsets.symmetric(
                                horizontal: 32, vertical: 12), 
                                   textStyle: TextStyle(
                                     fontSize: 16,
                                   fontWeight: FontWeight.bold,
                                    color: Colors.white, 
                                    ),
                               shape: RoundedRectangleBorder(
                             borderRadius: BorderRadius.circular(8), 
                             ),
        ),
                              child: Text("Next"),
                            ),
                  SizedBox(
                      height:
                          controller.currentPage == onboardedList.length - 1 ? 0 : 15),
                  controller.currentPage == onboardedList.length - 1
                      ? SizedBox()
                      : InkWell(onTap: () => controller.skipPage(), child: Text("Skip")),
                      
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class OnboardingStep extends StatelessWidget {
  final String image;
  final String title;
  final String description;

  OnboardingStep({required this.image, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(image),
        SizedBox(height: 20),
        Text(
          title,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Text(
          description,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}
