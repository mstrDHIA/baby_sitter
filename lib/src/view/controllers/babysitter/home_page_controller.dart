import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ProfileController extends GetxController {
  final SupabaseClient supabaseClient;

  RxString avatarUrl = ''.obs;
  RxString description = ''.obs;
  RxString nom = ''.obs;
  RxString prenom = ''.obs;
  RxString adresse = ''.obs;
  RxString telephone = ''.obs;
  RxString email = ''.obs;
  RxString dateNaissance = ''.obs;
  RxInt experience = 0.obs;
  RxList<Map<String, dynamic>> services = <Map<String, dynamic>>[].obs;
  RxList<Map<String, dynamic>> reviews = <Map<String, dynamic>>[].obs;

  ProfileController({required this.supabaseClient});

  @override
  void onInit() {
    super.onInit();
    fetchUserProfile();
  }

  Future<void> fetchUserProfile() async {
    final userId = supabaseClient.auth.currentUser?.id;

    if (userId != null) {
      try {
        // Fetch data from the 'user' table
        final userResponse = await supabaseClient
            .from('user')
            .select()
            .eq('id', userId)
            .single();

        if (userResponse != null) {
          final userData = userResponse as Map<String, dynamic>;

          nom.value = userData['first_name'] ?? '';
          prenom.value = userData['last_name'] ?? '';
          telephone.value = userData['phone_number'] ?? '';
          email.value = userData['email'] ?? '';
          dateNaissance.value = userData['date_of_birth'] ?? '';
          avatarUrl.value=userData['avatar'] ?? '';
          // Fetch data from the 'babysitters' table using 'user_id'
          final babysitterResponse = await supabaseClient
              .from('babysitters')
              .select()
              .eq('user_id', userId)
              .single();

          if (babysitterResponse != null) {
            final babysitterData = babysitterResponse as Map<String, dynamic>;

            adresse.value = babysitterData['adresse'] ?? '';
            description.value = babysitterData['description'] ?? '';
            experience.value = babysitterData['annee_experience'] ?? 0;

            // Fetch or initialize services (tariffs)
            services.value = babysitterData['services'] != null
                ? List<Map<String, dynamic>>.from(babysitterData['services'])
                : _defaultServices();

            // Fetch or initialize reviews
            reviews.value = babysitterData['reviews'] != null
                ? List<Map<String, dynamic>>.from(babysitterData['reviews'])
                : [];
          } else {
            print('No babysitter profile found');
          }

          // Fetch profile image from Supabase storage
          final imageFileName = await fetchProfileImageFilename(userId);
          if (imageFileName != null) {
            final storageResponse = supabaseClient.storage
                .from('images')
                .getPublicUrl('images/$imageFileName');

            // avatarUrl.value = storageResponse;
          } else {
            print('No profile image found');
          }
        } else {
          print('No user profile found');
        }
      } catch (e) {
        print('Error fetching profile: $e');
      }
    }
  }

  // Method to fetch the profile image filename from Supabase storage
  Future<String?> fetchProfileImageFilename(String userId) async {
    try {
      final response = await supabaseClient
          .storage
          .from('images')
          .list(path: 'images', searchOptions: SearchOptions(limit: 100));

      if (response == null) {
        for (final file in response!) {
          if (file.name.contains(userId)) {
            return file.name;
          }
        }
      } else {
        print('Error listing images: ${response}');
      }
    } catch (e) {
      print('Error fetching profile image filename: $e');
    }
    return null;
  }

  List<Map<String, dynamic>> _defaultServices() {
    return [
      {'service': '1 Enfant', 'price': 20000},
      {'service': '2 Enfants', 'price': 30000},
      // Add more default services as needed
    ];
  }

  Future<void> addReview(Map<String, dynamic> newReview) async {
    reviews.add(newReview);
    // Save to Supabase (update or insert into the babysitters table)
    final userId = supabaseClient.auth.currentUser?.id;

    if (userId != null) {
      try {
        await supabaseClient
            .from('babysitters')
            .update({'reviews': reviews})
            .eq('user_id', userId);
      } catch (e) {
        print('Error adding review: $e');
      }
    }
  }

  // Add more methods to handle other actions (like updating services, adding photos, etc.)
}
