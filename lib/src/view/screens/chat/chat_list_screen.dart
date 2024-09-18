import 'package:babysitter_v1/src/core/constant/app_cache.dart';
import 'package:babysitter_v1/src/view/screens/chat/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ChatListScreen extends StatelessWidget {
  final SupabaseClient supabase = Supabase.instance.client;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat Screen'),
      ),
      body: StreamBuilder(
          stream: supabase.from('chat').stream(primaryKey: ['id'])
              // .eq('sender', AppCache.instance.getUid())
              // .order('created_at')
              .map((maps) => maps),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return LinearProgressIndicator();
            } else if (snapshot.hasError) {
              print(snapshot.error);
              return Center(
                child: Text("Problem"),
              );
            } else if (snapshot.hasData == false) {
              return Center(
                child: Text("Empty"),
              );
            } else {
              List<Map<String, dynamic>> chats =
                  snapshot.data as List<Map<String, dynamic>>;
              List<Map<String, dynamic>> filteredChats = [];
              List<String> userIds=[];
              chats.forEach((element) {
                if (element['user_1'] == AppCache.instance.getUid() ||
                    element['user_2'] == AppCache.instance.getUid()) {
                  filteredChats.add(element);
                  if(element['user_1']!=AppCache.instance.getUid())
                  userIds.add(element['user_1']);
                  else userIds.add(element['user_2']);
                }
              });

              if (filteredChats.isNotEmpty) {
                // filteredUSers=filteredChats
                // print('not empty');
                return FutureBuilder(
                    future: supabase
                        .from('user')
                        .select(
                            'id,role,first_name,last_name,phone_number,date_of_birth,gender,avatar')
                        .inFilter('id', userIds),
                    builder: (context, futureSnapshot) {
                      if (futureSnapshot.hasError)
                        {return Center(
                          child: Text('Error'),
                        );}
                      else if (futureSnapshot.connectionState ==
                          ConnectionState.waiting)
                        {return LinearProgressIndicator();}
                      else
                        {
                          List<Map<String,dynamic>> users=futureSnapshot.data as List<Map<String,dynamic>>;
                          // print('users $users');
                          // for(int i=0;i<filteredChats.length;i++){
                          //   for (int j=0;j<users.length;j++){
                          //     if(filteredChats[i]['user_1']==users[j]['id']){
                          //       print('found1');
                          //       filteredChats[i]['user_1']=users[j];
                          //       users.removeAt(j);
                          //       break;
                          //     }
                          //     else if(filteredChats[i]['user_1']==users[j]['id']){
                          //       print('found1');
                          //       filteredChats[i]['user_1']=users[j];
                          //       users.removeAt(j);
                          //       break;
                          //     }
                          //   }
                          //   // if(filteredChats[i]['user_1']==users)
                          // }
                          
                          // print(filteredChats);
                          
                          return ListView.separated(
                            
                            itemBuilder: (context, index) {
                              print(filteredChats);
                              print(users);
                              Map<String,dynamic> user=users.firstWhere((element)=>((element['id']==filteredChats[index]['user_1']||element['id']==filteredChats[index]['user_2'])&&(element['id']!=AppCache.instance.getUid())));
                              
                              // print(users.firstWhere((element)=>element['id']==(filteredChats[index]['user_1']||element['id']==filteredChats[index]['user_2'])&&element['id']!=AppCache.instance.getUid()));
                              return ListTile(
                                onTap: () {
                                  Get.to(()=>ChatScreen(res: filteredChats[index],user: user,));
                                },
                                leading: CircleAvatar(
                    radius: 40,
                    backgroundImage: (user['avatar']!=null)
                        ? NetworkImage(user['avatar'])
                        : AssetImage('assets/default_avatar.jpg') as ImageProvider,
                    onBackgroundImageError: (error, stackTrace) {
                      // Log error or show a snackbar/toast
                      print('Failed to load image: $error');
                      // Optionally, set a flag or change the image provider to a default one
                    },
                  ),
                                title: 
                                    Text(user['first_name']),
                              );
                            },
                            separatorBuilder: (context, index) {
                              return Divider();
                            },
                            itemCount: filteredChats.length);}
                    });
              } else {
                return Center(
                  child: Text('Empty'),
                );
              }
            
              
            }
          }),
    );
    // TODO: implement build
    throw UnimplementedError();
  }
}
