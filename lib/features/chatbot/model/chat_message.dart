class Message {
  final String? text;
  final String? imagePath;
  final bool isUser;

  Message({
    this.text,
    this.imagePath,
    required this.isUser,
  });
}