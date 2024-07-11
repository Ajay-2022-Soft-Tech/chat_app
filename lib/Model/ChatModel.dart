class ChatModel {
  String? id;
  String? message;
  String? senderName;
  String? senderId;
  String? receiverId;
  DateTime? timestamp;
  bool? readStatus;
  String? imageUrl;
  String? videoUrl;
  String? audioUrl;
  String? documentUrl;
  List<String>? reactions;
  List<dynamic>? replies;

  ChatModel({
    this.id,
    this.message,
    this.senderName,
    this.senderId,
    this.receiverId,
    this.timestamp,
    this.readStatus,
    this.imageUrl,
    this.videoUrl,
    this.audioUrl,
    this.documentUrl,
    this.reactions,
    this.replies,
  });

  ChatModel.fromJson(Map<String, dynamic> json) {
    if (json['id'] is String) {
      id = json['id'];
    }
    if (json['message'] is String) {
      message = json['message'];
    }
    if (json['senderName'] is String) {
      senderName = json['senderName'];
    }
    if (json['senderId'] is String) {
      senderId = json['senderId'];
    }
    if (json['receiverId'] is String) {
      receiverId = json['receiverId'];
    }
    if (json['timestamp'] is String) {
      timestamp = DateTime.parse(json['timestamp']);
    }
    if (json['readStatus'] is bool) {
      readStatus = json['readStatus'];
    }
    if (json['imageUrl'] is String) {
      imageUrl = json['imageUrl'];
    }
    if (json['videoUrl'] is String) {
      videoUrl = json['videoUrl'];
    }
    if (json['audioUrl'] is String) {
      audioUrl = json['audioUrl'];
    }
    if (json['documentUrl'] is String) {
      documentUrl = json['documentUrl'];
    }
    if (json['reactions'] is List) {
      reactions = (json['reactions'] as List).map((e) => e as String).toList();
    }
    if (json['replies'] is List) {
      replies = (json['replies'] as List)
          .map((e) => ChatModel.fromJson(e as Map<String, dynamic>))
          .toList();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data['id'] = id;
    _data['message'] = message;
    _data['senderName'] = senderName;
    _data['senderId'] = senderId;
    _data['receiverId'] = receiverId;
    _data['timestamp'] = timestamp?.toIso8601String();
    _data['readStatus'] = readStatus;
    _data['imageUrl'] = imageUrl;
    _data['videoUrl'] = videoUrl;
    _data['audioUrl'] = audioUrl;
    _data['documentUrl'] = documentUrl;
    if (reactions != null) {
      _data['reactions'] = reactions;
    }
    if (replies != null) {
      _data['replies'] = replies?.map((e) => e.toJson()).toList();
    }
    return _data;
  }
}
