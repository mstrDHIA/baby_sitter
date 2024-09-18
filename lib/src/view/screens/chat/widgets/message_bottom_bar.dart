import 'package:babysitter_v1/src/core/constant/app_size.dart';
import 'package:babysitter_v1/src/view/controllers/babysitter/chat_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class MessageBottomBar extends StatelessWidget {
  final ChatController controller = Get.put(ChatController());
  
  final TextEditingController chatController=TextEditingController();
   MessageBottomBar({
    super.key,
     
  });

  @override
  Widget build(BuildContext context) {
    
    return BottomAppBar(
      padding: EdgeInsets.all(0),
      child: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: AppSize.screenWidth!*0.7,
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
                  
                  onPressed: (){
                  // messageNetwork.deleteMessage();
                  controller.sendMessage(message: chatController.text);
                }, child: const Text('Send')),
              )
            ],
          ),
        ),
      ),
    );
  }
}