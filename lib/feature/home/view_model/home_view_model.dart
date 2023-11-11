import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'event/home_event.dart';
part 'state/home_state.dart';


class HomeViewModel extends Bloc<HomeEvent, HomeState> {
  HomeViewModel() : super(HomeInitial()) {
    on<HomeEvent>((event, emit) {
    });
  }
}
