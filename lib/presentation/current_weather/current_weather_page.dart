import 'package:animate_do/animate_do.dart';
import 'package:built_collection/built_collection.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:razor_erp_exam/core/extensions/num_extensions.dart';
import 'package:razor_erp_exam/data/mappers/weather_model.dart';
import 'package:razor_erp_exam/gen/assets.gen.dart';
import 'package:razor_erp_exam/presentation/current_weather/bloc/current_weather_bloc.dart';
import 'package:razor_erp_exam/presentation/current_weather/widgets/weather_icon.dart';
import 'package:razor_erp_exam/presentation/shared/gradient_text.dart';

class CurrentWeatherPage extends StatefulWidget {
  const CurrentWeatherPage({super.key});

  @override
  State<CurrentWeatherPage> createState() => _CurrentWeatherPageState();
}

class _CurrentWeatherPageState extends State<CurrentWeatherPage> {
  late CurrentWeatherBloc bloc;
  late bool _isConnected;
  @override
  void initState() {
    super.initState();
    bloc = BlocProvider.of<CurrentWeatherBloc>(context);
    _checkConnectivity();
  }

  Future<void> _checkConnectivity() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    setState(() {
      _isConnected = !connectivityResult.contains(ConnectivityResult.none);
    });
    if (_isConnected) {
      bloc.add(const GetWeatherDataEvent());
    } else {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CurrentWeatherBloc, CurrentWeatherState>(
      builder: (context, state) {
        if (state is LoadedWeatherState) {
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
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: CurvedContainer(
                    weatherData: state.weatherEntity.list,
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, top: 60),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FadeIn(
                          duration: const Duration(seconds: 2),
                          child: Text(
                            state.weatherEntity.city.name,
                            style: const TextStyle(
                              fontSize: 30,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        FadeIn(
                          duration: const Duration(seconds: 2),
                          child: GradientText(
                            text: 295.69.convertKelvinToCelsius(),
                            textStyle: const TextStyle(fontSize: 80),
                          ),
                        )
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
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}

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
