import 'package:flutter_bloc/flutter_bloc.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {

  HomeBloc() : super(HomeState()) {
    on<HomeFetchEvent>(_onFetchData);
  }

  _onFetchData(HomeFetchEvent event, Emitter<HomeState> emit) async {
    emit(HomeState());
  }
}