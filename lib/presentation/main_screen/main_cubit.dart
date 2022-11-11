import 'package:flutter_bloc/flutter_bloc.dart';

import 'main_state.dart';



class BottomNavCubit extends Cubit<BottomNavScreenState> {
  BottomNavCubit() : super(const BottomNavScreenState.initial());

  void onTapContainer(int index) {
    emit(state.copyWith(selectedIndex: index));
  }
}
