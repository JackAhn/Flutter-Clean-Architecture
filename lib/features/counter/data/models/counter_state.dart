import 'package:freezed_annotation/freezed_annotation.dart';

part 'counter_state.freezed.dart';
part 'counter_state.g.dart';

@freezed
/// _$CounterUiModel : freezed가 생성한 믹스인 클래스 (copyWith, toString, ==, hashCode 등이 정의됨)
abstract class CounterUiModel with _$CounterUiModel {

  /// _CounterUiModel : freezed가 자동 생성한 구현 클래스
  /// 외부에서는 추상 클래스, 내부에서는 구현 클래스를 이용해 불변 객체 생성
  const factory CounterUiModel({
    @Default(0) int count
  }) = _CounterUiModel;

  /// freezed_annotation will generate toJson, fromJson.
  factory CounterUiModel.fromJson(Map<String, dynamic> json) =>
      _$CounterUiModelFromJson(json);
}