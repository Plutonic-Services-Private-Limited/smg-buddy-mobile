class OrderModel {
  String? customerName;
  int? orderId;
  String? orderTime;
  String? orderSlot;

  OrderModel({this.customerName, this.orderId, this.orderTime, this.orderSlot});

  OrderModel.fromJson(Map<String, dynamic> json) {
    customerName = json['customer_name'];
    orderId = json['order_id'];
    orderTime = json['order_time'];
    orderSlot = json['order_slot'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['customer_name'] = this.customerName;
    data['order_id'] = this.orderId;
    data['order_time'] = this.orderTime;
    data['order_slot'] = this.orderSlot;
    return data;
  }
}