import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smg_buddy_app/constants/assets.dart';
import 'package:smg_buddy_app/modules/dashboard/controller/dashboard_controller.dart';
import 'package:smg_buddy_app/theme/app_colors.dart';
import 'package:smg_buddy_app/theme/app_styles.dart';
import 'package:smg_buddy_app/utils/storage.dart';
class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return  GetBuilder<DashboardController>(
      init: DashboardController(),
        builder: (controller){
          return SafeArea(
              child: Scaffold(
                appBar: AppBar(
                  title:Text("schedule".tr,style: Styles.headerLarge28,),
                  backgroundColor: AppColors.white,
                ),
                body: Column(
                  children: [
                    Container(
                      height: 40,
                      width: double.infinity,
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                              onPressed: (){},
                              icon: Icon(Icons.chevron_left)
                          ),
                          Text("May"),
                          IconButton(
                              onPressed: (){},
                              icon: Icon(Icons.chevron_right)
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: 100,
                      decoration: BoxDecoration(
                        // border: Border.all(width: 1,color: AppColors.secondaryText10)
                      ),
                      child: Expanded(

                          child:
                          ListView.builder(
                            scrollDirection: Axis.horizontal,
                              itemCount: 7,
                              itemBuilder: (context,index){
                                return Container(
                                  margin: EdgeInsets.symmetric(horizontal: 5,vertical: 5),
                                  decoration: BoxDecoration(

                                      border: Border.all(width: 1,color: AppColors.secondaryText10),
                                    borderRadius: BorderRadius.circular(100)
                                  ),
                                  child: Obx(()=>TextButton(
                                      onPressed: (){
                                        controller.isClickedIndex.value=index;
                                      },
                                      style: ButtonStyle(
                                        backgroundColor: index==controller.isClickedIndex.value?MaterialStateProperty.all(AppColors.primaryColor):MaterialStateProperty.all(AppColors.white),
                                        overlayColor: MaterialStateProperty.all(AppColors.primaryText10),

                                      ),

                                      child:Text("${controller.dateToDay[index]["date"]}\n${controller.dateToDay[index]["day"]}",style: index==controller.isClickedIndex.value?Styles.bodyMedium16.copyWith(color: AppColors.white):Styles.bodyMedium16,textAlign: TextAlign.center,),

                                  ),)
                                );
                              }
                          )


                      ),
                    ),
                    Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                                height:150,
                                child:Image.asset(Assets.noOrder),
                            ),
                            Text("noOrder".tr,style: Styles.headerSmall21,),
                            Text("noOrderBody".tr,style: Styles.bodyMedium16,),
                          ],
                        ),
                    ),
                  ],
                ),
              )
          );
        }
    );
  }
}
