import 'package:flutter_bloc/flutter_bloc.dart';

class IntBaseCubit extends Cubit<int?> {
  final int? initialValue;
  IntBaseCubit({this.initialValue}) : super(initialValue);
  void chooseItem(int index) => emit(index);

  void increase(int itemsLength) {
    if (state! >= itemsLength) {
      emit(0);
      return;
    }
    emit(state! + 1);
  }

  void decrease(int itemsLength) {
    if (state! <= 0) {
      emit(itemsLength - 1);
      return;
    }
    emit(state! - 1);
  }
}
