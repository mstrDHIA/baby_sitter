import 'package:babysitter_v1/src/core/constant/app_cache.dart';
import 'package:babysitter_v1/src/view/controllers/loading_controller.dart';
import 'package:babysitter_v1/src/view/screens/chat/chat_list_screen.dart';
import 'package:babysitter_v1/src/view/screens/space/babysitter/babysitter_list_screen.dart';
import 'package:babysitter_v1/src/view/screens/space/babysitter/home_page_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class MyDrawer extends StatelessWidget {
  final LoadingController controller = Get.put(LoadingController());
   MyDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          // ListTile(
          //   leading: CircleAvatar(
          //      backgroundImage: (user['avatar']!=null)
          //               ? NetworkImage(user['avatar'])
          //               : AssetImage('assets/default_avatar.jpg') as ImageProvider,
          //   ),
          // ),
          ListTile(
            onTap: (){

              if(AppCache.instance.getRole()=='parent'){
                Get.off(()=>BabysitterListScreen());
              }
              else{
                Get.off(()=>ProfileScreen());
              }
            },
            title: Text('Acceuil'),
            leading: Icon(Icons.home),
            style: ListTileStyle.drawer,
          ),
          
          if(AppCache.instance.getRole()=='parent')
          ListTile(
            title: Text('Favoris'),
            leading: Icon(Icons.favorite),
            style: ListTileStyle.drawer,
          ),
          ListTile(
            title: Text('Profile'),
            leading: Icon(Icons.person),
            style: ListTileStyle.drawer,
          ),
          ListTile(
            onTap: (){
              Get.to(()=>ChatListScreen());
            },
            leading: Icon(Icons.message),
            title: Text('Chat'),
            style: ListTileStyle.drawer,
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Parametres'),
            style: ListTileStyle.drawer,
          ),
          ListTile(
            leading: Icon(Icons.notifications),
            title: Text('Notifications'),
            style: ListTileStyle.drawer,
          ),
          ListTile(
            leading: Icon(Icons.palette),
            title: Text('Themes'),
            style: ListTileStyle.drawer,
          ),
          ListTile(
            leading: Icon(Icons.question_answer),
            title: Text('FAQ'),
            style: ListTileStyle.drawer,
          ),
          ListTile(
            leading: Icon(Icons.feedback),
            title: Text('Feedback'),
            style: ListTileStyle.drawer,
          ),
          ListTile(
            onTap: (){
              controller.logout();
            },
            leading: Icon(Icons.logout),
            title: Text('Deconnection'),
            style: ListTileStyle.drawer,
          ),
    
        ],
      ),
    );
  }
}