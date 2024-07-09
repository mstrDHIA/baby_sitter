import 'package:babysitter_v1/src/core/constant/app_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../widget/logo_text_card.dart';

class AjoutBabysitterScreen extends StatelessWidget {
  const AjoutBabysitterScreen({super.key});

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
              child: SvgPicture.asset(AppImage.logo,
                  height: 177, fit: BoxFit.fill),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(20),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 10),
                  Center(
                      child: LogoTextCard(text: "Caring for Little Smiles!")),
                  // CircleAvatar(
                  //   radius: 80,
                  //   backgroundColor: Colors.pink,
                  //   child: CircleAvatar(
                  //     radius: 75,
                  //     backgroundImage:
                  //         _imageurl != null ? NetworkImage(_imageurl!) : null,
                  //     child: Stack(
                  //       children: [
                  //         Align(
                  //           alignment: Alignment.bottomRight,
                  //           child: CircleAvatar(
                  //             backgroundColor: Colors.pink,
                  //             radius: 25,
                  //             child: InkWell(
                  //               onTap: () => handleUploadImageFromFolder(),
                  //               child: const Icon(Icons.camera_alt,
                  //                   color: Colors.white, size: 20),
                  //             ),
                  //           ),
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                  SizedBox(height: 50),
                  Text(
                    "Veuillez importer une image de profil pour continuer.  ",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ]),
          ),
          // Positioned(
          //   bottom: 20,
          //   left: 15,
          //   right: 15,
          //   child: PrimaryButton(
          //     name: "Étape suivante",
          //     onPressed: () => handleNext(),
          //     isSecondary: true,
          //     disabled: _isDisabledImport,
          //   ),
          // ),
        ],
      ),
    ));
  }
}
