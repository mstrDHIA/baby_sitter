import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:babysitter_v1/src/view/controllers/babysitter/identitebabysitter_controller.dart';
import 'package:babysitter_v1/src/view/screens/widget/logo_text_card.dart';
import 'package:babysitter_v1/src/view/screens/widget/primary_button.dart';
import 'package:babysitter_v1/src/view/screens/space/widgets/register_steps.dart';
import 'package:babysitter_v1/src/view/screens/space/widgets/title_baby.dart';
import 'package:babysitter_v1/src/view/screens/space/babysitter/cin_upload.dart';

class IdentitBabySitterTapeTwoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Initialiser le contrôleur
    final IdentitBabySitterTapeTwoController controller = Get.put(IdentitBabySitterTapeTwoController());

    return SafeArea(
      child: Scaffold(
        body: GetBuilder<IdentitBabySitterTapeTwoController>(
          builder: (controller) {
            return ListView(
              padding: EdgeInsets.all(20),
              children: [
                Center(
                  child: LogoTextCard(text: "Prendre soin des petits sourires !"),
                ),
                RegisterSteps(nbSteps: 5, currentStep: 3),
                SizedBox(height: MediaQuery.of(context).size.height * .06), // Fix for MediaQuery
                TitleBabyIdentity(title: "Authentification"),
                SizedBox(height: 25),
                TitleBabyIdentity(
                  title: "Importer votre carte d'identité*",
                  fontSize: 14,
                ),
                SizedBox(height: 15),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Veuillez télécharger deux photos ",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      TextSpan(
                        text: "claires de votre pièce d'identité (recto et verso)",
                        style: TextStyle(
                          color: Color(0xFFA30E39),
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 25),
                Text(
                  "Recto",
                  style: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 15),
                CinCardUpload(
                  image: controller.imageurlFront,
                  onTap: () => controller.handleUploadFrontImage(),
                ),
                SizedBox(height: 25),
                Text(
                  "Verso",
                  style: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 15),
                CinCardUpload(
                  image: controller.imageurlBack,
                  onTap: () => controller.handleUploadBackImage(),
                ),
                SizedBox(height: 5),
              ],
            );
          },
        ),
        bottomNavigationBar: Container(
          padding: EdgeInsets.all(15),
          child: PrimaryButton(
            name: "Étape suivante",
            onPressed: () => controller.handleNext(),
            isSecondary: true,
          ),
        ),
      ),
    );
  }
}
