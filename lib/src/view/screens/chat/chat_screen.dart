import 'package:babysitter_v1/src/core/constant/app_cache.dart';
import 'package:babysitter_v1/src/core/constant/app_size.dart';
import 'package:babysitter_v1/src/view/controllers/babysitter/chat_controller.dart';
import 'package:babysitter_v1/src/view/screens/chat/widgets/message_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ChatScreen extends StatefulWidget{
  final Map<String,dynamic> res;
  final Map<String,dynamic> user;

  const ChatScreen({super.key, required this.res, required this.user});
  @override
  State<ChatScreen> createState() => _ChatScreenState(res: res, user: user);
}

class _ChatScreenState extends State<ChatScreen> {
  
  TextEditingController chatController=TextEditingController();
  final Map<String,dynamic> res;
  final SupabaseClient supabase = Supabase.instance.client;
  late Stream stream;
  final Map<String,dynamic> user;

  _ChatScreenState({required this.res,required this.user});
  // late Stream stream;
  @override
  void initState() {
    stream =supabase
        .from('messages')
        .stream(primaryKey: ['id'])
        .eq('chat_id', res['id'])
        .order('created_at')
        .map((maps) => maps);
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: Text('${user['first_name']} ${user['last_name']}'),
      elevation: 2,
      
      actions: [Padding(
        padding: const EdgeInsets.all(8.0),
        child: CircleAvatar( backgroundImage: (user['avatar']!=null)
                          ? NetworkImage(user['avatar'])
                          : AssetImage('assets/default_avatar.jpg') as ImageProvider,),
      )],),
      body: Container(
        child: StreamBuilder(stream: 
        // controller.
        stream,
         builder: (context,snapshot){
          if (snapshot.connectionState==ConnectionState.waiting){
            return LinearProgressIndicator();
          }
          else if(snapshot.hasError) return Center(child: Text('Error'));
          else if(!snapshot.hasData){
            return Center(child: Text('Empty'));
          }
          else{
            List<Map<String,dynamic>> messages=snapshot.data as List<Map<String,dynamic>>;
            return ListView.builder(
              shrinkWrap: true,
              reverse: true,
            itemCount: messages.length,
            itemBuilder: (context,index){
              return Directionality(
                textDirection: (messages[index]['sender']==AppCache.instance.getUid())?TextDirection.rtl:TextDirection.ltr,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Container(
                        constraints: BoxConstraints(
                          maxWidth: AppSize.screenWidth!*0.6,
                        ),
                        // width: AppSize.screenWidth,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: (messages[index]['sender']==AppCache.instance.getUid())?Theme.of(context).primaryColor:Theme.of(context).dividerColor
                      
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(messages[index]['message'],
                          style: TextStyle(
                            color: Colors.white,
                            fontSize:14
                          ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            });
          }
          
            // return Container(
            //   child: Text(snapshot.data.toString()),
            // );
          // });

        }),
      ),
      bottomNavigationBar: 
      
        // MessageBottomBar()
        BottomAppBar(
        
        padding: EdgeInsets.all(0),
        child: Container(
        color: Colors.white,
        child:  Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              width: AppSize.screenWidth!*0.6,
              child: TextFormField(
                decoration: const InputDecoration(
                  fillColor: Colors.white,
                  // border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black))
                ),
                controller: chatController,
              ),
            ),
            Container(
              width: AppSize.screenWidth!*0.25,
              child: ElevatedButton(
                
                onPressed: () async {
                  String receiver=(res['user_1']!=AppCache.instance.getUid())?res['user_1']:res['user_2'];
                  await supabase.from('messages').insert({'message':chatController.text,
    'sender':AppCache.instance.getUid(),
    'receiver':receiver,
    'chat_id':res['id']
    });
    chatController.clear();
                // messageNetwork.deleteMessage();
                // messageNetwork.sendMessage(chatController, context,username);
              }, child: const Text('Send')),
            )
          ],
        ),
            ),
      )
    );
    // TODO: implement build
    throw UnimplementedError();
  }
}