

import 'package:flutter/cupertino.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:get/get.dart';
import 'package:sports_assign/model/match_model.dart';
import 'package:sports_assign/services/remote_services_matches.dart';

import '../utils/utility.dart';

class MatchController extends GetxController{

  Rx<MatchModel> matchModel = MatchModel().obs;

  RxList<Player> playersList = List<Player>.empty(growable: true).obs;

  var isLoading = true.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  Future<MatchModel> getMatchDetails(BuildContext context) async {
    try {
      isLoading(true);
      showLoader(context);
      var matchData = await RemoteServicesMatches.getMatchDetails();
      if (matchData != null) {
        // print('otp api called');
        Loader.hide();
        matchModel.value = matchData;
        // constants.userId = otpModel.value.userId;
        print(matchModel.value);

        playersList.clear();
        playersList.addAll(getPlayers());
      }
    } finally {
      // Loader.hide();
      isLoading(false);
    }

    return matchModel.value;
    // return null;
  }


  List<Player> getPlayers(){
    // Given map representing Teams data
    Map<String, Team> teamsData = matchModel.value.teams!;

    // Convert map to a list of Player objects
    List<Player> allPlayers = [];
    teamsData.forEach((teamId, teamData) {
      Map<String, Player> playersMap = teamData.players!;
      playersMap.forEach((playerId, playerData) {
        Player player = Player(nameFull: playerData.nameFull,iscaptain: playerData.iscaptain,iskeeper: playerData.iskeeper,position: playerData.position
        ,batting: playerData.batting,bowling: playerData.bowling);
        allPlayers.add(player);
      });
    });

    // Print the list of players (for testing)
    allPlayers.forEach((player) {
      print('Name: ${player.nameFull}');
      print('Position: ${player.position}');
      print('Is Captain: ${player.iscaptain}');
      print('Is Keeper: ${player.iskeeper}');
      print('Batting Style: ${player.batting!.style}');
      print('Bowling Style: ${player.bowling!.style}');
      print('---');
    });


    return allPlayers;

  }

}