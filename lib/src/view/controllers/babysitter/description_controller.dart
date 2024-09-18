import 'package:babysitter_v1/src/core/constant/app_cache.dart';
import 'package:babysitter_v1/src/core/constant/app_route.dart';
import 'package:babysitter_v1/src/view/screens/space/babysitter/babysitter_list_screen.dart';
import 'package:babysitter_v1/src/view/screens/space/babysitter/identitebabysitter_screen.dart';
import 'package:uuid/uuid.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DescriptionController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final descriptionController = TextEditingController();
  final langueAutreController = TextEditingController();
  final langueMaternelleController = TextEditingController();
  final experienceController = TextEditingController();
  final String role =AppCache.instance.getRole();
  String selectedGarde = "Non";
  String? selectedLangueMaternelle;
  String? selectedLangueAutre;
  final List<String> langues = ["Français", "Anglais", "Arabe", "Espagnol", "Allemand"];

  var isLoading = false.obs;
  var isDisabled = false.obs;

  final SupabaseClient supabase = Supabase.instance.client;


  

  // Méthodes pour gérer les sélections
  void handleGarde(String value) {
    selectedGarde = value;
    update();
  }

  void onSelectLangueMaternelle(String? value) {
    selectedLangueMaternelle = value;
    update();
  }

  void onSelectLangueAutre(String? value) {
    selectedLangueAutre = value;
    update();
  }

  // Méthode pour aller à l'étape suivante
  Future<void> nextStep(BuildContext context) async {
    if (formKey.currentState?.validate() != true) {
      return;
    }

    isLoading.value = true;
    isDisabled.value = true;

    try {
      // Générer un UUID pour babysitter_id
      final String babysitterId = Uuid().v4();

      // ID de l'utilisateur connecté
      final uid = supabase.auth.currentUser?.id;

      if (uid != null) {
        // Insertion des données dans la table babysitters
        Map<String,dynamic> response;
        if(role=='parent'){
         response = await supabase.from('parent').update({
          // 'babysitter_id': babysitterId,
          // 'user_id': uid,
          'description': descriptionController.text,
          'langue': selectedLangueMaternelle,
          // 'autre_langue': selectedLangueAutre,
          'nbr_enfants': int.tryParse(experienceController.text) ?? 0,
          // 'garde_enfant': selectedGarde == "Oui",
        }).eq('user_id', AppCache.instance.getUid()).select().single();
        AppCache.instance.setNbrKids(int.tryParse(experienceController.text)!);
        }
        else
         response = await supabase.from('babysitters').update({
          'babysitter_id': babysitterId,
          'user_id': uid,
          'description': descriptionController.text,
          'langue_maternelle': selectedLangueMaternelle,
          'autre_langue': selectedLangueAutre,
          'année_experience': int.tryParse(experienceController.text) ?? 0,
          'garde_enfant': selectedGarde == "Oui",
        }).eq('user_id', AppCache.instance.getUid()).select().single();

        if (response != null && response.isNotEmpty) {
          // Passer à la page suivante avec l'ID du babysitter
          // Get.toNamed(
          //   AppRoute.horaire,
          //   arguments: {'babysitterId': babysitterId},
          // );

          Get.snackbar(
            'Succès',
            'Les informations ont été enregistrées avec succès',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green,
            colorText: Colors.white,
          );
          (role=='parent')?Get.to(BabysitterListScreen()):
          Get.to(IdentitBabySitterTapeTwoScreen());
        } else {
          // Affichage d'une erreur
          Get.snackbar(
            'Erreur',
            'Une erreur s\'est produite lors de l\'insertion des informations : ',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red,
            colorText: Colors.white,
          );
        }
      } else {
        Get.snackbar(
          'Erreur',
          'Utilisateur non connecté',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } catch (e) {
      Get.snackbar(
        'Erreur',
        'Une erreur s\'est produite : $e',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
        // Remplacez par la route souhaitée en cas d'erreur
    } finally {
      isLoading.value = false;
      isDisabled.value = false;
    }
  }
}
