

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sports_assign/model/match_model.dart';
import 'package:sports_assign/services/api_list.dart';
import 'package:sports_assign/services/remote_services_matches.dart';

import '../model/checkbox_select_model.dart';
import '../utils/utility.dart';

class MatchController extends GetxController{

  Rx<MatchModel> matchModel = MatchModel().obs;

  RxList<Player> playersList = List<Player>.empty(growable: true).obs;

  RxList<CheckBoxSelectModel> listData = List<CheckBoxSelectModel>.empty(growable: true).obs;
  

  var isLoading = true.obs;

  late String team1Id,team2Id;
  String? teamIdFilter="";

  late String team1Name,team2Name;
  late String matchDate,matchTime;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  Future<MatchModel> getMatchDetails(BuildContext context) async {
    try {
      isLoading(true);
      showLoader(context);
      var matchData = await RemoteServicesMatches.getMatchDetails(Api.baseUrlInNz);
      if (matchData != null) {
        // print('otp api called');
        Loader.hide();
        matchModel.value = matchData;
        intItData();
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

  void intItData(){
    team1Name = matchModel.value.teams![matchModel.value.matchdetail!.teamAway!]!.nameShort!;
    team2Name = matchModel.value.teams![matchModel.value.matchdetail!.teamHome!]!.nameShort!;
    DateTime tempDate = DateFormat("dd/MM/yyyy").parse(matchModel.value.matchdetail!.match!.date!);

    matchDate = DateFormat.yMMMMEEEEd().format(tempDate);

    DateTime time = DateFormat("HH:mm").parse(matchModel.value.matchdetail!.match!.time!);

    // Format the DateTime object to the desired time format
    matchTime = DateFormat("h:mm a").format(time);
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
        ,batting: playerData.batting,bowling: playerData.bowling,teamId: teamId,teamShortName: teamData.nameShort);
        allPlayers.add(player);
      });

      if(matchModel.value.matchdetail!.teamAway! == teamId){
          team1Id = teamId;
      }else{
          team2Id = teamId;
      }
    });

 /*   // Print the list of players (for testing)
    allPlayers.forEach((player) {
      print('Name: ${player.nameFull}');
      print('Position: ${player.position}');
      print('Is Captain: ${player.iscaptain}');
      print('Is Keeper: ${player.iskeeper}');
      print('Batting Style: ${player.batting!.style}');
      print('Bowling Style: ${player.bowling!.style}');
      print('Team id: ${player.teamId}');
      print('---');
    });*/


    return allPlayers;

  }

  void addListCheckBox(){
    String team1ShortName = matchModel.value.teams![matchModel.value.matchdetail!.teamAway!]!.nameShort!;
    String team2ShortName = matchModel.value.teams![matchModel.value.matchdetail!.teamHome!]!.nameShort!;

    listData.clear();
    listData.add(CheckBoxSelectModel("All", true, ""));
    listData.add(CheckBoxSelectModel(team1ShortName, true,matchModel.value.matchdetail!.teamAway!));
    listData.add(CheckBoxSelectModel(team2ShortName, true,matchModel.value.matchdetail!.teamHome!));
  }

}