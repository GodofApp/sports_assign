

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sports_assign/controller/match_controller.dart';

import '../../color_constants.dart';
import 'league_match_card.dart';

class LeaguePage extends StatelessWidget {

  MatchController matchController = Get.put(MatchController());

  LeaguePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    WidgetsBinding.instance.addPostFrameCallback((_) {
      matchController.getMatchDetails(context);
    });


    return Scaffold(
        backgroundColor: AppColors.dark_blue_grey_three,
        appBar: AppBar(
          backgroundColor: AppColors.black,
          title: const Text("Matches",style: TextStyle(color: Colors.white)),
        ),
        body: SafeArea(
          child: Obx(() => Container(
            margin: EdgeInsets.only(top: 15),
            child: matchController.isLoading.value ?
            Container():
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: ListView.builder(
                    // physics: const NeverScrollableScrollPhysics(),
                    physics: const AlwaysScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 1,
                    itemBuilder: (BuildContext context, int index) {
                      return LeagueMatchCard();
                    },
                  ),
                ),
              ],
            ),
          )),
        )
    );
  }
}
