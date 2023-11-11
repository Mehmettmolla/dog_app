import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'event/home_event.dart';
part 'state/home_state.dart';


class HomeViewModel extends Bloc<HomeEvent, HomeState> {
  HomeViewModel() : super(HomeInitial()) {
    on<HomeEvent>((event, emit) {
    });
  }
}
