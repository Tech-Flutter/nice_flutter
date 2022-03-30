class LoginModel {
  bool? status;
  String? message;
  Data? data;

  LoginModel({this.status, this.message, this.data});

  LoginModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  int? roleId;
  String? name;
  String? email;
  Null? emailVerifiedAt;
  Null? mobile;
  Null? billingAddress;
  Null? deliveryAddress;
  Null? gstin;
  Null? referenceName;
  Null? referenceMobile;
  Null? transporterName;
  Null? transporterContact;
  Null? area;
  Null? locationType;
  int? status;
  String? apiAccessToken;
  String? createdAt;
  String? updatedAt;
  int? paramValue;
  String? paramName;
  String? paramDescription;
  CheckinId? checkinId;

  Data(
      {this.id,
      this.roleId,
      this.name,
      this.email,
      this.emailVerifiedAt,
      this.mobile,
      this.billingAddress,
      this.deliveryAddress,
      this.gstin,
      this.referenceName,
      this.referenceMobile,
      this.transporterName,
      this.transporterContact,
      this.area,
      this.locationType,
      this.status,
      this.apiAccessToken,
      this.createdAt,
      this.updatedAt,
      this.paramValue,
      this.paramName,
      this.paramDescription,
      this.checkinId});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    roleId = json['role_id'];
    name = json['name'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    mobile = json['mobile'];
    billingAddress = json['billing_address'];
    deliveryAddress = json['delivery_address'];
    gstin = json['gstin'];
    referenceName = json['reference_name'];
    referenceMobile = json['reference_mobile'];
    transporterName = json['transporter_name'];
    transporterContact = json['transporter_contact'];
    area = json['area'];
    locationType = json['location_type'];
    status = json['status'];
    apiAccessToken = json['api_access_token'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    paramValue = json['param_value'];
    paramName = json['param_name'];
    paramDescription = json['param_description'];
    checkinId = json['checkin_id'] != null
        ? CheckinId.fromJson(json['checkin_id'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['role_id'] = roleId;
    data['name'] = name;
    data['email'] = email;
    data['email_verified_at'] = emailVerifiedAt;
    data['mobile'] = mobile;
    data['billing_address'] = billingAddress;
    data['delivery_address'] = deliveryAddress;
    data['gstin'] = gstin;
    data['reference_name'] = referenceName;
    data['reference_mobile'] = referenceMobile;
    data['transporter_name'] = transporterName;
    data['transporter_contact'] = transporterContact;
    data['area'] = area;
    data['location_type'] = locationType;
    data['status'] = status;
    data['api_access_token'] = apiAccessToken;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['param_value'] = paramValue;
    data['param_name'] = paramName;
    data['param_description'] = paramDescription;
    if (checkinId != null) {
      data['checkin_id'] = checkinId!.toJson();
    }
    return data;
  }
}

class CheckinId {
  int? id;

  CheckinId({this.id});

  CheckinId.fromJson(Map<String, dynamic> json) {
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    return data;
  }
}
