

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sports_assign/views/players/player_view.dart';

import '../../color_constants.dart';
import '../../controller/match_controller.dart';

class PlayerScreen extends StatelessWidget {

  MatchController matchController = Get.find();

  PlayerScreen({Key? key}) : super(key: key);

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
            Expanded(
              child: ListView.builder(
                // physics: const NeverScrollableScrollPhysics(),
                physics: const AlwaysScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: matchController.playersList.length,
                itemBuilder: (BuildContext context, int index) {
                  return PlayerView(index: index,);
                },
              ),
            ),
          ],
        )
    );
  }
}
