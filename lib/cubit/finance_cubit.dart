import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

import '../models/finance.dart';

part 'finance_state.dart';

class FinancesCubit extends Cubit<FinancesState> {
  FinancesCubit() : super(FinancesInitial());

  List<Finance> finances = [];

  void setFinances(List<Finance> finances) {
    this.finances = finances;
    emit(UpdateFinances(finances));
  }

  void updateFinance(Finance finance) {
    finances.add(finance);
    emit(UpdateFinances(finances));
  }

  void deleteNote(int index) {
    finances.removeAt(index);
    emit(UpdateFinances(finances));
  }

  void clearNotes() {
    finances.clear();
    emit(ClearFinances(finances));
  }
}
