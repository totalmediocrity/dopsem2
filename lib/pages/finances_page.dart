import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/url.dart';
import '../models/finance.dart';
import '../cubit/finance_cubit.dart';
import '../interceptors/custom_interceptor.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => HistoryPageState();
}

class HistoryPageState extends State<HistoryPage> {
  TextEditingController controllerName = TextEditingController();
  TextEditingController controllerText = TextEditingController();
  TextEditingController controllerCategory = TextEditingController();
  TextEditingController controllerTotal = TextEditingController();
  GlobalKey<FormState> key = GlobalKey();
  SharedPreferences? sharedPreferences;
  Dio DIO = Dio();
  List<Finance> finances = [];
  String filter = '';

  Future<void> initSharedPreferences() async =>
      sharedPreferences = await SharedPreferences.getInstance();

  void clearSharedPreferences() async => await sharedPreferences!.clear();

  String getTokenSharedPreferences() {
    return sharedPreferences!.getString('token')!;
  }

  Future<void> getFinances(String filter, String search) async {
    try {
      Response response = await DIO.get(URL.finance.value,
          queryParameters: {'filter': filter, 'search': search});
      if (response.data['message'] == 'Заметки не найдены') {
        context.read<FinancesCubit>().clearNotes();
        return;
      }

      finances = (response.data['data'] as List)
          .map((x) => Finance.fromJson(x))
          .toList();

      context.read<FinancesCubit>().setFinances(finances);
    } on DioError {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Ошибка', textAlign: TextAlign.center)));
    }
  }

  Future<void> createFinance() async {
    String name = controllerName.text;
    String text = controllerText.text;
    String category = controllerCategory.text;
    String total = controllerTotal.text;

    await DIO.put(URL.finance.value,
        data: Finance(
            name: name, description: text, category: category, total: total));
  }

  Future<void> updateFinances(int number) async {
    try {
      String name = controllerName.text;
      String text = controllerText.text;
      String category = controllerCategory.text;
      String total = controllerTotal.text;

      await DIO.post('${URL.finance.value}/$number',
          data: Finance(
              name: name, description: text, category: category, total: total));
    } on DioError {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Ошибка', textAlign: TextAlign.center)));
    }
  }

  Future<void> deleteFinance(int number) async {
    try {
      await DIO.delete('${URL.finance.value}/$number');
    } on DioError {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Ошибка', textAlign: TextAlign.center)));
    }
  }

  @override
  void initState() {
    super.initState();
    initSharedPreferences().then((value) async {
      String token = getTokenSharedPreferences();
      DIO.options.headers['Authorization'] = "Bearer $token";
      DIO.interceptors.add(CustomInterceptor());
      getFinances(filter, '');
    });
  }

  void showFinanceDialog(Finance? finance) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: const Color.fromARGB(255, 24, 19, 54),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          child: SizedBox(
            width: 300,
            height: 340,
            child: Column(
              children: [
                Center(
                  child: Form(
                    key: key,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: controllerName,
                          validator: ((value) {
                            if (value == null || value.isEmpty) {
                              return "Наименование не должно быть пустым";
                            }
                            return null;
                          }),
                          style: const TextStyle(color: Colors.white),
                          decoration: const InputDecoration(
                            border: UnderlineInputBorder(),
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white)),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white)),
                            labelStyle: TextStyle(color: Colors.white),
                            labelText: "Наименование",
                          ),
                        ),
                        const Padding(padding: EdgeInsets.fromLTRB(0, 5, 0, 5)),
                        TextFormField(
                          controller: controllerText,
                          validator: ((value) {
                            if (value == null || value.isEmpty) {
                              return "Текст не должен быть пустым";
                            }
                            return null;
                          }),
                          style: const TextStyle(color: Colors.white),
                          decoration: const InputDecoration(
                            border: UnderlineInputBorder(),
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white)),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white)),
                            labelStyle: TextStyle(color: Colors.white),
                            labelText: "Текст",
                          ),
                        ),
                        const Padding(
                            padding: EdgeInsets.fromLTRB(25, 5, 25, 5)),
                        TextFormField(
                          controller: controllerCategory,
                          validator: ((value) {
                            if (value == null || value.isEmpty) {
                              return "Категория не должна быть пустой";
                            }
                            return null;
                          }),
                          style: const TextStyle(color: Colors.white),
                          decoration: const InputDecoration(
                            border: UnderlineInputBorder(),
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white)),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white)),
                            labelStyle: TextStyle(color: Colors.white),
                            labelText: "Категория",
                          ),
                        ),
                        const Padding(
                            padding: EdgeInsets.fromLTRB(25, 5, 25, 5)),
                        TextFormField(
                          controller: controllerTotal,
                          validator: ((value) {
                            if (value == null || value.isEmpty) {
                              return "Стоимость не должна быть пустой";
                            }
                            return null;
                          }),
                          style: const TextStyle(color: Colors.white),
                          decoration: const InputDecoration(
                            border: UnderlineInputBorder(),
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white)),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white)),
                            labelStyle: TextStyle(color: Colors.white),
                            labelText: "Стоимость",
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                  child: Center(
                    child: Column(
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor:
                                const Color.fromARGB(255, 63, 57, 102),
                          ),
                          onPressed: () async {
                            if (!key.currentState!.validate()) return;
                            if (finance == null) {
                              await createFinance();
                            } else {
                              await updateFinances(finance.number!);
                            }
                            getFinances(filter, '');
                            controllerName.text = '';
                            controllerText.text = '';
                            controllerCategory.text = '';
                            controllerTotal.text = '';
                            Navigator.of(context).pop();
                          },
                          child: const Text("Сохранить"),
                        ),
                        const Padding(
                            padding: EdgeInsets.fromLTRB(0, 10, 0, 0)),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor:
                                const Color.fromARGB(255, 63, 57, 102),
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text("Отмена"),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color.fromARGB(255, 63, 57, 102),
        foregroundColor: Colors.white,
        title: SizedBox(
          width: double.infinity,
          height: 40,
          child: Center(
            child: TextField(
              onSubmitted: (value) => getFinances(filter, value),
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search, color: Colors.white),
                suffixIcon: PopupMenuButton(
                  tooltip: "Сортировка",
                  itemBuilder: (context) => [
                    PopupMenuItem(
                      child: const Text("Добавленные"),
                      onTap: () {
                        filter = 'created';
                        getFinances(filter, '');
                      },
                    ),
                    PopupMenuItem(
                      child: const Text("Измененные"),
                      onTap: () {
                        filter = 'updated';
                        getFinances(filter, '');
                      },
                    ),
                    PopupMenuItem(
                      child: const Text("Удаленные"),
                      onTap: () {
                        filter = 'deleted';
                        getFinances(filter, '');
                      },
                    ),
                    PopupMenuItem(
                      child: const Text("По умолчанию"),
                      onTap: () {
                        filter = '';
                        getFinances(filter, '');
                      },
                    ),
                  ],
                  icon: const Icon(Icons.filter_alt, color: Colors.white),
                ),
                hintText: 'Поиск',
                border: InputBorder.none,
              ),
            ),
          ),
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 38, 35, 55),
      body: Center(
        child: BlocBuilder<FinancesCubit, FinancesState>(
          builder: (context, state) {
            if (state is UpdateFinances) {
              return ListView.builder(
                itemCount: state.finances.length,
                itemBuilder: (context, index) => Card(
                  color: Colors.deepPurple,
                  child: ListTile(
                    textColor: Colors.white,
                    leading: CircleAvatar(
                      backgroundColor: const Color.fromARGB(255, 123, 118, 155),
                      child: Text(
                          (state.finances.elementAt(index).number).toString()),
                    ),
                    title: Text(state.finances.elementAt(index).description),
                    subtitle: Text(
                        "${state.finances.elementAt(index).name}\n${state.finances.elementAt(index).category}"),
                    trailing: PopupMenuButton(
                      tooltip: "Действия",
                      itemBuilder: (context) => [
                        if (state.finances.elementAt(index).status != 'deleted')
                          PopupMenuItem(
                            child: const Text("Изменить"),
                            onTap: () {
                              Finance finance = state.finances.elementAt(index);
                              controllerName.text = finance.name;
                              controllerText.text = finance.description;
                              controllerTotal.text = finance.total;
                              controllerCategory.text = finance.category;
                              Future.delayed(const Duration(seconds: 0),
                                  () => showFinanceDialog(finance));
                            },
                          ),
                        PopupMenuItem(
                          child: const Text("Удалить"),
                          onTap: () async {
                            deleteFinance(
                                state.finances.elementAt(index).number!);
                            context.read<FinancesCubit>().deleteNote(index);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }
            return const CircularProgressIndicator(
                color: Color.fromARGB(255, 123, 118, 155));
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showFinanceDialog(null),
        child: const Icon(Icons.add),
      ),
    );
  }
}
