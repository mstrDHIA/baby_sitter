class Message {
  String? uid;
  DateTime? created;
  String? message;

  Message({this.uid, this.created, this.message});

 factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
        uid: json['uid'],
        created: json['created'],
        message: json['message']);}


Map<String, dynamic> toJson() {
    return {
      // 'uid': uid,
      'uid': uid,
      'created_at': created,
      'message': message,
    };
}

}