

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../color_constants.dart';
import '../../controller/match_controller.dart';
import '../../model/match_model.dart';
import '../../utils/design_constants.dart';
import '../../utils/text_lan_common.dart';

class PlayerInfoDialog{

  Player player;
  MatchController matchController;

  PlayerInfoDialog(this.player,this.matchController){
    Get.dialog(
      WillPopScope(
          onWillPop: () async => true,
          child: Dialog(
            insetPadding: const EdgeInsets.fromLTRB(
                DesignConstants.margin,
                DesignConstants.bottomSheetTopBottomSpacing,
                DesignConstants.margin,
                DesignConstants.bottomSheetTopBottomSpacing),
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                    Radius.circular(DesignConstants.card_radius_small))),
            child: Container(
              constraints: const BoxConstraints(
                maxHeight: double.infinity,
              ),
              child: Wrap(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 15,bottom: 15),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 13.0),
                                child: TextLanCommon("Player Info",
                                    style: const TextStyle(
                                        color: AppColors.darkgreybluetwo,
                                        fontWeight: FontWeight.w700,
                                        fontFamily: "Roboto",
                                        fontStyle: FontStyle.normal,
                                        fontSize: 15.0),
                                    textAlign: TextAlign.left),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  right: 24),
                              child: InkWell(
                                child: Container(
                                  width: 20,
                                  height: 20,
                                  child: const Icon(
                                    Icons.close,
                                    size: 20,
                                  ),
                                ),
                                onTap: () {
                                  Get.back();
                                },
                              ),
                            )
                          ],
                        ),

                        SizedBox(height: 30,),
                        Padding(
                          padding: const EdgeInsets.only(left: 13,right: 13),
                          child: Row(
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
                                      mainAxisSize: MainAxisSize.max,
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
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 15.0),
                                              child: Container(
                                                width: 11,
                                                height: 11,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                    BorderRadius.all(
                                                        Radius.circular(4)),
                                                    border: Border.all(
                                                        color: Colors.white,
                                                        width: 0.5),
                                                    color: AppColors.azure),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 8.0),
                                              child: TextLanCommon(
                                                  player.teamShortName!,
                                                  style: const TextStyle(
                                                      color:
                                                      AppColors.charcoalgrey,
                                                      fontWeight: FontWeight.w500,
                                                      fontFamily: "Roboto",
                                                      fontStyle: FontStyle.normal,
                                                      fontSize: 9),
                                                  textAlign: TextAlign.center),
                                            ),
                                          ],
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
                              ),
                            ],
                          ),
                        ),

                        SizedBox(height: 15,),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 40, right: 40.0),
                          child: Container(
                            height: 1,
                            decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Colors.white,
                                    AppColors.bluegrey,
                                    Colors.white,
                                  ],
                                )),
                            child: const Divider(
                              color: Colors.transparent,
                              height: 0,
                              indent: 20,
                              endIndent: 20,
                              thickness: 0.2,
                            ),
                          ),
                        ),

                        SizedBox(height: 15,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            TextLanCommon(
                              "Batting",
                              style: const TextStyle(
                                  color: AppColors
                                      .charcoalgrey,
                                  fontWeight:
                                  FontWeight.w800,
                                  fontStyle:
                                  FontStyle.normal,
                                  fontSize: 13.0),
                            ),
                            TextLanCommon(
                              "Bowling",
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

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                TextLanCommon(
                                  "Style:${player.batting!.style}",
                                  style: const TextStyle(
                                      color: AppColors
                                          .charcoalgrey,
                                      fontWeight:
                                      FontWeight.w800,
                                      fontStyle:
                                      FontStyle.normal,
                                      fontSize: 13.0),
                                ),
                                TextLanCommon(
                                  "Average:${player.batting!.average}",
                                  style: const TextStyle(
                                      color: AppColors
                                          .charcoalgrey,
                                      fontWeight:
                                      FontWeight.w800,
                                      fontStyle:
                                      FontStyle.normal,
                                      fontSize: 13.0),
                                ),
                                TextLanCommon(
                                  "Strikerate:${player.batting!.strikerate}",
                                  style: const TextStyle(
                                      color: AppColors
                                          .charcoalgrey,
                                      fontWeight:
                                      FontWeight.w800,
                                      fontStyle:
                                      FontStyle.normal,
                                      fontSize: 13.0),
                                ),
                                TextLanCommon(
                                  "Runs:${player.batting!.runs}",
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

                            //bowling
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                TextLanCommon(
                                  "Style:${player.bowling!.style}",
                                  style: const TextStyle(
                                      color: AppColors
                                          .charcoalgrey,
                                      fontWeight:
                                      FontWeight.w800,
                                      fontStyle:
                                      FontStyle.normal,
                                      fontSize: 13.0),
                                ),
                                TextLanCommon(
                                  "Average:${player.bowling!.average}",
                                  style: const TextStyle(
                                      color: AppColors
                                          .charcoalgrey,
                                      fontWeight:
                                      FontWeight.w800,
                                      fontStyle:
                                      FontStyle.normal,
                                      fontSize: 13.0),
                                ),
                                TextLanCommon(
                                  "Economyrate:${player.bowling!.economyrate}",
                                  style: const TextStyle(
                                      color: AppColors
                                          .charcoalgrey,
                                      fontWeight:
                                      FontWeight.w800,
                                      fontStyle:
                                      FontStyle.normal,
                                      fontSize: 13.0),
                                ),
                                TextLanCommon(
                                  "Wickets:${player.bowling!.wickets}",
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
                          ],
                        )

                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
      )
    );
  }


}