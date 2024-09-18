import 'dart:math';

import 'package:babysitter_v1/main.dart';
import 'package:babysitter_v1/src/core/constant/app_size.dart';
import 'package:babysitter_v1/src/view/screens/space/babysitter/babysitter_profile_screen.dart';
import 'package:babysitter_v1/src/view/screens/space/babysitter/home_page_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class BabysitterCardWidget extends StatelessWidget {
  const BabysitterCardWidget({
    super.key,
    required this.res, required this.index,
  });

  final List<Map<String, dynamic>> res;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: InkWell(
        onTap: (){
                print('aaaa');
                Get.to(() => BabySitterProfileScreen(sitter: res[index],));
                // Get.to(BabySitterProfileScreen(sitter: res[index],));
              },
        child: Card(
          
          
          child: Container(
            // height: 60,
            height: AppSize.screenHeight!*0.2,
            child: Center(
              child: ListTile(
                
                minVerticalPadding: 0,
                contentPadding: EdgeInsets.all(8),
                visualDensity: VisualDensity(vertical: -1),
              leading: (res[index]['avatar']==null)?Container(
                width: AppSize.screenWidth!*0.25,
                child: Icon(Icons.person)):
                // ClipRRect(

                // borderRadius: BorderRadius.circular(10),
                // child: 
                Container(
                  height: AppSize.screenHeight!*0.2,
                  width: AppSize.screenWidth!*0.25,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.network(res[index]['avatar'],
                      // scale: 5,
                      // height: 500,
                                        fit: BoxFit.fitHeight,
                                        ),
                    ],
                  ),
                ),
              // ),
              isThreeLine: true,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('${res[index]['first_name']} ${res[index]['last_name']}'),
                  Icon(Icons.favorite_border)
                ],
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Divider(),
                  Row(
                    children: [
                      (res[index]['gender']=='Homme')?Icon(Icons.male):Icon(Icons.female),
                      Text('${res[index]['gender']}'),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 2.5),
                        child: Icon(Icons.pin_drop_outlined,size: 18,),
                      ),
                      Container(
                        width: AppSize.screenWidth!*0.45,
                        child: Text('${res[index]['babysitters'].first['dependance']}, ${res[index]['babysitters'].first['adresse']}',
                        overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 6),
                    child: Text('Experience: ${res[index]['babysitters'].first['année_experience']} ans',),
                  ),
                  Row(children: [
                    Icon(Icons.star_rate_rounded,color: Colors.amber,),
                    Text(Random().nextInt(5).toString()),
                    Text(' | '),
                    // VerticalDivider(),
                    Text(Random().nextInt(2000).toString()),
                    Text(' Reviews')
                  ],)
            
                ],
              ),
              
                              ),
            ),
          ),),
      ),
    );
  }
}