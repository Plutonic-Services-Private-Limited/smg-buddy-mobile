import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:smg_buddy_app/constants/constants.dart';
import 'package:smg_buddy_app/data/models/order_model.dart';
import 'package:smg_buddy_app/data/repositories/order_repository.dart';
import 'package:smg_buddy_app/utils/storage.dart';

class ScheduleController extends GetxController {
  OrderRepository orderRepo = OrderRepository();
  @override
  Future<void> onInit() async {
    calcDays();
    await getOrder();
    super.onInit();
  }

  var dateToDay = [].obs;
  var date = DateTime.now().obs;
  var currentDay = DateTime.now().obs;
  var id = ''.obs;
  var selectedDay;
  var orders = [].obs;
  var currMonth = "".obs;
  var totalOrders = 0.obs;
  var isClickedIndex = 0.obs;

  void calcDays() {
    var tempDate = date.value;
    var tempData = [];
    currMonth.value = DateConstant.monthsOfYear[date.value.month - 1];
    for (var i = date.value.day;
        i <= DateUtils.getDaysInMonth(date.value.year, date.value.month);
        i++) {
      if (i == date.value.day) {
        tempData.add({
          "date": date.value.day,
          "day": DateConstant.weekDays[date.value.weekday - 1]
        });
        date.value = date.value.add(Duration(days: 1));
      }
    }
    dateToDay(tempData);
    date(tempDate);
  }

  onPrev() {
    date(DateTime(date.value.year, date.value.month - 1, 1));
    calcDays();
    isClickedIndex(0);
    update();
  }

  onNext() {
    date(DateTime(date.value.year, date.value.month + 1, 1));
    calcDays();
    isClickedIndex(0);
    update();
  }

  Future getOrder() async {
    EasyLoading.show();
    var response = await orderRepo.getOrders();
    if (response.length > 0) {
      totalOrders(response.length);
      for (var i = 0; i < response.length; i++) {
        orders.value.add(OrderModel.fromJson(response[i]));
      }
    }
    EasyLoading.dismiss();
  }
}
