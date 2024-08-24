import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:razor_erp_exam/gen/assets.gen.dart';
import 'package:razor_erp_exam/presentation/current_weather/bloc/current_weather_bloc.dart';
import 'package:razor_erp_exam/presentation/current_weather/widgets/weather_icon.dart';
import 'package:razor_erp_exam/presentation/shared/gradient_text.dart';

// Helper function to convert Kelvin to Celsius
String convertKelvinToCelsius(double kelvin) {
  return '${(kelvin - 273.15).toStringAsFixed(1)}°';
}

class CurrentWeatherPage extends StatefulWidget {
  const CurrentWeatherPage({super.key});

  @override
  State<CurrentWeatherPage> createState() => _CurrentWeatherPageState();
}

class _CurrentWeatherPageState extends State<CurrentWeatherPage> {
  late CurrentWeatherBloc bloc;
  @override
  void initState() {
    super.initState();
    bloc = BlocProvider.of<CurrentWeatherBloc>(context);
    bloc.add(const GetWeatherDataEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CurrentWeatherBloc, CurrentWeatherState>(
      listener: (context, state) {},
      builder: (context, state) {
        return SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                        Assets.png.sunny.path), // Use AssetImage here
                    fit: BoxFit
                        .cover, // Optional: fit the image within the container
                  ),
                ),
              ),
              const Align(
                alignment: Alignment.bottomCenter,
                child: CurvedContainer(),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, top: 60),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        '📍Tuscany',
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                        ),
                      ),
                      GradientText(
                        text: convertKelvinToCelsius(295.69),
                        textStyle: const TextStyle(fontSize: 80),
                      ),
                    ],
                  ),
                ),
              ),
              const Align(
                alignment: Alignment.centerRight,
                child: RotationTransition(
                  turns: AlwaysStoppedAnimation(270 / 360),
                  child: Text(
                    'Its Sunny',
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}

class CurvedContainer extends StatelessWidget {
  const CurvedContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: CustomTopCurveClipper(),
      child: Container(
        height: 200,
        color: Colors.white,
        child: const Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(height: 10),
              Text(
                'Weather Today',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  WeatherIcon(
                    time: '05:00 AM',
                    temp: '23°',
                    icon: Icons.wb_sunny,
                  ),
                  WeatherIcon(
                    time: '06:00 AM',
                    temp: '16°',
                    icon: Icons.cloud,
                  ),
                  WeatherIcon(
                    time: '07:00 AM',
                    temp: '3°',
                    icon: Icons.grain,
                  ),
                  WeatherIcon(
                    time: '08:00 AM',
                    temp: '23°',
                    icon: Icons.wb_sunny,
                  ),
                ],
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
