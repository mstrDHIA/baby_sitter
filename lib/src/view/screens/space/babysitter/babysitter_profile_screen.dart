import 'dart:math';

import 'package:babysitter_v1/src/core/constant/app_cache.dart';
import 'package:babysitter_v1/src/view/controllers/babysitter/chat_controller.dart';
import 'package:babysitter_v1/src/view/screens/chat/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:babysitter_v1/src/view/controllers/babysitter/home_page_controller.dart';

class BabySitterProfileScreen extends StatelessWidget {
  final ChatController controller = Get.put(ChatController());
  final Map<String,dynamic> sitter;
  
   BabySitterProfileScreen({super.key, required this.sitter});
  // final ProfileController controller = Get.put(ProfileController(supabaseClient: Supabase.instance.client));

  @override
  Widget build(BuildContext context) {
    // print('image: '+sitter.['avatar'].value);
    return Scaffold(
      appBar: AppBar(
        title: Text('${sitter['first_name']} ${sitter['last_name']}',),
        // leading: IconButton(
        //   icon: Icon(Icons.arrow_back),
        //   onPressed: () => Get.back(),
        // ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Profile Header
           
               Row(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: (sitter['avatar']!=null)
                        ? NetworkImage(sitter['avatar'])
                        : AssetImage('assets/default_avatar.jpg') as ImageProvider,
                    onBackgroundImageError: (error, stackTrace) {
                      // Log error or show a snackbar/toast
                      print('Failed to load image: $error');
                      // Optionally, set a flag or change the image provider to a default one
                    },
                  ),
                  SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${sitter['first_name']} ${sitter['last_name']}',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Container(
                        width: MediaQuery.sizeOf(context).width*0.6,
                        child: Text('${sitter['babysitters'].first['dependance']}, ${sitter['babysitters'].first['adresse']}')),
                      // Add icons for communication, e.g., phone, email
                    ],
                  ),
                  
                ],
              ),
           
            SizedBox(height: 16),
            // Status Section
            InkWell(
              onTap: (){
                controller.checkChat(AppCache.instance.getUid(), sitter['id'],sitter);

                // Get.to(()=>ChatScreen(
                //   res: sitter,
                // ));
              },
              child: Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.pink[50],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Envoyer un message', style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
                    // Text('Attente de l\'approbation administrative'),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16),
            // Statistics Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildStatItem(Random().nextInt(20).toString(), 'Clients'),
                _buildStatItem('${sitter['babysitters'].first['année_experience']}+', 'Expérience'),
                _buildStatItem(Random().nextInt(5).toString(), 'Évaluation'),
                _buildStatItem(Random().nextInt(5).toString(), 'Avis'),
              ],
            ),
            SizedBox(height: 16),
            // Description Section
             Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Text('Description', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  // SizedBox(height: 8),
                  // Text(sitter['babysitters'].first['description']),
                ],
              ),
            SizedBox(height: 16),
            // Tab Bar
            DefaultTabController(
              length: 4,
              child: Column(
                children: [
                  TabBar(
                    labelColor: Colors.pink,
                    unselectedLabelColor: Colors.grey,
                    indicatorColor: Colors.pink,
                    tabs: [
                      Tab(text: 'Services'),
                      Tab(text: 'À propos'),
                      Tab(text: 'Photos & vidéos'),
                      Tab(text: 'Avis'),
                    ],
                  ),
                  Container(
                    height: 300, // Adjust height as needed
                    child: TabBarView(
                      children: [
                        _buildServicesTab(),
                        _buildAboutTab(),
                        _buildPhotosVideosTab(),
                        _buildReviewsTab(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatItem(String value, String label) {
    return Column(
      children: [
        Text(value, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        Text(label),
      ],
    );
  }

  Widget _buildServicesTab() {
    return Center(child: Text('Services'));
    // return Obx(() {
    //   return ListView.builder(
    //     itemCount: controller.services.length,
    //     itemBuilder: (context, index) {
    //       final service = controller.services[index];
    //       return ListTile(
    //         title: Text(service['service']),
    //         trailing: Text('${service['price']} DNT'),
    //       );
    //     },
    //   );
    // });
  }

  Widget _buildAboutTab() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Description', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Center(child: Text(sitter['babysitters'].first['description'])),
          ],
        ),
        Center(child: Text(sitter['babysitters'].first['dependance'])),
        Center(child: Text(sitter['babysitters'].first['adresse'])),
        Center(child: Text(sitter['babysitters'].first['langue_maternelle'])),
        Center(child: Text(sitter['babysitters'].first['autre_langue'])),
        Center(child: Text(sitter['babysitters'].first['garde_enfant'].toString())),
              ],
    );
  }

  Widget _buildPhotosVideosTab() {
    return Center(child: Text('Photos & vidéos'));
  }

  Widget _buildReviewsTab() {
    return Center(child: Text('Avis'));
  //   return Obx(() {
  //     return ListView.builder(
  //       itemCount: controller.reviews.length,
  //       itemBuilder: (context, index) {
  //         final review = controller.reviews[index];
  //         return ListTile(
  //           title: Text(review['reviewer']),
  //           subtitle: Text(review['comment']),
  //           trailing: Icon(Icons.star, color: Colors.amber),
  //         );
  //       },
  //     );
  //   });
  }
}
