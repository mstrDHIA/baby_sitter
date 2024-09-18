import 'package:babysitter_v1/src/core/constant/app_cache.dart';
import 'package:babysitter_v1/src/core/constant/app_route.dart';
import 'package:babysitter_v1/src/view/screens/space/babysitter/babysitter_photo_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class EspaceController extends GetxController {
  final RxString userRole = ''.obs;
  final supabase = Supabase.instance.client;

  Future<void> setUserRole(String role) async {
    if (role.isEmpty) {
      Get.snackbar('Erreur', 'Le rôle ne peut pas être vide');
      return;
    }

    final user = supabase.auth.currentUser;
    if (user == null) {
      Get.snackbar('Erreur', 'Utilisateur non authentifié');
      return;
    }

    final userId = user.id;

    try {
      final response = await supabase
          .from('user')
          .upsert({'id': userId, 'role': role})
          .select()
          .single();

      if (response == null) {
        Get.snackbar('Erreur', 'Impossible de définir le rôle de l\'utilisateur');
      } else {
        AppCache.instance.setRole(role);
        userRole.value = role;
        // Enregistrez le rôle dans votre cache local si nécessaire
        navigateBasedOnRole();
      }
    } catch (e) {
      Get.snackbar('Exception', 'Erreur lors de la définition du rôle : $e');
    }
  }

  void navigateBasedOnRole() {
    switch (userRole.value) {
      case 'babySitter':
        Get.to(AjoutBabysitterPhotoScreen());
        break;
      case 'parent':
        Get.to(AjoutBabysitterPhotoScreen());
        // Get.toNamed(AppRoute.horaire);
        break;
      default:
        Get.snackbar('Erreur', 'Rôle invalide pour la navigation');
    }
  }
}
