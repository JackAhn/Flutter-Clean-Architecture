import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/models/counter_state.dart';

part 'counter_viewmodel.g.dart';

@riverpod
class CounterViewModel extends _$CounterViewModel {
  /// build() is called when the provider is first initialized.
  /// This is where you can initialize your state.
  @override
  CounterUiModel build() {
    return CounterUiModel(count: 0);
  }

  void increment() {
    state = state.copyWith(count: state.count + 1);
  }
}