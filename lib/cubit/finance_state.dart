part of 'finance_cubit.dart';

@immutable
abstract class FinancesState {}

class FinancesInitial extends FinancesState {}

class UpdateFinances extends FinancesState {
  final List<Finance> finances;

  UpdateFinances(this.finances);
}

class ClearFinances extends FinancesState {
  final List<Finance> finances;

  ClearFinances(this.finances);
}
