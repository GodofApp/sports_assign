

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sports_assign/views/players/player_view.dart';

import 'package:getwidget/components/checkbox/gf_checkbox.dart';
import 'package:getwidget/types/gf_checkbox_type.dart';


import '../../color_constants.dart';
import '../../controller/match_controller.dart';
import '../../utils/design_constants.dart';
import '../../utils/text_lan_common.dart';
import '../../utils/utility.dart';
import '../rounded_button.dart';

class PlayerScreen extends StatelessWidget {

  MatchController matchController = Get.find();


  PlayerScreen({Key? key}) : super(key: key){
    WidgetsBinding.instance.addPostFrameCallback((_) {
      matchController.addListCheckBox();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.dark_blue_grey_three,
        appBar: AppBar(
          backgroundColor: AppColors.black,
          title: const Text("Matches",style: TextStyle(color: Colors.white)),
        ),
        body: Column(
          children: [

            RoundedButton(
              colour: Colors.lightBlueAccent,
              title: 'Filter',
              onPressed: ()  {
                showFliterBottom(context);
              },
            ),

            Obx(() => Expanded(
              child: ListView.builder(
                // physics: const NeverScrollableScrollPhysics(),
                physics: const AlwaysScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: matchController.playersList.isNotEmpty
                    ? matchController.playersList
                    .where((i) => (
                    (matchController.teamIdFilter!.isNotEmpty
                        ? i.teamId == matchController.teamIdFilter : true)))
                    .toList()
                    .length
                    :matchController.playersList.length,
                itemBuilder: (BuildContext context, int index) {
                  return PlayerView(index: index,);
                },
              ),
            ),)
          ],
        )
    );
  }


  void showFliterBottom(BuildContext context) {
    final theme = Theme.of(context);
    final oldCheckboxTheme = theme.checkboxTheme;

    final newCheckBoxTheme = oldCheckboxTheme.copyWith(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
    );

    Get.bottomSheet(
      Wrap(
        children: [
          Obx(
                () => Column(mainAxisSize: MainAxisSize.max, children: [
              Padding(
                padding:
                const EdgeInsets.only(left: 13.0, top: 10.0, right: 13),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextLanCommon(
                      "FILTER BY TEAM",
                      style: TextStyle(
                        color: AppColors.darkgreybluetwo,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'sans-serif',
                      ),
                    ),
                    //  ),
                    IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: Icon(
                          Icons.keyboard_arrow_down_sharp,
                          size: 25,
                          color: AppColors.darkgreybluetwo,
                        )),
                    //),
                  ],
                ),
              ),
              SizedBox(
                height: 0,
              ),
              ListView.builder(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemCount: matchController.listData.length,
                  itemBuilder: ((context, index) {
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 20.0,
                              bottom: 20.0,
                              left: DesignConstants.card_spacing,
                              right: DesignConstants.card_spacing),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              //icon
                              Row(
                                children: [
                                  Icon(
                                    Icons.circle,
                                    size: 5,
                                    color: matchController.listData.value[index].isSelected!
                                        ? AppColors.darkseafoamgreen
                                        : AppColors.darkgreybluetwo,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  TextLanCommon(
                                    matchController.listData.value[index].name!,
                                    style: matchController.listData.value[index].isSelected!
                                        ? const TextStyle(
                                        color: AppColors.darkseafoamgreen,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: "Roboto-SemiBold",
                                        fontStyle: FontStyle.normal,
                                        fontSize: 11.5)
                                        : const TextStyle(
                                        color: AppColors.darkgreybluetwo,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: "Roboto-Medium",
                                        fontStyle: FontStyle.normal,
                                        fontSize: 10.0),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 20,
                                    height: 20,
                                    child: GFCheckbox(
                                      activeIcon: const Icon(
                                        Icons.check,
                                        color: Colors.white,
                                        size: 15,
                                      ),
                                      type: GFCheckboxType.circle,
                                      size: 20,
                                      activeBgColor: AppColors.darkmint,
                                      activeBorderColor:
                                      AppColors.darkseafoamgreen,
                                      inactiveBorderColor: AppColors.bluegreyq,
                                      onChanged: (value) {
                                        if (index == 0 &&
                                            !matchController.listData.value[index].isSelected!) {
                                          matchController.listData.value.forEach((element) {
                                            element.isSelected = true;
                                          });
                                          matchController.teamIdFilter = "";
                                        } else if (index == 0 &&
                                            matchController.listData.value[index].isSelected!) {
                                          matchController.listData.value.forEach((element) {
                                            element.isSelected = false;
                                          });
                                          matchController.teamIdFilter = "";
                                        } else {
                                          matchController.listData.value[index].isSelected =
                                          !matchController.listData.value[index].isSelected!;
                                          if (matchController.listData
                                              .value[index].isSelected!) {
                                            matchController.teamIdFilter =
                                                matchController.listData.value[index].Id;
                                          } else {
                                            matchController.listData.value[0].isSelected =
                                            false;
                                          }
                                        }

                                        if (matchController.listData.value[1].isSelected! &&
                                            matchController.listData.value[2].isSelected!) {
                                          matchController.listData.value[0].isSelected = true;
                                          matchController.teamIdFilter = "";
                                        }

                                        if (matchController.teamIdFilter!.isEmpty &&
                                            !matchController.listData.value[0].isSelected!) {
                                          matchController.listData.value.forEach((element) {
                                            if (element.isSelected!) {
                                              matchController.teamIdFilter = element.Id;
                                            }
                                          });
                                        }

                                        matchController.listData.refresh();
                                        matchController.playersList.refresh();
                                      },
                                      value: matchController.listData.value[index].isSelected!,
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        getFadedLine()
                      ],
                    );
                  }))
            ]),
          ),
        ],
      ),
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25),
        ),
      ),
    );
  }
}
