import 'package:flutter/material.dart';
import 'package:smg_buddy_app/constants/constants.dart';
import 'package:smg_buddy_app/modules/menu_screen/controller/menu_controller.dart';
import 'package:get/get.dart';
import 'package:smg_buddy_app/theme/app_colors.dart';
import 'package:smg_buddy_app/theme/app_styles.dart';
import 'package:smg_buddy_app/widgets/bottom_nav_bar.dart';
class MenuView extends StatelessWidget {
  const MenuView({super.key});

  @override
  Widget build(BuildContext context) {
    return  GetBuilder<CustomMenuController>(
      init: CustomMenuController(),
        builder: (controller){
        return SafeArea(
            child: Scaffold(
              body: Column(
                children: [
                  Stack(

                    children: [
                      Container(
                        height: 200,
                        decoration: BoxDecoration(
                          color: AppColors.primaryColor
                        ),
                      ),
                      Positioned(
                        top: 150,
                          left: 0,
                          right: 0,
                          child: CircleAvatar(

                            backgroundImage: NetworkImage(controller.img),
                            radius: 65,
                          )
                      ),



                    ],
                    clipBehavior: Clip.none,
                  ),
                  SizedBox(
                    height: 100,
                  ),
                  Text("Subhash Mishra",style: Styles.headerLarge28,),
                  SizedBox(height: 30,),
                  Expanded(
                      child: ListView.builder(
                    itemCount: 3,
                      itemBuilder:(context,index){
                        return Container(
                          padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: AppColors.secondaryText10,
                                width: 1
                              )
                            )
                          ),
                          child: ListTile(

                            leading: MenuItems.items[index]["leading"],
                            title: MenuItems.items[index]["title"],
                          ),
                        );
                      }
                  ))
                ],
              ),

              bottomNavigationBar: BottomNavigation(),
            )
        );
        }

    );
  }
}
