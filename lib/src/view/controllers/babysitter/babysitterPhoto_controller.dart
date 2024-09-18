import 'dart:developer';
import 'dart:io';
import 'package:babysitter_v1/main.dart';
import 'package:babysitter_v1/src/core/constant/appDB.dart';
import 'package:babysitter_v1/src/core/constant/app_cache.dart';
import 'package:babysitter_v1/src/core/constant/app_route.dart';
import 'package:babysitter_v1/src/core/functions/show_snack_bar.dart';
import 'package:babysitter_v1/src/view/screens/space/babysitter/adresse_babysitter.dart';
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
  bool isPhotoChanged=false;
  // Méthode pour gérer la sélection de l'image depuis la galerie
  Future<void> handleUploadImageFromFolder(BuildContext context) async {
    XFile? imageFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (imageFile != null) {
      image = File(imageFile.path);
      isDisabledImport = false;
      log('Image selected: ${imageFile.path}');
      await uploadImage(context);
      update();
    } else {
      log('No image selected.');
    }
  }

  // Méthode pour télécharger l'image et insérer dans la base de données
  Future<void> uploadImage(BuildContext context) async {
    try {
      String currentDateTime = DateFormat('yyyyMMdd_HHmmss').format(DateTime.now());
      String fileName = 'user_$currentDateTime.jpg';

      // Téléchargez l'image dans le bucket de stockage
      final storageResponse = await supabase.storage
          .from('images')
          .upload('images/$fileName', image!);

      if (storageResponse == null) {
        throw Exception('Error uploading image to storage');
      }

      // Construire l'URL complète de l'image
      //imageUrl = '$imageBaseUrl$fileName';

      // Insérer l'URL de l'image dans la colonne avatar de la table user
     /* final insertResponse = await supabase
          .from('user')
          .update({
            'avatar': imageUrl,
          })
          .eq('id', AppCache.instance.getUid());

      if (insertResponse.error != null) {
        throw Exception('Error inserting avatar in user table: ${insertResponse.error!.message}');
      }*/
      final uid = AppCache.instance.getUid();
final imageUrl = '$imageBaseUrl/$fileName';  // L'URL de l'image que vous avez uploadée
// print(imageUrl);
print(uid);
final updateResponse = await supabase
    .from('user')
    .update({
      'avatar': imageUrl,
    })
    .eq('id', uid).select();  // S'assurer que l'utilisateur avec cet ID effectue la mise à jour

if (updateResponse.isNull||updateResponse.isEmpty) {
  throw Exception('Erreur lors de la mise à jour de l\'avatar: '
  // ${updateResponse.error!.message}
  );
} else {
  isPhotoChanged=true;
  print('Mise à jour réussie : '
  // ${updateResponse.data}
  );
}


      log('Image uploaded and avatar inserted: $imageUrl');
      showSnackbar(
        context,
        isError: false,
        message: "Image téléchargée avec succès.",
      );
      update();
    } catch (e) {
      log('Error uploading image: $e');
      showSnackbar(
        context,
        isError: true,
        message: "Une erreur s'est produite lors du téléchargement de l'image.",
      );
    }
  }

  // Méthode pour gérer la navigation vers la prochaine étape
  void handleNext(BuildContext context) {
    print(imageUrl);
    // if (imageUrl !=
    //     "https://cdn.icon-icons.com/icons2/1378/PNG/512/avatardefault_92824.png") 
    if(isPhotoChanged==true)
        {
          isPhotoChanged=false;
      Get.to(AdresseBabysitterScreen());
    } else {
      showSnackbar(
        context,
        isError: true,
        message: "Veuillez importer une image ! ",
      );
    }
  }

  @override
  void onInit() {
    super.onInit();
    log("babysitter");
    getImageFromDatabase();
    imageBaseUrl = dotenv.env['SUPABASE_IMAGE_URL']!;
  }

  // Méthode pour récupérer l'image depuis la base de données
  Future<void> getImageFromDatabase() async {
    try {
      final data = await supabase
          .from('user')
          .select('avatar')
          .eq('id', AppCache.instance.getUid())
          .single();

      if (data != null && data['avatar'] != null) {
        imageUrl = data['avatar'];
        log('Image from database: $imageUrl');
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
