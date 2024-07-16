import 'package:babysitter_v1/src/core/constant/app_color.dart';
import 'package:flutter/material.dart';


class CinCardUpload extends StatelessWidget {
  const CinCardUpload({Key? key, required this.onTap, this.image})
      : super(key: key);

  final VoidCallback onTap;
  final String? image;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height * 0.25,
        padding: image != null ? EdgeInsets.zero : EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: AppColor.red50,
          border: Border.all(color: AppColor.deepOrange5001, width: 2),
          borderRadius: BorderRadius.circular(10),
        ),
        child: image != null
            ? Image.network(image!, fit: BoxFit.cover)
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Faites glisser votre Carte d’identité ici ou parcourez",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15,
                      fontFamily: "Poppins",
                      color: AppColor.blueGray900,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Pris en charge:  PDF, JPEG, PNG",
                    style: TextStyle(
                      fontSize: 12,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
