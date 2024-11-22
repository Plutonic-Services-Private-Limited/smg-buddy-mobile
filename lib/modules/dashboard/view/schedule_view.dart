import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:smg_buddy_app/constants/assets.dart';
import 'package:smg_buddy_app/modules/dashboard/controller/schedule_controller.dart';
import 'package:smg_buddy_app/routes/app_pages.dart';
import 'package:smg_buddy_app/theme/app_colors.dart';
import 'package:smg_buddy_app/theme/app_styles.dart';
import 'package:smg_buddy_app/utils/storage.dart';
import 'package:smg_buddy_app/widgets/bottom_nav_bar.dart';

class ScheduleView extends StatelessWidget {
  const ScheduleView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ScheduleController>(
        init: ScheduleController(),
        builder: (controller) {
          return SafeArea(
              child: Scaffold(
            appBar: AppBar(
              title: Text(
                "schedule".tr,
                style: Styles.headerLarge28,
              ),
              backgroundColor: AppColors.white,
            ),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 40,
                  width: double.infinity,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          onPressed: () {
                            controller.onPrev();
                          }, icon: Icon(Icons.chevron_left)),
                      Obx(() => TextButton(
                          onPressed: () {
                            Get.toNamed(Routes.calendar);
                          },
                          child: Text(
                            "${controller.currMonth.value} ${controller.date.value.year}",
                            style: Styles.buttonText
                                .copyWith(color: AppColors.secondaryColor),
                          ))),
                      IconButton(
                          onPressed: () {
                            controller.onNext();
                          }, icon: Icon(Icons.chevron_right))
                    ],
                  ),
                ),
                Container(
                  height: 100,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: controller.dateToDay.value.length,
                      itemBuilder: (context, index) {
                        return Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 5, vertical: 5),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: 1,
                                    color: AppColors.secondaryText10),
                                borderRadius: BorderRadius.circular(100)),
                            child: Obx(
                              () => TextButton(
                                onPressed: () {
                                  controller.isClickedIndex.value = index;
                                },
                                style: ButtonStyle(
                                  backgroundColor: index ==
                                          controller.isClickedIndex.value
                                      ? MaterialStateProperty.all(
                                          AppColors.primaryColor)
                                      : MaterialStateProperty.all(
                                          AppColors.white),
                                  overlayColor: MaterialStateProperty.all(
                                      AppColors.primaryText10),
                                ),
                                child: Text(
                                  "${controller.dateToDay.value[index]["date"]}\n${controller.dateToDay.value[index]["day"]}",
                                  style: index ==
                                          controller.isClickedIndex.value
                                      ? Styles.bodyMedium16
                                          .copyWith(color: AppColors.white)
                                      : Styles.bodyMedium16,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ));
                      }),
                ),
                SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 0),
                  child: Text("ongoing".tr,style: Styles.headerLarge28),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      Obx(()=>controller.totalOrders.value>0?Expanded(
                        child: ListView.builder(
                            itemCount: controller.totalOrders.value,
                            itemBuilder: (context, index) {
                              return Container(
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      color: AppColors.secondaryText10,
                                      width: 1
                                    )
                                  )
                                ),
                                child: ListTile(
                                  title: Text("pickup".tr,style: Styles.buttonText.copyWith(color: AppColors.primaryColor),),
                                  isThreeLine: true,
                                  subtitle:
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text("${controller.orders.value[index].orderSlot}",style: Styles.buttonText.copyWith(color: AppColors.secondaryColor),),
                                          Text("${controller.orders.value[index].customerName}",style: Styles.bodyMedium16,)
                                        ],

                                      ),

                                  trailing: Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 1,
                                            color: AppColors.secondaryText10),
                                        borderRadius: BorderRadius.circular(100)),
                                    child: IconButton(
                                        onPressed: () {},
                                        icon: Icon(Icons.chevron_right)),
                                  ),
                                ),
                              );
                            }),
                      )
                      :Column(
                      children:[SizedBox(
                        height: 150,
                        child: Image.asset(Assets.noOrder),
                      ),
                      Text(
                        "noOrder".tr,
                        style: Styles.headerSmall21,
                      ),
                      Text(
                        "noOrderBody".tr,
                        style: Styles.bodyMedium16,
                      ),])),
                    ],
                  ),
                ),

              ],
            ),
                bottomNavigationBar: BottomNavigation(selectRoute: "/schedule",)
          ),
          );
        });
  }
}
