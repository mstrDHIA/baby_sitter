import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:developer';
import 'dart:io';
import 'package:intl/intl.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:babysitter_v1/src/core/cache/app_cache.dart';
import 'package:babysitter_v1/src/core/functions/show_snack_bar.dart';
import 'package:babysitter_v1/src/core/constant/appDB.dart';
import 'package:babysitter_v1/main.dart';
import'package:babysitter_v1/src/view//screens/espacescreen/babysitter/adresse_babysitter_screen.dart';

class AjoutBabysitterController extends GetxController {
  var image = Rx<File?>(null);
  var imageUrl = RxString('');
  var isDisabledImport = true.obs;
  late String imageBaseUrl;

  @override
  void onInit() {
    super.onInit();
    log("baby");
    imageBaseUrl = dotenv.get("SUPABASE_IMAGE_URL");
    getImageFromDatabase();
  }

  Future<void> handleUploadImageFromFolder() async {
    XFile? imageFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (imageFile != null) {
      image.value = File(imageFile.path);
      isDisabledImport.value = false;
      uploadImage();
    }
  }

  Future<void> uploadImage() async {
    try {
      String currentDateTime = DateFormat('yyyyMMdd_HHmmss').format(DateTime.now());
      String fileName = 'user_$currentDateTime.jpg';

      await supabase.storage
          .from('images')
          .upload('upload/$fileName', image.value!)
          .then((value) => imageUrl.value = value);
      await supabase
          .from(AppDB.user)
          .update({'avatar': imageUrl.value}).match({'id': AppCache().getUid()});
      imageUrl.value = "$imageBaseUrl${imageUrl.value}";
      showSnackbar(
        context: Get.context!,
        isError: false,
        message: "Image téléchargée avec succès.",
      );
    } catch (e) {
      log('Error uploading image: $e');
      showSnackbar(
        context: Get.context!,
        isError: true,
        message: "Une erreur s'est produite lors du téléchargement de l'image.",
      );
    }
  }

  Future<void> getImageFromDatabase() async {
    try {
      final data = await supabase
          .from(AppDB.user)
          .select('avatar')
          .match({'id': AppCache().getUid()});

      if (data.isNotEmpty && data[0]['avatar'] != null) {
        imageUrl.value = "$imageBaseUrl${data[0]['avatar'].toString()}";
        log(imageUrl.value);
        isDisabledImport.value = false;
      } else {
        imageUrl.value =
            "https://cdn.icon-icons.com/icons2/1378/PNG/512/avatardefault_92824.png";
        isDisabledImport.value = true;
      }
    } catch (e) {
      log('Error getting image: $e');
    }
  }

  void handleNext() {
    if (imageUrl.value !=
        "https://cdn.icon-icons.com/icons2/1378/PNG/512/avatardefault_92824.png") {
      Get.to(() => AdresseBabysitterScreen());
    } else {
      showSnackbar(
        context: Get.context!,
        isError: true,
        message: "Veuillez importer une image ! ",
      );
    }
  }
}
