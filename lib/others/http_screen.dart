//
// import 'dart:convert';
// import 'package:http/http.dart' as http;
//
// void main() {
//   void getData() async {
//     http.Response response = await http.get(Uri.parse(
//         'https://samples.openweathermap.org/data/2.5/forecast?q=London,us&appid=b6907d289e10d714a6e88b30761fae22'));
//     print(response);
//     if (response.statusCode == 200) {
//       String data = response.body;
//       print(data);
//       var weather= jsonDecode(data)['list'][0]['weather'][0]['description'];
//       print(weather);
//       var latitude = jsonDecode(data)['city']['coord']['lat'];
//       print('Latitude: $latitude');
//       var longitude = jsonDecode(data)['city']['coord']['lon'];
//       print('Longitude: $longitude');
//     } else {
//       print(response.statusCode);
//     }
//   }
//   getData();
// }
//
