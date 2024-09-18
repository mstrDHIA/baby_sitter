/*import 'dart:developer';
import 'package:babysitter_v1/src/core/constant/app_route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class PlanificationBabysitterController extends GetxController {
  final SupabaseClient _supabaseClient = Supabase.instance.client;
  RxList<String> selectedDays = <String>[].obs;
  Map<String, TextEditingController> startControllers = {};
  Map<String, TextEditingController> endControllers = {};
  RxMap<String, TimeOfDay> startTimes = <String, TimeOfDay>{}.obs;
  RxMap<String, TimeOfDay> endTimes = <String, TimeOfDay>{}.obs;
  List<String> weekdays = ['Lundi', 'Mardi', 'Mercredi', 'Jeudi', 'Vendredi', 'Samedi', 'Dimanche'];
  late String babysitterId;

  @override
  void onInit() {
    super.onInit();
    final arguments = Get.arguments as Map<String, dynamic>?;
    babysitterId = arguments?['babysitterId'] ?? '';
    for (var day in weekdays) {
      startControllers[day] = TextEditingController();
      endControllers[day] = TextEditingController();
    }
  }

  TextEditingController getStartController(String day) => startControllers[day]!;
  TextEditingController getEndController(String day) => endControllers[day]!;

  void onDaySelected(String day) {
    if (selectedDays.contains(day)) {
      selectedDays.remove(day);
    } else {
      selectedDays.add(day);
      startTimes[day] = TimeOfDay(hour: 8, minute: 0);
      endTimes[day] = TimeOfDay(hour: 17, minute: 0);
      startControllers[day]?.text = startTimes[day]?.format(Get.context!) ?? '08:00';
      endControllers[day]?.text = endTimes[day]?.format(Get.context!) ?? '17:00';
    }
  }

  Future<void> selectTime(BuildContext context, String day, bool isStart) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: isStart ? (startTimes[day] ?? TimeOfDay(hour: 8, minute: 0)) : (endTimes[day] ?? TimeOfDay(hour: 17, minute: 0)),
    );
    if (pickedTime != null) {
      if (isStart) {
        startTimes[day] = pickedTime;
        startControllers[day]?.text = pickedTime.format(context);
      } else {
        endTimes[day] = pickedTime;
        endControllers[day]?.text = pickedTime.format(context);
      }
      update();
    }
  }

  Future<void> nextStep() async {
    try {
      final uid = Supabase.instance.client.auth.currentUser?.id;
      if (uid == null) {
        throw Exception("Utilisateur non connecté");
      }

      for (var day in selectedDays) {
        final startTime = startTimes[day]?.format(Get.context!) ?? '08:00';
        final endTime = endTimes[day]?.format(Get.context!) ?? '17:00';

        final formattedStartTime = '$startTime:00';
        final formattedEndTime = '$endTime:00';

        log('Inserting: babysitterId=$babysitterId, userId=$uid, day=$day, startTime=$formattedStartTime, endTime=$formattedEndTime');

        final response = await _supabaseClient
            .from('babysitters')
            .insert({
              'babysitter_id': babysitterId,
              'user_id': uid,
              'weekday': day,
              'hour_start': formattedStartTime,
              'hour_end': formattedEndTime,
            });

        if (response.error != null) {
          log('Error: ${response.error!.message}');
          throw response.error!;
        }
      }
      Get.snackbar('Succès', 'Emploi du temps enregistré avec succès');
      Get.toNamed(AppRoute.tarif);
    } catch (e) {
      Get.snackbar('Erreur', 'Échec de l\'enregistrement de l\'emploi du temps : ${e.toString()}');
    }
  }

  @override
  void onClose() {
    startControllers.forEach((key, controller) => controller.dispose());
    endControllers.forEach((key, controller) => controller.dispose());
    super.onClose();
  }
}*/
