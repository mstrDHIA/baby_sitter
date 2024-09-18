import 'dart:io';
import 'package:flutter/material.dart';

class CinCardUpload extends StatelessWidget {
  const CinCardUpload({Key? key, required this.onTap, this.image}) : super(key: key);

  final VoidCallback onTap;
  final String? image;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.25,
        padding: image != null ? EdgeInsets.zero : EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.red[50],
          border: Border.all(color: Colors.deepOrange[500]!, width: 2),
          borderRadius: BorderRadius.circular(10),
        ),
        child: image != null
            ? _buildImageDisplay(image!)
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Faites glisser votre Carte d’identité ici ou parcourez",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.blueGrey[900],
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Pris en charge: PDF, JPEG, PNG",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
      ),
    );
  }

  Widget _buildImageDisplay(String imagePath) {
    if (imagePath.startsWith('http')) {
      // If the image is a network URL
      return Image.network(imagePath, fit: BoxFit.cover);
    } else {
      // If the image is a local file path
      return Image.file(File(imagePath), fit: BoxFit.cover);
    }
  }
}
