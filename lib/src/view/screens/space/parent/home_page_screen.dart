import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:babysitter_v1/src/view/controllers/babysitter/home_page_controller.dart';

class ProfileScreen extends StatelessWidget {
  final ProfileController controller = Get.put(ProfileController(supabaseClient: Supabase.instance.client));

  @override
  Widget build(BuildContext context) {
    print('image: '+controller.avatarUrl.value);
    return Scaffold(
      appBar: AppBar(
        title: Text('Mon profil'),
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
            Obx(() {
              return Row(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: controller.avatarUrl.value.isNotEmpty
                        ? NetworkImage(controller.avatarUrl.value)
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
                        '${controller.nom.value} ${controller.prenom.value}',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Text(controller.adresse.value),
                      // Add icons for communication, e.g., phone, email
                    ],
                  ),
                ],
              );
            }),
            SizedBox(height: 16),
            // Status Section
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.pink[50],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('En attente... ', style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
                  Text('Attente de l\'approbation administrative'),
                ],
              ),
            ),
            SizedBox(height: 16),
            // Statistics Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildStatItem(Random().nextInt(20).toString(), 'Clients'),
                _buildStatItem('${controller.experience.value}+', 'Expérience'),
                _buildStatItem(Random().nextInt(5).toString(), 'Évaluation'),
                _buildStatItem(Random().nextInt(5).toString(), 'Avis'),
              ],
            ),
            SizedBox(height: 16),
            // Description Section
            Obx(() {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Description', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  SizedBox(height: 8),
                  Text(controller.description.value),
                ],
              );
            }),
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
    return Obx(() {
      return ListView.builder(
        itemCount: controller.services.length,
        itemBuilder: (context, index) {
          final service = controller.services[index];
          return ListTile(
            title: Text(service['service']),
            trailing: Text('${service['price']} DNT'),
          );
        },
      );
    });
  }

  Widget _buildAboutTab() {
    return Center(child: Text('À propos'));
  }

  Widget _buildPhotosVideosTab() {
    return Center(child: Text('Photos & vidéos'));
  }

  Widget _buildReviewsTab() {
    return Obx(() {
      return ListView.builder(
        itemCount: controller.reviews.length,
        itemBuilder: (context, index) {
          final review = controller.reviews[index];
          return ListTile(
            title: Text(review['reviewer']),
            subtitle: Text(review['comment']),
            trailing: Icon(Icons.star, color: Colors.amber),
          );
        },
      );
    });
  }
}
