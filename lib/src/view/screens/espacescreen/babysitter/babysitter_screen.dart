import 'package:babysitter_v1/src/core/constant/app_image.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:babysitter_v1/src/core/cache/app_cache.dart';
import 'package:babysitter_v1/src/core/functions/show_snack_bar.dart';
import 'package:babysitter_v1/main.dart';
import 'package:babysitter_v1/src/core/constant/appDB.dart';
import'package:babysitter_v1/src/view/screens/espacescreen/babysitter/adresse_babysitter.dart';
import 'package:babysitter_v1/src/view/screens/espacescreen/auth/primart_button.dart';
import 'package:babysitter_v1/widget/logo_text_card.dart';




class AjoutBabysitterScreen extends StatefulWidget {
  const AjoutBabysitterScreen({Key? key}) : super(key: key);

  @override
  State<AjoutBabysitterScreen> createState() => _AjoutBabysitterScreenState();
}

class _AjoutBabysitterScreenState extends State<AjoutBabysitterScreen> {
  File? _image;
  String? _imageurl;
  bool _isDisabledImport = true;
  late String _imageBaseUrl;

  Future<void> handleUploadImageFromFolder() async {
    XFile? imageFile = await ImagePicker.platform
        .getImageFromSource(source: ImageSource.gallery);
    if (imageFile != null) {
      setState(() {
        _image = File(imageFile.path);
        _isDisabledImport = false;
        uploadImage();
      });
    }
  }

  Future<void> uploadImage() async {
    try {
      String currentDateTime =
          DateFormat('yyyyMMdd_HHmmss').format(DateTime.now());
      String fileName = 'user_$currentDateTime.jpg';

      await supabase.storage
          .from('images')
          .upload('upload/$fileName', _image!)
          .then((value) => (_imageurl = value));
      await supabase
          .from(AppDB.user)
          .update({'avatar': _imageurl}).match({'id': AppCache().getUid()});
      setState(() {
        _imageurl = "$_imageBaseUrl${_imageurl.toString()}";
      });
      showSnackbar(
        context: context,
        isError: false,
        message: "Image téléchargée avec succès.",
      );
    } catch (e) {
      log('Error uploading image: $e');
      showSnackbar(
        context: context,
        isError: true,
        message: "Une erreur s'est produite lors du téléchargement de l'image.",
      );
    }
  }

  void handleNext() {
    if (_imageurl !=
        "https://cdn.icon-icons.com/icons2/1378/PNG/512/avatardefault_92824.png") {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => AdresseBabysitterScreen()),
      );
    } else {
      showSnackbar(
        context: context,
        isError: true,
        message: "Veuillez importer une image ! ",
      );
    }
  }

  @override
  void initState() {
    log("baby");
    getImageFromDatabase();
    _imageBaseUrl = dotenv.get("SUPABASE_IMAGE_URL");
    super.initState();
  }

  Future<void> getImageFromDatabase() async {
    try {
      final data = await supabase
          .from(AppDB.user)
          .select('avatar')
          .match({'id': AppCache().getUid()});

      if (data.isNotEmpty && data[0]['avatar'] != null) {
        setState(() {
          _imageurl = "$_imageBaseUrl${data[0]['avatar'].toString()}";
          log(_imageurl.toString());
          _isDisabledImport = false;
        });
      } else {
        setState(() {
          _imageurl =
              "https://cdn.icon-icons.com/icons2/1378/PNG/512/avatardefault_92824.png";
          _isDisabledImport = true;
        });
      }
    } catch (e) {
      log('Error getting image: $e');
    }
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
              child: SvgPicture.asset(AppImage.imgSettings,
                  height: 177, fit: BoxFit.fill),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 10),
                  Center(
                      child: LogoTextCard(text: "Caring for Little Smiles!")),
                  CircleAvatar(
                    radius: 80,
                    backgroundColor: Colors.pink,
                    child: CircleAvatar(
                      radius: 75,
                      backgroundImage:
                          _imageurl != null ? NetworkImage(_imageurl!) : null,
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment.bottomRight,
                            child: CircleAvatar(
                              backgroundColor: Colors.pink,
                              radius: 25,
                              child: InkWell(
                                onTap: () => handleUploadImageFromFolder(),
                                child: const Icon(Icons.camera_alt,
                                    color: Colors.white, size: 20),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
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
          Positioned(
            bottom: 20,
            left: 15,
            right: 15,
            child: PrimaryButton(
              name: "Étape suivante",
              onPressed: () => handleNext(),
              isSecondary: true,
              disabled: _isDisabledImport,
            ),
          ),
        ],
      ),
    ));
  }
}
