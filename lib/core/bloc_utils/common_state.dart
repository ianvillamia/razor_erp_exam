import 'package:equatable/equatable.dart';
import 'package:razor_erp_exam/domain/usecases/base_usecase.dart';
import 'package:razor_erp_exam/presentation/current_weather/bloc/current_weather_bloc.dart';

/// Base common state class
abstract class CommonState extends Equatable implements CurrentWeatherState {
  const CommonState();

  @override
  List<Object> get props => [];
}

/// Common Initial state for all Blocs
class InitialState extends CommonState {
  const InitialState();
}

/// Common Loading state for all Blocs
class LoadingState extends CommonState {
  const LoadingState();
}

class RetryState extends CommonState {
  const RetryState();
}

/// Common Error state for all Blocs
class ErrorState extends CommonState {
  const ErrorState(this.error);

  final ApiException error;

  @override
  List<Object> get props => [error];
}

/// Common No internet connection state for all Blocs
class NoInternetConnectionState extends CommonState {
  const NoInternetConnectionState();
}
