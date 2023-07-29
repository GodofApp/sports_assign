import 'package:get/get.dart';
import 'package:sports_assign/views/leagePage/league_page.dart';


class Routes{
  static final routes = [
    GetPage(name: '/homeScreen', page: () => LeaguePage()),
  ];
}