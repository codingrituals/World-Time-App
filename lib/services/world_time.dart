import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String location; //loaction name for the UI
  late String time; //time in that location
  String flag; //url to an asset icon
  String url; //location url for API end point
  late bool isDaytime;

  WorldTime({
    required this.location,
    required this.flag,
    required this.url,
    // required this.time,
  });

  Future<void> getTime() async {
    try {
      Response response =
          await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
      Map data = jsonDecode(response.body);
      String dateTime = data['datetime'];
      String offsetHours = data['utc_offset'].substring(1, 3);
      String offsetMinutes = data['utc_offset'].substring(4, 6);

      DateTime now = DateTime.parse(dateTime);
      now = now.add(Duration(
          hours: int.parse(offsetHours), minutes: int.parse(offsetMinutes)));

      isDaytime = now.hour > 6 && now.hour < 20 ? true : false;
      //setting the time property
      time = DateFormat().add_jm().format(now);
    } catch (e) {
      print('error caught $e');
      time = 'could not get time data';
    }
  }
}
