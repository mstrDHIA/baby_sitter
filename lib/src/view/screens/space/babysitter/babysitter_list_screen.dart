import 'dart:math';

import 'package:babysitter_v1/src/core/constant/app_size.dart';
import 'package:babysitter_v1/src/view/controllers/babysitter/babysitter_controller.dart';
import 'package:babysitter_v1/src/view/screens/chat/chat_list_screen.dart';
import 'package:babysitter_v1/src/view/screens/space/widgets/babysitter_card_widget.dart';
import 'package:babysitter_v1/src/view/screens/widget/drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BabysitterListScreen extends StatelessWidget{
  final BabysitterController controller = Get.put(BabysitterController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<BabysitterController>(
      builder: (controller) {
        return Scaffold(
          drawer: MyDrawer(),
          appBar: AppBar(title: Text("Babysitters"),),
          body: FutureBuilder(
            future: controller.getBabySittersList(),
             builder: (context,snapshot){
              
              if(snapshot.hasError) {
                Get.snackbar('Erreur', 'Impossible d\'importer la liste des babysitters');
                return Container();
              }
              else if(snapshot.connectionState==ConnectionState.waiting){
                return LinearProgressIndicator();
              }
              else if(!snapshot.hasData){
                return Center(child: Text('Empty'),);
              }
              else{
                
                List<Map<String,dynamic>> res=snapshot.data as List<Map<String,dynamic>>;
                
                return ListView.builder(
              itemCount: res.length,
              itemBuilder: (context,index){
                return BabysitterCardWidget(res: res,index: index);
              // 

            });
            // return Text(res.toString());
              }
            
          }),
        );
      }
    );
    // TODO: implement build
    throw UnimplementedError();
  }

}



