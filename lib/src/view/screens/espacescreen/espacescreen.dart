import 'package:flutter/material.dart';
import 'package:babysitter_v1/src/core/cache/app_cache.dart';
import 'package:babysitter_v1/src/routeurs/routeurs.dart';
import 'package:babysitter_v1/src/view/screens/espacescreen/babysitter/babysitter_screen.dart';
import 'package:babysitter_v1/src/view/screens/espacescreen/doctor/profil_doctor_screen.dart';
import 'package:babysitter_v1/src/view/screens/loading.dart';
import 'package:babysitter_v1/src/view/screens/espacescreen/doctor/ajout_photodoc.dart';
import 'package:babysitter_v1/src/core/constant/app_route.dart';
import 'package:flutter_svg/svg.dart';
import 'package:babysitter_v1/src/core/constant/app_image.dart';
import 'package:babysitter_v1/widget/logo_text_card.dart';




class EspaceScreen extends StatefulWidget {
  const EspaceScreen({Key? key}) : super(key: key);

  @override
  State<EspaceScreen> createState() => _EspaceScreenState();
}

class _EspaceScreenState extends State<EspaceScreen> {
  goToLoginScreen(BuildContext context, String id) {
    Navigator.pushNamed(context, AppRoute.loginScreen,
        arguments: {"espace_role": id});
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (AppCache().getUid() != "") {
        if (AppCache().getRole() == role.babySitter.name) {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => AjoutBabysitterScreen()));
        } else if (AppCache().getRole() == role.docteur.name) {
          bool isCompleteProfile = AppCache().getIsCompleteProfile();
          bool isVerified = AppCache().getIsVerified();
          log("isCompleteProfile[ESPACE]: $isCompleteProfile");
          log("isVerified[ESPACE]: $isVerified");

        /*  if (isVerified && isCompleteProfile) {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => ProfileDoctoraScreen()));
          } else if (!isVerified && isCompleteProfile) {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => LoadingScreen()));
          } else {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => AjoutPhotodocScreen()));
          }
        } else if (AppCache().getRole() == role.parent.name) {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => RegisterParent1ScreenScreen()));
        } else if (AppCache().getRole() == role.creche.name) {
          bool isCompleteProfile = AppCache().getIsCompleteProfile();
          bool isVerified = AppCache().getIsVerified();
          log("isCompleteProfile[ESPACE]: $isCompleteProfile");
          log("isVerified[ESPACE]: $isVerified");

          if (isVerified && isCompleteProfile) {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => HomepageCrecheScreen()));
          } else if (!isVerified && isCompleteProfile) {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => LoadingScreen()));
          } else {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => AjoutphcrecheScreen()));
          }
        } else if (AppCache().getRole() == role.admin.name) {
          if (AppCache().getIsCompleteProfile()) {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => HomePageAdminScreen()));
          } else {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => RegisterAdminPhAScreen()));
          }
        } else if (AppCache().getRole() == role.docteur.name) {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => AjoutPhotodocScreen()));
        }
      } else {}*/
    });
  }

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
                        Text("Commencons !",
                            style:
                                CustomTextStyles.headlineLargeFuturaPTRed800),
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
                            onPressed: () => goToLoginScreen(
                                context, espaceList[index]["id"]!),
                          ),
                          separatorBuilder: (context, index) =>
                              SizedBox(height: 25),
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
