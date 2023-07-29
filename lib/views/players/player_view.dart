import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sports_assign/model/match_model.dart';

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

    Player player = matchController.playersList.elementAt(index!);

    return Padding(
      padding: const EdgeInsets.all(8.0),
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
              SizedBox(
                width: 50,
                height: 50,
                child: Image.asset('Assets/images/player_placeholder.webp'),
              ),

              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                        SizedBox(width: 15,),
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
    );
  }
}
