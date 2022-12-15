class NotificationListModel {
  int? status;
  String? message;
  List<Data>? data;
  int? count;

  NotificationListModel({this.status, this.message, this.data, this.count});

  NotificationListModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['count'] = this.count;
    return data;
  }
}

class Data {
  String? id;
  bool? seenStatus;
  bool? deleteStatus;
  String? sId;
  List<Notification>? notification;
  String? userId;
  String? title;
  String? message;
  String? type;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Data(
      {this.id,
      this.seenStatus,
      this.deleteStatus,
      this.sId,
      this.notification,
      this.userId,
      this.title,
      this.message,
      this.type,
      this.createdAt,
      this.updatedAt,
      this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    seenStatus = json['seenStatus'];
    deleteStatus = json['deleteStatus'];
    sId = json['_id'];
    if (json['notification'] != null) {
      notification = <Notification>[];
      json['notification'].forEach((v) {
        notification!.add(new Notification.fromJson(v));
      });
    }
    userId = json['userId'];
    title = json['title'];
    message = json['message'];
    type = json['type'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['seenStatus'] = this.seenStatus;
    data['deleteStatus'] = this.deleteStatus;
    data['_id'] = this.sId;
    if (this.notification != null) {
      data['notification'] = this.notification!.map((v) => v.toJson()).toList();
    }
    data['userId'] = this.userId;
    data['title'] = this.title;
    data['message'] = this.message;
    data['type'] = this.type;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}

class Notification {
  String? sId;
  English? english;
  English? hindi;
  English? kannada;
  English? marathi;
  English? tamil;
  English? telugu;

  Notification(
      {this.sId,
      this.english,
      this.hindi,
      this.kannada,
      this.marathi,
      this.tamil,
      this.telugu});

  Notification.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    english =
        json['english'] != null ? new English.fromJson(json['english']) : null;
    hindi = json['hindi'] != null ? new English.fromJson(json['hindi']) : null;
    kannada =
        json['kannada'] != null ? new English.fromJson(json['kannada']) : null;
    marathi =
        json['marathi'] != null ? new English.fromJson(json['marathi']) : null;
    tamil = json['tamil'] != null ? new English.fromJson(json['tamil']) : null;
    telugu =
        json['telugu'] != null ? new English.fromJson(json['telugu']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    if (this.english != null) {
      data['english'] = this.english!.toJson();
    }
    if (this.hindi != null) {
      data['hindi'] = this.hindi!.toJson();
    }
    if (this.kannada != null) {
      data['kannada'] = this.kannada!.toJson();
    }
    if (this.marathi != null) {
      data['marathi'] = this.marathi!.toJson();
    }
    if (this.tamil != null) {
      data['tamil'] = this.tamil!.toJson();
    }
    if (this.telugu != null) {
      data['telugu'] = this.telugu!.toJson();
    }
    return data;
  }
}

class English {
  String? title;
  String? message;

  English({this.title, this.message});

  English.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['message'] = this.message;
    return data;
  }
}
