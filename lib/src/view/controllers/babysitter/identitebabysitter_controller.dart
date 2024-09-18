import 'dart:developer';
import 'dart:io';
import 'package:babysitter_v1/main.dart';
import 'package:babysitter_v1/src/core/constant/app_cache.dart';
import 'package:babysitter_v1/src/core/constant/app_color.dart';
import 'package:babysitter_v1/src/core/constant/app_route.dart';
import 'package:babysitter_v1/src/view/screens/space/babysitter/tarif_screen.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class IdentitBabySitterTapeTwoController extends GetxController {
  File? _imageCinFront;
  File? _imageCinBack;
  String? _imageurlFront;
  String? _imageurlBack;
  late String _imageBaseUrl;

  String? get imageurlFront => _imageurlFront;
  String? get imageurlBack => _imageurlBack;

  @override
  void onInit() {
    super.onInit();
    _imageBaseUrl = dotenv.get("SUPABASE_IMAGE_URL");
    getImageFromDatabase();
  }

  Future<void> getImageFromDatabase() async {
    try {
      final userId = AppCache.instance.getUid();
      if (userId == null) return;
      
      final data = await supabase
          .from('babySitters')
          .select('cin_recto, cin_verso')
          .eq('uid', userId)
          .single();

      if (data != null && (data['cin_recto'] != null || data['cin_verso'] != null)) {
        _imageurlFront = "$_imageBaseUrl${data['cin_recto']}";
        _imageurlBack = "$_imageBaseUrl${data['cin_verso']}";
        log("Front Image URL: $_imageurlFront");
        log("Back Image URL: $_imageurlBack");
        update();
      }
    } catch (e) {
      log('Error getting image: $e');
    }
  }

  Future<void> handleUploadFrontImage() async {
    XFile? imageFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (imageFile != null) {
      _imageCinFront = File(imageFile.path);
      await uploadFrontImage();
      _imageurlFront = _imageCinFront!.path;
      update();
    }
  }

  Future<void> handleUploadBackImage() async {
    XFile? imageFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (imageFile != null) {
      _imageCinBack = File(imageFile.path);
      await uploadBackImage();
      _imageurlBack = _imageCinBack!.path;
      update();
    }
  }

  Future<void> uploadFrontImage() async {
    String currentDateTime = DateFormat('yyyyMMdd_HHmmss').format(DateTime.now());
    String fileName = 'user_cin_front_$currentDateTime.jpg';
    String filePath = "upload/cin/";

    try {
      final response = await supabase.storage
          .from('images')
          .upload('$filePath$fileName', _imageCinFront!);

      if (response == null) {
        await updateDatabaseFront(fileName);
      } else {
        log('Error uploading front image: ${response}');
      }
    } catch (e) {
      log('Error uploading front image: $e');
    }
  }

  Future<void> uploadBackImage() async {
    String currentDateTime = DateFormat('yyyyMMdd_HHmmss').format(DateTime.now());
    String fileName = 'user_cin_back_$currentDateTime.jpg';
    String filePath = "upload/cin/";

    try {
      final response = await supabase.storage
          .from('images')
          .upload('$filePath$fileName', _imageCinBack!);

      if (response == null) {
        await updateDatabaseBack(fileName);
      } else {
        log('Error uploading back image: ${response}');
      }
    } catch (e) {
      log('Error uploading back image: $e');
    }
  }

  Future<void> updateDatabaseFront(String fileName) async {
    String imageUrl = "$_imageBaseUrl/images/$fileName";
    await supabase.from('babySitters').update({
      'cin_recto': imageUrl,
    }).eq('uid', AppCache.instance.getUid());

    _imageurlFront = imageUrl;
    update();
  }

  Future<void> updateDatabaseBack(String fileName) async {
    String imageUrl = "$_imageBaseUrl/images/$fileName";
    await supabase.from('babySitters').update({
      'cin_verso': imageUrl,
    }).eq('uid', AppCache.instance.getUid());

    _imageurlBack = imageUrl;
    update();
  }

  void handleNext() {
    if (_imageurlFront != null && _imageurlBack != null) {
      Get.to(TarifScreen());
    } else {
      Get.snackbar("Erreur", "Veuillez importer une image !",
          snackPosition: SnackPosition.BOTTOM, backgroundColor: AppColor.white);
    }
  }
}
