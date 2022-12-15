class HomePageItemModel {
  int? status = 0;
  String? message = "";
  Data? data = new Data();

  HomePageItemModel({this.status, this.message, this.data});

  HomePageItemModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? itemCount = 0;
  int? liveAuctionCount = 0;
  int? shortlistBidCount = 0;
  int? poCount = 0;
  int? notificationCount = 0;

  Data(
      {this.itemCount,
      this.liveAuctionCount,
      this.shortlistBidCount,
      this.poCount,
      this.notificationCount});

  Data.fromJson(Map<String, dynamic> json) {
    itemCount = json['itemCount'];
    liveAuctionCount = json['liveAuctionCount'];
    shortlistBidCount = json['shortlistBidCount'];
    poCount = json['poCount'];
    notificationCount = json['notificationCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['itemCount'] = this.itemCount;
    data['liveAuctionCount'] = this.liveAuctionCount;
    data['shortlistBidCount'] = this.shortlistBidCount;
    data['poCount'] = this.poCount;
    data['notificationCount'] = this.notificationCount;
    return data;
  }
}
