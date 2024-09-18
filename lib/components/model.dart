class Message{
  final String message;
  final String date;
  final String email;
  Message({required this.message,required this.date,required this.email});
  factory Message.fromJson( json)
  {
    return Message(message: json['message'], date: json['date'], email: json['sender_message']);
  }
}