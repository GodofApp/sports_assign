
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:sports_assign/model/match_model.dart';
import 'package:sports_assign/services/api_list.dart';

import '../utils/utility.dart';

class RemoteServicesMatches{

  static var client = http.Client();


  static Future<MatchModel?> getMatchDetails() async {
    // final headers = getLoginHeaders();

    try {

      var response = await client.get(Uri.parse(Api.baseUrl));

      if (response.statusCode == 200) {
        var jsonString = response.body;
        return MatchModel.fromJson(json.decode(jsonString));
      } else {
        // ErrorCodeHandler(response);
        return null;
      }
    } on SocketException {
      // Loader.hide();

      showRedSnackbar("Some error occured");
    }on Error catch (e) {
      // Loader.hide();
      showRedSnackbar("Some error occured");
    }

  }


}