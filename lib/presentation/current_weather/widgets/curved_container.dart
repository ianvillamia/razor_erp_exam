import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:razor_erp_exam/core/extensions/num_extensions.dart';
import 'package:razor_erp_exam/presentation/current_weather/bloc/current_weather_bloc.dart';
import 'package:razor_erp_exam/presentation/current_weather/widgets/weather_icon.dart';

class CurvedContainer extends StatelessWidget {
  const CurvedContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CurrentWeatherBloc, CurrentWeatherState>(
      builder: (context, state) {
        return ClipPath(
          clipper: CustomTopCurveClipper(),
          child: Container(
            height: 200,
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(height: 10),
                  FadeInUp(
                    child: const Text(
                      'Weather Today',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  _buildRows(state),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

Widget _buildRows(CurrentWeatherState state) {
  if (state is LoadedWeatherState) {
    final firstFive = state.weatherEntity.list.toList().sublist(0, 5);
    return FadeIn(
      duration: const Duration(seconds: 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: firstFive.map((data) {
          return WeatherIcon(
            time: data.dt.dtToHHMMa(),
            temp: data.main.temp.convertKelvinToCelsius(),
            icon: Icons
                .wb_sunny, // Replace with actual logic to get the correct icon
          );
        }).toList(),
      ),
    );
  }
  return const SizedBox();
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
