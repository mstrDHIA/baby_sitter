import 'package:babysitter_v1/src/view/screens/chat/chat_screen.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ChatController extends GetxController{
  

  final SupabaseClient supabase = Supabase.instance.client;
  // get real time messages from supabase
  getMessagesStream(){
    
    Stream<List<Map<String,dynamic>>> _messagesStream = supabase
        .from('messages')
        .stream(primaryKey: ['id'])
        .order('created_at')
        .map((maps) => maps);
        return _messagesStream;
        //     .map((map) => Message.fromMap(map: map, myUserId: myUserId)
        //     )
            // .toList());
    // Stream stream= supabase.from('messages').stream(primaryKey: ['id']).order('created_at');
    // stream.map((map){
    //   print('aaa');
    //   print(map.toString());
    // });
    // return stream;
    // .map((maps) => maps
    //         .map((map) => Message.fromMap(map: map, myUserId: myUserId))
    //         .toList());
  }

  sendMessage({required String message}){

    supabase.from('messages').insert({'message':message,
    'sender':'parent',
    'receiver':'sitter'
    });

  }


  checkChat(user_1,user_2,user) async {
    print(user_1);
    print(user_2);
    final res=await supabase.from('chat').select().inFilter('user_1', [user_1,user_2]).inFilter('user_2', [user_1,user_2]);
    if(res.isNotEmpty){
      Get.to(()=>ChatScreen(res: res.first, user: user));
    }
    else{
      addChat(user_1,user_2,user);
    }
    print(res);
  }

  addChat(user_1,user_2,user) async {
    final res = await supabase.from('chat').insert({
      'user_1':user_1,
      'user_2':user_2
    }).select();

    Get.to(()=>ChatScreen(res: res.first, user: user));
    
  }
}