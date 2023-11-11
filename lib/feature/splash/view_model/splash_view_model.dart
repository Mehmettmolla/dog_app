import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'event/splash_event.dart';
part 'state/splash_state.dart';

class SplashViewModel extends Bloc<SplashEvent, SplashState> {
  SplashViewModel() : super(SplashInitial()) {
    on<SplashEvent>((event, emit) {
    });
  }
}
