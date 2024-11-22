import 'package:flutter/material.dart';
import 'package:smg_buddy_app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:smg_buddy_app/theme/app_colors.dart';
import 'package:smg_buddy_app/theme/app_styles.dart';

class Timeouts {
  static const connectTimeout = 60000; // 60 seconds
  static const receiveTimeout = 60000; // 60 seconds
}

class ErrorMessages {
  static const noInternet = 'Please check your internet connection';
  static const connectionTimeout = 'Please check your internet connection';
  static const networkGeneral = 'Something went wrong. Please try again later.';
}

class Urls {
  static const appCastUrl = 'https://scshivam.github.io/update-flutter/cpc.xml';
}

class AppConstants {
  static const secondHalf = 'second_half';
  static const firstHalf = 'first_half';
  static const fullLeave = 'full_leave';
}

class DateConstant {
  static const monthsOfYear = [
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December"
  ];
  static const weekDays = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"];
}

class Footer {
  static const options = [
    Routes.schedule,
    Routes.language,
    Routes.menu,
    // Routes.myPlan,
    // Routes.topups,
    // Routes.profile
  ];
  static const menu = <BottomNavigationBarItem>[
    // BottomNavigationBarItem(
    //   icon: Icon(Icons.home_outlined),
    //   label: 'Home',
    // ),
    BottomNavigationBarItem(
      icon: Icon(Icons.calendar_today_outlined),
      label: "Schedule",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.notifications_none),
      label: "Notification",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.window_outlined),
      label: "Menu",
    ),
  ];
}

class MenuItems {
  static final items = [
    {
      "leading": Icon(Icons.account_circle_outlined),
      "title": Text("profile".tr,style: Styles.buttonText.copyWith(color: AppColors.secondaryColor),),
    },
    {
      "leading": Icon(Icons.event_note_outlined),
      "title": Text("orderHis".tr,style: Styles.buttonText.copyWith(color: AppColors.secondaryColor),),
    },
    {
      "leading": Icon(Icons.settings_outlined),
      "title": Text("settings".tr,style: Styles.buttonText.copyWith(color: AppColors.secondaryColor),),
    },
  ];
}
