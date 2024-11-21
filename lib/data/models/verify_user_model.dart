class VerifyUserModel {
  int? warehouseManagerId;
  int? buddyId;
  String? userType;
  String? message;

  VerifyUserModel({this.warehouseManagerId, this.buddyId, this.userType});

  VerifyUserModel.fromJson(Map<String, dynamic> json) {
    warehouseManagerId = json['warehouse_manager_id'];
    buddyId = json['buddy_id'];
    userType = json['user_type'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['warehouse_manager_id'] = warehouseManagerId;
    data['buddy_id'] = buddyId;
    data['user_type'] = userType;
    data['message'] = message;
    return data;
  }
}
