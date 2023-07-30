import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sports_assign/model/match_model.dart';
import 'package:sports_assign/views/players/player_info_dialog.dart';

import '../../color_constants.dart';
import '../../controller/match_controller.dart';
import '../../utils/design_constants.dart';
import '../../utils/text_lan_common.dart';

class PlayerView extends StatelessWidget {

  MatchController matchController = Get.put(MatchController());

  int? index;

  PlayerView({Key? key,this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Player player = matchController.playersList
        .where((i) => (
        (matchController.teamIdFilter!.isNotEmpty
            ? i.teamId == matchController.teamIdFilter : true)))
        .toList().elementAt(index!);

    return WillPopScope(
        onWillPop: () async {
          matchController.teamIdFilter = "";
          return true;
        },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          child: Container(
            decoration: BoxDecoration(
                color: const Color(0xfff8f8f9),
                borderRadius: BorderRadius.circular(10),
                boxShadow: DesignConstants.getCardShadow()),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      SizedBox(
                        width: 50,
                        height: 50,
                        child: Image.asset('Assets/images/player_placeholder.webp'),
                      ),

                      player.iscaptain != null && player.iscaptain! ?
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          width: 20,
                          height: 20,
                          decoration: const BoxDecoration(boxShadow: [
                            BoxShadow(
                                color: Color(0xffa1ff00),
                                offset: Offset(0, 0),
                                blurRadius: 20.5,
                                spreadRadius: 0)
                          ]),
                          child: Image.asset("Assets/images/captain_img.webp"),
                        ),
                      ) : Container(),
                    ],
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            TextLanCommon(
                              player.nameFull!,
                              style: const TextStyle(
                                  color: AppColors
                                      .charcoalgrey,
                                  fontWeight:
                                  FontWeight.w700,
                                  fontStyle:
                                  FontStyle.normal,
                                  fontSize: 13.0),
                            ),

                            Visibility(
                              visible: player.iskeeper != null && player.iskeeper! ? true : false,
                              child: Row(
                                children: [
                                  const SizedBox(width: 5,),
                                  TextLanCommon(
                                    "(Wicket Keeper)",
                                    style: const TextStyle(
                                        color: AppColors
                                            .charcoalgrey,
                                        fontWeight:
                                        FontWeight.w800,
                                        fontStyle:
                                        FontStyle.normal,
                                        fontSize: 13.0),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),


                        Row(
                          children: [
                            TextLanCommon(
                              "BAT:${player.batting!.style!}",
                              style: const TextStyle(
                                  color: AppColors
                                      .charcoalgrey,
                                  fontWeight:
                                  FontWeight.w400,
                                  fontStyle:
                                  FontStyle.normal,
                                  fontSize: 11.0),
                            ),
                            const SizedBox(width: 15,),
                            TextLanCommon(
                            "BOWL:${player.bowling!.style!}",
                              style: const TextStyle(
                                  color: AppColors
                                      .charcoalgrey,
                                  fontWeight:
                                  FontWeight.w400,
                                  fontStyle:
                                  FontStyle.normal,
                                  fontSize: 11.0),
                            ),
                          ],
                        )
                      ],
                    ),
                  )

                ],
              ),
            ),
          ),
          onTap: (){
            PlayerInfoDialog(player,matchController);
          },
        ),
      ),
    );
  }
}
