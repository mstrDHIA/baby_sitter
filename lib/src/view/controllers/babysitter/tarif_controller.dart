/*import 'dart:developer';
import 'package:babysitter_v1/main.dart';
import 'package:babysitter_v1/src/core/constant/app_cache.dart';
import 'package:babysitter_v1/src/core/functions/show_snack_bar.dart';
import 'package:babysitter_v1/src/data/model/onboard/baby.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

class PlanificationController extends GetxController {
  late BabySitterModel babySitter;
  bool isDisabled = false;
  bool isLoading = false;
  TextEditingController coutEnfant1 = TextEditingController(text: "00.000");
  TextEditingController coutEnfant2 = TextEditingController(text: "00.000");
  TextEditingController coutEnfant3 = TextEditingController(text: "00.000");
  TextEditingController coutEnfant4 = TextEditingController(text: "00.000");
  TextEditingController coutEnfant5 = TextEditingController(text: "00.000");
 // PlannificationModel? planification;

  @override
  void onInit() {
    getDataFromDatabase();
    super.onInit();
  }

  /*Future<void> insertCout(double valeur) async {
    final response = await supabase.from('nom_de_votre_table').insert([
      {'colonne_double': valeur},
    ]);
    if (response.error != null) {
      print('Erreur lors de l\'insertion : ${response.error!.message}');
    } else {
      print('Valeur insérée avec succès !');
    }
  }
*/
  void nextStep(BuildContext context) async {
    if (coutEnfant1.text.isNotEmpty &&
        coutEnfant2.text.isNotEmpty &&
        coutEnfant3.text.isNotEmpty &&
        coutEnfant4.text.isNotEmpty &&
        coutEnfant5.text.isNotEmpty) {
      await updateCoutBaby(context);
    } else {
      showSnackbar(
       context,
        isError: true,
        message: "Veuillez remplir tous les champs.",
      );
    }
  }

  /*Future<void> updateCoutBaby(BuildContext context) async {
    isDisabled = true;
    isLoading = true;
    update();
    try {
      final String babysitterId = Uuid().v4();
      final uid = supabase.auth.currentUser?.id;
      await supabase.from('babysitters').insert({
        'babysitter_id': babysitterId,
          'user_id': uid,
        "coutenfant1": double.parse(coutEnfant1.text),
        "coutenfants2": double.parse(coutEnfant2.text),
        "coutenfants3": double.parse(coutEnfant3.text),
        "coutenfants4": double.parse(coutEnfant4.text),
        "coutenfants5": double.parse(coutEnfant5.text),
      }).match({'uid': AppCache.instance.getUid()});
      isDisabled = false;
      isLoading = false;
      update();
      showSnackbar( context, message: "Informations mises à jour.");
    } catch (e) {
      log("Error" + e.toString());
      isDisabled = false;
      isLoading = false;
      update();
      showSnackbar(
        context,
        isError: true,
        message: "Erreur lors de la mise à jour des informations.",
      );
    }
  }*/
  Future<void> updateCoutBaby(BuildContext context) async {
    isDisabled = true;
    isLoading = true;
    update();
    try {
      final uid = supabase.auth.currentUser?.id;
     // final babysitterId = AppCache.instance.getUid(); 
      final String babysitterId = Uuid().v4();
      
      await supabase.from('babysitters').insert({
        'babysitter_id': babysitterId,
        'user_id': uid,
        "coutenfant1": double.parse(coutEnfant1.text),
        "coutenfants2": double.parse(coutEnfant2.text),
        "coutenfants3": double.parse(coutEnfant3.text),
        "coutenfants4": double.parse(coutEnfant4.text),
        "coutenfants5": double.parse(coutEnfant5.text),
      });
      
      isDisabled = false;
      isLoading = false;
      update();
      showSnackbar(context, message: "Informations mises à jour.");
    } catch (e) {
      log("Error: " + e.toString());
      isDisabled = false;
      isLoading = false;
      update();
      showSnackbar(
        context,
        isError: true,
        message: "Erreur lors de la mise à jour des informations.",
      );
    }
}


  Future<void> getDataFromDatabase() async {
    try {
      final data = await supabase
          .from('babysitters')
          .select(
              'coutenfant1, coutenfants2, coutenfants3, coutenfants4, coutenfants5')
          .match({'uid': AppCache.instance.getUid()});

      log("Data" + data.toString());

      if (data.isNotEmpty) {
        coutEnfant1.text = data[0]['coutenfant1'] == null
            ? "00.000"
            : data[0]['coutenfant1'].toString();
        coutEnfant2.text = data[0]['coutenfants2'] == null
            ? "00.000"
            : data[0]['coutenfants2'].toString();
        coutEnfant3.text = data[0]['coutenfants3'] == null
            ? "00.000"
            : data[0]['coutenfants3'].toString();
        coutEnfant4.text = data[0]['coutenfants4'] == null
            ? "00.000"
            : data[0]['coutenfants4'].toString();
        coutEnfant5.text = data[0]['coutenfants5'] == null
            ? "00.000"
            : data[0]['coutenfants5'].toString();
        update();
      }
    } catch (e) {
      log("Error" + e.toString());
      showSnackbar(
        Get.context!,
        isError: true,
        message: "Erreur lors de la récupération des informations.",
      );
    }
  }
}
*/
import 'package:babysitter_v1/src/core/constant/app_cache.dart';
import 'package:uuid/uuid.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PlanificationController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  
  TextEditingController coutEnfant1 = TextEditingController(text: "00.000");
  TextEditingController coutEnfant2 = TextEditingController(text: "00.000");
  TextEditingController coutEnfant3 = TextEditingController(text: "00.000");
  TextEditingController coutEnfant4 = TextEditingController(text: "00.000");
  TextEditingController coutEnfant5 = TextEditingController(text: "00.000");

  var isLoading = false;
  var isDisabled = false;
 
  final SupabaseClient supabase = Supabase.instance.client;

  // Méthode pour aller à l'étape suivante
  Future<void> nextStep(BuildContext context) async {
    update();

    if (formKey.currentState?.validate() != true) {
      return;
    }

    isLoading = true;
    isDisabled = true;
    update();  // Ensure the UI reflects loading and disabling state

    try {
      // Générer un UUID pour babysitter_id
      final String babysitterId = Uuid().v4();

      // ID de l'utilisateur connecté
      final uid = supabase.auth.currentUser?.id;

      if (uid != null) {
        // Insertion des données dans la table babySitters
        Map<String,dynamic> response;
        if (AppCache.instance.getRole()=='parent'){
          response = await supabase.from('parent').update({
          'babysitter_id': babysitterId,
          'user_id': uid,
          'coutenfant1': double.parse(coutEnfant1.text),
          'coutenfants2': double.parse(coutEnfant2.text),
          'coutenfants3': double.parse(coutEnfant3.text),
          'coutenfants4': double.parse(coutEnfant4.text),
          'coutenfants5': double.parse(coutEnfant5.text),
        }).eq('user_id', AppCache.instance.getUid()).select().single();
        }
        else{
          response = await supabase.from('babysitters').update({
          'babysitter_id': babysitterId,
          'user_id': uid,
          'coutenfant1': double.parse(coutEnfant1.text),
          'coutenfants2': double.parse(coutEnfant2.text),
          'coutenfants3': double.parse(coutEnfant3.text),
          'coutenfants4': double.parse(coutEnfant4.text),
          'coutenfants5': double.parse(coutEnfant5.text),
        }).eq('user_id', AppCache.instance.getUid()).select().single();
        }
          // Add execute() to actually run the query

        if (response == null) {
          // Succès de l'insertion
          Get.snackbar('Succès', 'Les informations ont été enregistrées avec succès',
              snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.green, colorText: Colors.white);
          // Naviguer vers l'étape suivante
          // Navigator.pushNamed(context, '/nextStep'); // Remplacez par votre prochaine route
        } else {
          // Affichage d'une erreur
          Get.snackbar('Erreur', 'Une erreur s\'est produite lors de l\'insertion de l\'adresse :',
              snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.red, colorText: Colors.white);
        }
      } else {
        Get.snackbar('Erreur', 'Utilisateur non connecté',
            snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.red, colorText: Colors.white);
      }
    } catch (e) {
      Get.snackbar('Erreur', ' $e',
          snackPosition: SnackPosition.TOP, backgroundColor: Colors.red, colorText: Colors.white);
    } finally {
      isLoading = false;
      isDisabled = false;
      update();  // Ensure the UI reflects the end of loading and disabling state
    }
  }
}
