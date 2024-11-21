
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smg_buddy_app/constants/constants.dart';
import 'package:smg_buddy_app/utils/storage.dart';

class DashboardController extends GetxController{
  var dateToDay = [
  ].obs;
  var date=DateTime.now().obs;

 var currMonth="".obs;
  @override
  void onReady(){
    calcDays();
    super.onReady();
  }
  void calcDays(){
    for(var i =date.value.day;i<=DateUtils.getDaysInMonth(date.value.year, date.value.month);i++){
      dateToDay.value.add({"date":date.value.day,"day":DateConstant.weekDays[date.value.weekday-1]});
      date.value=date.value.add(Duration(days: 1));
    }
    currMonth.value=DateConstant.monthsOfYear[date.value.month-1];
  }




  var isClickedIndex=0.obs;
}
