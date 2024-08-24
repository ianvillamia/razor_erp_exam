import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:razor_erp_exam/core/extensions/num_extensions.dart';
import 'package:razor_erp_exam/data/mappers/weather_model.dart';
import 'package:razor_erp_exam/presentation/current_weather/widgets/weather_icon.dart';

class CurvedContainer extends StatelessWidget {
  const CurvedContainer({
    super.key,
    required this.weatherData,
  });
  final BuiltList<WeatherData> weatherData;

  @override
  Widget build(BuildContext context) {
    final firstFour = weatherData.toList().sublist(0, 4);
    return ClipPath(
      clipper: CustomTopCurveClipper(),
      child: Container(
        height: 200,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(height: 10),
              const Text(
                'Weather Today',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: firstFour.map((data) {
                  return WeatherIcon(
                    time: data.dt.dtToHHMMa(),
                    temp: data.main.temp.convertKelvinToCelsius(),
                    icon: Icons
                        .wb_sunny, // Replace with actual logic to get the correct icon
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomTopCurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, 40); // Start from the top left

    var firstControlPoint = Offset(size.width / 2, 0);
    var firstEndPoint = Offset(size.width, 40);
    path.quadraticBezierTo(
      firstControlPoint.dx,
      firstControlPoint.dy,
      firstEndPoint.dx,
      firstEndPoint.dy,
    );

    path.lineTo(size.width, size.height); // Continue to the bottom right
    path.lineTo(0, size.height); // Continue to the bottom left
    path.close(); // Close the path

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
