import 'package:freezed_annotation/freezed_annotation.dart';
part 'finance.g.dart';
part 'finance.freezed.dart';

@freezed
class Finance with _$Finance {
  const factory Finance(
      {required String name, required String description, required String category, required String total, int? number, String? status}) = _Finance;

  factory Finance.fromJson(Map<String, dynamic> json) => _$FinanceFromJson(json);
}
