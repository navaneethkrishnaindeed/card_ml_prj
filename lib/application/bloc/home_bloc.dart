import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_event.dart';
part 'home_state.dart';
part 'home_bloc.freezed.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(_Initial()) {
    on<HomeEvent>((event, emit) {
      event.map(
        started: (event) {},
        extractText: (event) {},
      );
    });
  }
}
