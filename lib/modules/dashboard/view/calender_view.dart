import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smg_buddy_app/modules/dashboard/controller/dashboard_controller.dart';
import 'package:smg_buddy_app/routes/app_pages.dart';
import 'package:smg_buddy_app/theme/app_colors.dart';
import 'package:smg_buddy_app/theme/app_styles.dart';
import 'package:smg_buddy_app/utils/storage.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarView extends StatelessWidget {
  const CalendarView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(
        init: DashboardController(),
        builder: (controller) {
          return SafeArea(
              child: Scaffold(
                appBar: AppBar(
                  leading: IconButton(onPressed: () { Get.back(); }, icon: Icon(Icons.chevron_left),),
                  backgroundColor: AppColors.white,
                ),
                  body: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("calendar".tr,style: Styles.headerLarge28,),
                        SizedBox(height: 40,),
                        Obx(()=>TableCalendar(
                                    focusedDay: controller.date.value,
                                    firstDay: DateTime(2024,11,1),
                                    lastDay: DateTime(2030, 12, 31),
                                    calendarStyle: CalendarStyle(
                                      selectedDecoration: BoxDecoration(
                                        color: AppColors.primaryColor, // Set your desired color here
                                        shape: BoxShape.circle, // Circle shape for selected day
                                      ),
                                      todayDecoration: BoxDecoration(
                                        color: AppColors.primaryColor,
                                        shape: BoxShape.circle,
                                      )
                                    ),
                                    onPageChanged: (fDay){
                                      controller.date.value=fDay;
                                      // controller.calcDays();
                                    },
                                    headerStyle: HeaderStyle(
                                      formatButtonVisible: false,
                                      titleCentered: true,
                                    ),
                                  ),)
                      ],
                    ),
                  )));
        });
  }
}
