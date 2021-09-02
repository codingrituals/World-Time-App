import 'package:http/http.dart';
import 'dart:convert';

class WorldTime {
  String location; //loaction name for the UI
  late String time; //time in that location
  String flag; //url to an asset icon
  String url; //location url for API end point

  WorldTime({required this.location, required this.flag, required this.url});

  Future<void> getTime() async {
    Response response =
        await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
    Map data = jsonDecode(response.body);
    String dateTime = data['datetime'];
    String offsetHours = data['utc_offset'].substring(1, 3);
    String offsetMinutes = data['utc_offset'].substring(4, 6);

    DateTime now = DateTime.parse(dateTime);
    now = now.add(Duration(
        hours: int.parse(offsetHours), minutes: int.parse(offsetMinutes)));

    //setting the time property
    time = now.toString();
  }
}
