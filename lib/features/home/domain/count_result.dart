import 'package:freezed_annotation/freezed_annotation.dart';

part 'count_result.freezed.dart';

// 숫자 입력 판단을 위한 클래스 생성
@freezed
class Result with _$Result {
  const Result._();
  const factory Result.success(int number) = _Success;
  const factory Result.failure(String error) = _Failure;
}