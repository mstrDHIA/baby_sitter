import 'package:babysitter_v1/src/core/constant/app_cache.dart';
import 'package:babysitter_v1/src/core/constant/app_route.dart';
import 'package:babysitter_v1/src/view/screens/space/babysitter/description_screen.dart';
import 'package:uuid/uuid.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdresseBabysitterController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final adresseController = TextEditingController();
  final postaleController = TextEditingController();
  String? selectedDependance;

  var isLoading = false.obs;
  var isDisabled = false.obs;
 
  final SupabaseClient supabase = Supabase.instance.client;

  // Méthode pour définir la dépendance sélectionnée
  void setDependance(String? value) {
    selectedDependance = value;
    update(); // Met à jour le GetBuilder
  }

  // Méthode pour aller à l'étape suivante
  Future<void> nextStep(BuildContext context) async {
    if (formKey.currentState?.validate() != true) {
      return;
    }

    isLoading.value = true;
    isDisabled.value = true;

    try {
      
      final String babysitterId = Uuid().v4();

      
      final uid = supabase.auth.currentUser?.id;
      String role=await AppCache.instance.getRole();
      // print(role);
      if (uid != null) {
        Map<String,dynamic> response;
        if(role=='parent'){
          // print('hello from parent');
          // print(uid);
          // print(adresseController.text);
          // print(postaleController.text);
          // print(selectedDependance);
          response = await supabase.from('parent').insert({
          // 'babysitter_id': babysitterId,
          'user_id': uid,
          'addresse': adresseController.text,
          'numero_postale': int.parse(postaleController.text),
          'dependance': selectedDependance,
        }).select().single();
        // print(response);
        // print('bye from parent');
        }
        else{
          // print('hello from sitter');
           response = await supabase.from('babysitters').insert({
          'babysitter_id': babysitterId,
          'user_id': uid,
          'adresse': adresseController.text,
          'numero_postale': int.parse(postaleController.text),
          'dependance': selectedDependance,
        }).select().single();
        }
        

        if (response!=null && response.isNotEmpty) {
          // Succès de l'insertion
          Get.snackbar('Succès', 'Les informations ont été enregistrées avec succès',
              snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.green, colorText: Colors.white);
              // if(role=='parent')
              // Get.toNamed(AppRoute.parentDescription);
              // else 
              Get.to(RegisterBabySitterEtapeOneScreen());
          // Naviguer vers l'étape suivante
        //  Navigator.pushNamed(context, '/nextStep'); // Remplacez par votre prochaine route
        } else {
          // Affichage d'une erreur
          Get.snackbar('Erreur', 'Une erreur s\'est produite lors de l\'insertion de l\'adresse : ',
              snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.red, colorText: Colors.white);
        }
      } else {
        Get.snackbar('Erreur', 'Utilisateur non connecté',
            snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.red, colorText: Colors.white);
      }
    } catch (e) {
      Get.snackbar('Erreur', ' $e',
          snackPosition: SnackPosition.TOP, backgroundColor: Colors.white, colorText: Colors.white);
          
    } finally {
      isLoading.value = false;
      isDisabled.value = false;
    }
  }
}
