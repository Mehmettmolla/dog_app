import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'event/splash_event.dart';
part 'state/splash_state.dart';

class SplashViewModel extends Bloc<SplashEvent, SplashState> {
  SplashViewModel() : super(SplashInitial()) {
    on<SplashEvent>((event, emit) {
    });
  }
}
