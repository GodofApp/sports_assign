import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sports_assign/views/players/player_screen.dart';

import '../../color_constants.dart';
import '../../controller/match_controller.dart';
import '../../utils/design_constants.dart';
import '../../utils/text_lan_common.dart';

class LeagueMatchCard extends StatelessWidget {

  MatchController matchController = Get.find();

  LeagueMatchCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {



    return InkWell(
      onTap: () async {
        Get.to(PlayerScreen());
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          height: 180,
          width: Get.width,
          child: Container(
            width: Get.width - 26,
            height: 170,
            decoration: BoxDecoration(
                color: const Color(0xfff8f8f9),
                borderRadius: BorderRadius.circular(16),
                boxShadow: DesignConstants.getCardShadow()),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Container(
                decoration:const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15.0),
                    topRight: Radius.circular(15.0),
                  ),
                  image: DecorationImage(
                      image: AssetImage(
                          "Assets/images/pot_bg.webp"),
                      fit: BoxFit.fill,
                      ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: DesignConstants.card_padding, right: DesignConstants.card_padding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextLanCommon(matchController.matchModel.value.matchdetail!.series!.name!,
                                  style: const TextStyle(
                                      color: AppColors.dark_blue_grey,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: "Roboto",
                                      fontStyle: FontStyle.normal,
                                      fontSize: 10.0)),
                              TextLanCommon(
                                  matchController.matchModel.value.matchdetail!.venue!.name!,
                                  style: const TextStyle(
                                      color: AppColors.charcoalgrey,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: "Roboto",
                                      fontStyle: FontStyle.normal,
                                      fontSize: 10.0)),
                            ],
                          ),

                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              TextLanCommon(matchController.matchModel.value.matchdetail!.status!,
                                  style: const TextStyle(
                                      color: AppColors.lipstick,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: "Roboto",
                                      fontStyle: FontStyle.normal,
                                      fontSize: 10.0)),
                              TextLanCommon(matchController.matchModel.value.matchdetail!.match!.number!,
                                  style: const TextStyle(
                                      color: AppColors.dark_blue_grey_three,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: "Roboto",
                                      fontStyle: FontStyle.normal,
                                      fontSize: 10.0)),
                            ],
                          ),
                        ],
                      ),

                      const SizedBox(height: 15,),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const SizedBox(
                            height: 45,
                            width: 45,
                            child: Image(image:
                            AssetImage('Assets/images/PlaceholderTeam1.webp')
                            ),
                          ),

                          Column(
                            children: [
                              Container(
                                  alignment: Alignment.center,
                                  height: 20,
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 10),
                                  decoration: BoxDecoration(
                                    color: null,
                                    borderRadius:
                                    BorderRadius.circular(16),
                                  ),
                                  // width: 100,
                                  child: TextLanCommon(
                                    matchController.matchDate,
                                    style: const TextStyle(
                                        color:
                                        AppColors.dark_blue_grey_three,
                                        fontWeight:
                                        FontWeight
                                            .w700,
                                        fontFamily:
                                        "Roboto",
                                        fontStyle:
                                        FontStyle
                                            .normal,
                                        fontSize:
                                        10.0),
                                  )),
                              Container(
                                  alignment: Alignment.center,
                                  height: 20,
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 10),
                                  decoration: BoxDecoration(
                                    color: null,
                                    borderRadius:
                                    BorderRadius.circular(16),
                                  ),
                                  // width: 100,
                                  child: TextLanCommon(
                                    "Time :${matchController.matchTime}",
                                    style: const TextStyle(
                                        color:
                                        AppColors.dark_blue_grey_three,
                                        fontWeight:
                                        FontWeight
                                            .w700,
                                        fontFamily:
                                        "Roboto",
                                        fontStyle:
                                        FontStyle
                                            .normal,
                                        fontSize:
                                        10.0),
                                  )),
                            ],
                          ),


                          const SizedBox(
                            height: 45,
                            width: 45,
                            child: Image(image:
                            AssetImage('Assets/images/PlaceholderTeam1.webp')
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 15,),

                      Container(
                          width: Get.width,
                          height: 0.5,
                          decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment(-1.1,
                                      -0.000008736627933103591),
                                  end: Alignment(1.1,
                                      0.000008736627933103591),
                                  colors: [
                                    AppColors.whiteTwo,
                                    AppColors.bluegrey,
                                    AppColors.bluegrey,
                                    AppColors.bluegrey,
                                    AppColors.whiteTwo
                                  ]))),

                      const SizedBox(height: 10,),

                      Padding(
                        padding: const EdgeInsets.only(left: 10,right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextLanCommon(
                              matchController.team1Name,
                              // 'Royal-Challengers-Bangalore-Women',
                              style: const TextStyle(
                                  color: AppColors.darkThree,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 13),
                            ),


                            TextLanCommon('VS',
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontFamily: 'Roboto',
                                  color: AppColors.dark_blue_grey_three,
                                  fontSize: 11,
                                  fontWeight: FontWeight.w800,
                                  fontStyle: FontStyle.normal,
                                )),

                            TextLanCommon(
                              matchController.team2Name,
                              textAlign: TextAlign.end,
                              // overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  color: AppColors.darkThree,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 13),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 10,),

                      Center(
                        child: TextLanCommon(
                          matchController.matchModel.value.matchdetail!.result!,
                          style: const TextStyle(
                              color: AppColors.lipstick,
                              fontWeight:
                              FontWeight
                                  .w700,
                              fontFamily:
                              "Roboto",
                              fontStyle:
                              FontStyle
                                  .normal,
                              fontSize:
                              10.0),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
