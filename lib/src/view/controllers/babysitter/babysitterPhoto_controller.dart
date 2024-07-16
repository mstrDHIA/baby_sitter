// ajout_photo_doc_controller.dart

import 'dart:developer';
import 'dart:io';

import 'package:babysitter_v1/main.dart';
import 'package:babysitter_v1/src/core/constant/appDB.dart';
import 'package:babysitter_v1/src/core/constant/app_cache.dart';
import 'package:babysitter_v1/src/core/functions/show_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class AjoutPhotobabyController extends GetxController {
  File? image;
  String? imageUrl;
  bool isDisabledImport = true;
  late String imageBaseUrl;

  Future<void> handleUploadImageFromFolder(BuildContext context) async {
    XFile? imageFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (imageFile != null) {
      image = File(imageFile.path);
      isDisabledImport = false;
      uploadImage(Get.context!);
      update();
    }
  }

  Future<void> uploadImage(BuildContext context) async {
    try {
      String currentDateTime = DateFormat('yyyyMMdd_HHmmss').format(DateTime.now());
      String fileName = 'user_$currentDateTime.jpg';

      final value = await supabase.storage
          .from('images')
          .upload('travail/$fileName', image!);
      imageUrl = value;

      await supabase
          .from(AppDB.user)
          .update({'avatar': imageUrl})
          .match({'id': AppCache.instance.getUid()});

      imageUrl = "$imageBaseUrl$imageUrl";
      showSnackbar(
        context: context,
        isError: false,
        message: "Image téléchargée avec succès.",
      );
      update();
    } catch (e) {
      log('Error uploading image: $e');
      showSnackbar(
        context: context,
        isError: true,
        message: "Une erreur s'est produite lors du téléchargement de l'image.",
      );
    }
  }

  void handleNext(BuildContext context) {
    if (imageUrl !=
        "https://cdn.icon-icons.com/icons2/1378/PNG/512/avatardefault_92824.png") {
      Navigator.pushNamed(context, '/adresseDocteurScreen');
    } else {
      showSnackbar(
        context: context,
        isError: true,
        message: "Veuillez importer une image ! ",
      );
    }
  }

  @override
  void onInit() {
    super.onInit();
    log("docteur");
    getImageFromDatabase();
    imageBaseUrl = dotenv.env['SUPABASE_IMAGE_URL']!;
  }

  Future<void> getImageFromDatabase() async {
    try {
      final data = await supabase
          .from(AppDB.user)
          .select('avatar')
          .eq('id', AppCache.instance.getUid());

      if (data.isNotEmpty && data[0]['avatar'] != null) {
        imageUrl = "$imageBaseUrl${data[0]['avatar']}";
        log(imageUrl!);
        isDisabledImport = false;
        update();
      } else {
        imageUrl =
            "https://cdn.icon-icons.com/icons2/1378/PNG/512/avatardefault_92824.png";
        isDisabledImport = true;
        update();
      }
    } catch (e) {
      log('Error getting image: $e');
    }
  }
}
