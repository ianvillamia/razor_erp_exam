// Helper function to convert Kelvin to Celsius
import 'package:intl/intl.dart';

extension OnDouble on double {
  String convertKelvinToCelsius() => '${(this - 273.15).toStringAsFixed(1)}°';
}

extension OnInt on int {
  String dtToHHMMa() {
    // Convert Unix timestamp to DateTime
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(this * 1000);

    String formattedTime = DateFormat('hh:mm a').format(dateTime);
    return formattedTime;
  }
}
