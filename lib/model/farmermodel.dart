class FarmerLoginModel {
  int? status;
  String? message;
  Data? data;

  FarmerLoginModel({this.status, this.message, this.data});

  FarmerLoginModel.fromJson(Map<String, dynamic> json) {
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
  String? sId;
  GeoCoord? geoCoord;
  bool? farmGate;
  List<NearestSupplyLocation>? nearestSupplyLocation;
  String? adminApprovalStatus;
  String? callStatus;
  String? adminRejectionReason;
  bool? deleteStatus;
  String? deleteReason;
  String? deviceToken;
  String? lastLoggedIn;
  List<Items>? items;
  String? name;
  String? phoneNumber;
  BmLocation? bmLocation;
  NearestMarketLocation? nearestMarketLocation;
  String? address;
  Coordinates? coordinates;
  AddedBy? addedBy;
  Documents? documents;
  String? farmerNo;
  String? supplierId;
  String? createdAt;
  String? updatedAt;
  String? token;

  Data(
      {this.sId,
      this.geoCoord,
      this.farmGate,
      this.nearestSupplyLocation,
      this.adminApprovalStatus,
      this.callStatus,
      this.adminRejectionReason,
      this.deleteStatus,
      this.deleteReason,
      this.deviceToken,
      this.lastLoggedIn,
      this.items,
      this.name,
      this.phoneNumber,
      this.bmLocation,
      this.nearestMarketLocation,
      this.address,
      this.coordinates,
      this.addedBy,
      this.documents,
      this.farmerNo,
      this.supplierId,
      this.createdAt,
      this.updatedAt,
      this.token});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    geoCoord = json['geoCoord'] != null
        ? new GeoCoord.fromJson(json['geoCoord'])
        : null;
    farmGate = json['farmGate'];
    if (json['nearestSupplyLocation'] != null) {
      nearestSupplyLocation = <NearestSupplyLocation>[];
      json['nearestSupplyLocation'].forEach((v) {
        nearestSupplyLocation!.add(new NearestSupplyLocation.fromJson(v));
      });
    }
    adminApprovalStatus = json['adminApprovalStatus'];
    callStatus = json['callStatus'];
    adminRejectionReason = json['adminRejectionReason'];
    deleteStatus = json['deleteStatus'];
    deleteReason = json['deleteReason'];
    deviceToken = json['deviceToken'];
    lastLoggedIn = json['lastLoggedIn'];
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(new Items.fromJson(v));
      });
    }
    name = json['name'];
    phoneNumber = json['phoneNumber'];
    bmLocation = json['bmLocation'] != null
        ? new BmLocation.fromJson(json['bmLocation'])
        : null;
    nearestMarketLocation = json['nearestMarketLocation'] != null
        ? new NearestMarketLocation.fromJson(json['nearestMarketLocation'])
        : null;
    address = json['address'];
    coordinates = json['coordinates'] != null
        ? new Coordinates.fromJson(json['coordinates'])
        : null;
    addedBy =
        json['addedBy'] != null ? new AddedBy.fromJson(json['addedBy']) : null;
    documents = json['documents'] != null
        ? new Documents.fromJson(json['documents'])
        : null;
    farmerNo = json['farmer_no'];
    supplierId = json['supplierId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    if (this.geoCoord != null) {
      data['geoCoord'] = this.geoCoord!.toJson();
    }
    data['farmGate'] = this.farmGate;
    if (this.nearestSupplyLocation != null) {
      data['nearestSupplyLocation'] =
          this.nearestSupplyLocation!.map((v) => v.toJson()).toList();
    }
    data['adminApprovalStatus'] = this.adminApprovalStatus;
    data['callStatus'] = this.callStatus;
    data['adminRejectionReason'] = this.adminRejectionReason;
    data['deleteStatus'] = this.deleteStatus;
    data['deleteReason'] = this.deleteReason;
    data['deviceToken'] = this.deviceToken;
    data['lastLoggedIn'] = this.lastLoggedIn;
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    data['name'] = this.name;
    data['phoneNumber'] = this.phoneNumber;
    if (this.bmLocation != null) {
      data['bmLocation'] = this.bmLocation!.toJson();
    }
    if (this.nearestMarketLocation != null) {
      data['nearestMarketLocation'] = this.nearestMarketLocation!.toJson();
    }
    data['address'] = this.address;
    if (this.coordinates != null) {
      data['coordinates'] = this.coordinates!.toJson();
    }
    if (this.addedBy != null) {
      data['addedBy'] = this.addedBy!.toJson();
    }
    if (this.documents != null) {
      data['documents'] = this.documents!.toJson();
    }
    data['farmer_no'] = this.farmerNo;
    data['supplierId'] = this.supplierId;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['token'] = this.token;
    return data;
  }
}

class GeoCoord {
  String? type;
  List<double>? coordinates;

  GeoCoord({this.type, this.coordinates});

  GeoCoord.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    coordinates = json['coordinates'].cast<double>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = type;
    data['coordinates'] = this.coordinates;
    return data;
  }
}

class NearestSupplyLocation {
  String? sId;
  GeoCoord? geoCoord;
  bool? deleteStatus;
  String? city;
  String? ccDcAddress;
  String? ccDcShortName;
  String? createdAt;
  String? updatedAt;
  int? iV;

  NearestSupplyLocation(
      {this.sId,
      this.geoCoord,
      this.deleteStatus,
      this.city,
      this.ccDcAddress,
      this.ccDcShortName,
      this.createdAt,
      this.updatedAt,
      this.iV});

  NearestSupplyLocation.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    geoCoord = json['geoCoord'] != null
        ? new GeoCoord.fromJson(json['geoCoord'])
        : null;
    deleteStatus = json['deleteStatus'];
    city = json['city'];
    ccDcAddress = json['ccDcAddress'];
    ccDcShortName = json['ccDc_shortName'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    if (this.geoCoord != null) {
      data['geoCoord'] = this.geoCoord!.toJson();
    }
    data['deleteStatus'] = this.deleteStatus;
    data['city'] = this.city;
    data['ccDcAddress'] = this.ccDcAddress;
    data['ccDc_shortName'] = this.ccDcShortName;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}

class Items {
  AvailableQuantity? availableQuantity;
  bool? wantToParticipate;
  String? sId;
  Item? item;

  Items({this.availableQuantity, this.wantToParticipate, this.sId, this.item});

  Items.fromJson(Map<String, dynamic> json) {
    availableQuantity = json['availableQuantity'] != null
        ? new AvailableQuantity.fromJson(json['availableQuantity'])
        : null;
    wantToParticipate = json['wantToParticipate'];
    sId = json['_id'];
    item = json['item'] != null ? new Item.fromJson(json['item']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.availableQuantity != null) {
      data['availableQuantity'] = this.availableQuantity!.toJson();
    }
    data['wantToParticipate'] = this.wantToParticipate;
    data['_id'] = this.sId;
    if (this.item != null) {
      data['item'] = this.item!.toJson();
    }
    return data;
  }
}

class AvailableQuantity {
  int? quantity;
  String? unit;

  AvailableQuantity({this.quantity, this.unit});

  AvailableQuantity.fromJson(Map<String, dynamic> json) {
    quantity = json['quantity'];
    unit = json['unit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['quantity'] = this.quantity;
    data['unit'] = this.unit;
    return data;
  }
}

class Item {
  String? sId;
  String? materialCode;
  String? materialName;
  String? imageUrl;

  Item({this.sId, this.materialCode, this.materialName, this.imageUrl});

  Item.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    materialCode = json['material_code'];
    materialName = json['material_name'];
    imageUrl = json['imageUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['material_code'] = this.materialCode;
    data['material_name'] = this.materialName;
    data['imageUrl'] = this.imageUrl;
    return data;
  }
}

class BmLocation {
  String? sId;
  bool? deleteStatus;
  String? name;
  String? createdAt;
  String? updatedAt;
  int? iV;
  List<String>? plants;

  BmLocation(
      {this.sId,
      this.deleteStatus,
      this.name,
      this.createdAt,
      this.updatedAt,
      this.iV,
      this.plants});

  BmLocation.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    deleteStatus = json['deleteStatus'];
    name = json['name'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    plants = json['plants'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['deleteStatus'] = this.deleteStatus;
    data['name'] = this.name;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    data['plants'] = this.plants;
    return data;
  }
}

class NearestMarketLocation {
  String? sId;
  GeoCoord? marketGeoLocation;
  List<Null>? timeSlots;
  bool? deleteStatus;
  String? name;
  String? location;
  String? createdAt;
  String? updatedAt;
  int? iV;
  int? radius;
  int? marketCommission;

  NearestMarketLocation(
      {this.sId,
      this.marketGeoLocation,
      this.timeSlots,
      this.deleteStatus,
      this.name,
      this.location,
      this.createdAt,
      this.updatedAt,
      this.iV,
      this.radius,
      this.marketCommission});

  NearestMarketLocation.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    marketGeoLocation = json['marketGeoLocation'] != null
        ? new GeoCoord.fromJson(json['marketGeoLocation'])
        : null;
    if (json['timeSlots'] != null) {
      timeSlots = <Null>[];
    }
    deleteStatus = json['deleteStatus'];
    name = json['name'];
    location = json['location'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    radius = json['radius'];
    marketCommission = json['marketCommission'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    if (this.marketGeoLocation != null) {
      data['marketGeoLocation'] = this.marketGeoLocation!.toJson();
    }

    data['deleteStatus'] = this.deleteStatus;
    data['name'] = this.name;
    data['location'] = this.location;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    data['radius'] = this.radius;
    data['marketCommission'] = this.marketCommission;
    return data;
  }
}

class Coordinates {
  double? lat;
  double? long;

  Coordinates({this.lat, this.long});

  Coordinates.fromJson(Map<String, dynamic> json) {
    lat = json['lat'];
    long = json['long'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['lat'] = this.lat;
    data['long'] = this.long;
    return data;
  }
}

class AddedBy {
  String? sId;
  String? password;
  String? role;
  bool? deleteStatus;
  String? lastLoggedIn;
  String? name;
  String? email;
  String? phoneNumber;
  String? location;
  String? addedBy;
  String? createdAt;
  String? updatedAt;
  int? iV;

  AddedBy(
      {this.sId,
      this.password,
      this.role,
      this.deleteStatus,
      this.lastLoggedIn,
      this.name,
      this.email,
      this.phoneNumber,
      this.location,
      this.addedBy,
      this.createdAt,
      this.updatedAt,
      this.iV});

  AddedBy.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    password = json['password'];
    role = json['role'];
    deleteStatus = json['deleteStatus'];
    lastLoggedIn = json['lastLoggedIn'];
    name = json['name'];
    email = json['email'];
    phoneNumber = json['phoneNumber'];
    location = json['location'];
    addedBy = json['addedBy'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['password'] = this.password;
    data['role'] = this.role;
    data['deleteStatus'] = this.deleteStatus;
    data['lastLoggedIn'] = this.lastLoggedIn;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phoneNumber'] = this.phoneNumber;
    data['location'] = this.location;
    data['addedBy'] = this.addedBy;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}

class Documents {
  String? idProof;
  String? accountProof;
  String? addressProof;

  Documents({this.idProof, this.accountProof, this.addressProof});

  Documents.fromJson(Map<String, dynamic> json) {
    idProof = json['idProof'];
    accountProof = json['accountProof'];
    addressProof = json['addressProof'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idProof'] = this.idProof;
    data['accountProof'] = this.accountProof;
    data['addressProof'] = this.addressProof;
    return data;
  }
}
