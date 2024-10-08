import 'package:animate_do/animate_do.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:razor_erp_exam/core/extensions/num_extensions.dart';
import 'package:razor_erp_exam/core/keys/keys.dart';
import 'package:razor_erp_exam/gen/assets.gen.dart';
import 'package:razor_erp_exam/presentation/current_weather/bloc/current_weather_bloc.dart';
import 'package:razor_erp_exam/presentation/current_weather/widgets/curved_container.dart';
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
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CurrentWeatherBloc, CurrentWeatherState>(
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
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const Align(
                alignment: Alignment.bottomCenter,
                child: CurvedContainer(key: Keys.curvedContainer),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, top: 70),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (state is LoadedWeatherState)
                        FadeIn(
                          duration: const Duration(seconds: 2),
                          child: Text(
                            key: Keys.cityText,
                            state.weatherEntity.city.name,
                            style: const TextStyle(
                              fontSize: 30,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      if (state is LoadedWeatherState)
                        FadeIn(
                          duration: const Duration(seconds: 2),
                          child: GradientText(
                            key: Keys.gradientText,
                            text: state.weatherEntity.list.first.main.temp
                                .convertKelvinToCelsius(),
                            textStyle: const TextStyle(fontSize: 80),
                          ),
                        )
                    ],
                  ),
                ),
              ),
              if (state is LoadedWeatherState)
                Align(
                  alignment: Alignment.centerRight,
                  child: RotationTransition(
                    turns: const AlwaysStoppedAnimation(270 / 360),
                    child: Text(
                      key: Keys.sunnyText,
                      state.weatherEntity.list.first.weather.first.description,
                      style: const TextStyle(
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
