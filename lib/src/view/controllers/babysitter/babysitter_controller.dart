import 'package:babysitter_v1/src/data/model/onboard/baby.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class BabysitterController extends GetxController{
  var isLoading = false.obs;
  var isDisabled = false.obs;
  List<BabySitterModel> babySitters =[];
  final SupabaseClient supabase = Supabase.instance.client;

  getBabySittersList() async {
    final response = await supabase.from('user').select('id,email,role,first_name,last_name,phone_number,date_of_birth,gender,avatar,babysitters(user_id,adresse,dependance,description,année_experience,langue_maternelle,autre_langue,garde_enfant)').eq('role', 'babySitter');
    // print(response);
    return response;
  }


  getChatBabySittersList() async {
    final response = await supabase.from('user').select('id,email,role,first_name,last_name,phone_number,date_of_birth,gender,avatar,chat(id,user_1,user_2)');
    // print(response);
    return response;
  }
  // getCurrent

}