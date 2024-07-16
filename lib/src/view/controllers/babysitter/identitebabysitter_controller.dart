import 'dart:developer';
import 'dart:io';
import 'package:babysitter_v1/main.dart';
import 'package:babysitter_v1/src/core/constant/app_cache.dart';
import 'package:babysitter_v1/src/core/constant/app_color.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

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
      final data = await supabase
          .from('babySitter')
          .select('image_cin_front, image_cin_back')
          .match({'uid': AppCache.instance.getUid()});

      if (data.isNotEmpty && data[0]['image_cin_front'] != null ||
          data[0]['image_cin_back'] != null) {
        _imageurlFront = "$_imageBaseUrl${data[0]['image_cin_front'].toString()}";
        _imageurlBack = "$_imageBaseUrl${data[0]['image_cin_back'].toString()}";
        log(_imageurlFront.toString());
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
      uploadFrontImage();
      update();
    }
  }

  Future<void> handleUploadBackImage() async {
    XFile? imageFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (imageFile != null) {
      _imageCinBack = File(imageFile.path);
      uploadBackImage();
      update();
    }
  }

  Future<void> uploadFrontImage() async {
    String currentDateTime = DateFormat('yyyyMMdd_HHmmss').format(DateTime.now());
    String fileName = 'user_cin_$currentDateTime.jpg';
    String filePath = "upload/cin/";

    try {
      final response = await supabase.storage
          .from('images')
          .upload('$filePath$fileName', _imageCinFront!);
      log("image front: $response");
      await updateDatabaseFront(response);
    } catch (e) {
      log('Error uploading front image: $e');
    }
  }

  Future<void> uploadBackImage() async {
    String currentDateTime = DateFormat('yyyyMMdd_HHmmss').format(DateTime.now());
    String fileName = 'user_cin_$currentDateTime.jpg';
    String filePath = "upload/cin/";

    try {
      final response = await supabase.storage
          .from('images')
          .upload('$filePath$fileName', _imageCinBack!);
      log("image back: $response");
      await updateDatabaseBack(response);
    } catch (e) {
      log('Error uploading back image: $e');
    }
  }

  Future<void> updateDatabaseBack(String image) async {
    await supabase.from('babySitter').update({
      'image_cin_back': image,
    }).match({'uid': AppCache.instance.getUid()});

    _imageurlBack = "$_imageBaseUrl${image.toString()}";
    update();
  }

  Future<void> updateDatabaseFront(String image) async {
    await supabase.from('babySitter').update({
      'image_cin_front': image,
    }).match({'uid': AppCache.instance.getUid()});

    _imageurlFront = "$_imageBaseUrl${image.toString()}";
    update();
  }

  void handleNext() {
    if (_imageurlFront != null && _imageurlBack != null) {
      Get.toNamed('/planification_baby_sitter_tape_three_screen');
    } else {
      Get.snackbar("Erreur", "Veuillez importer une image ! ",
          snackPosition: SnackPosition.BOTTOM, backgroundColor: AppColor.primaryColor);
    }
  }
}
