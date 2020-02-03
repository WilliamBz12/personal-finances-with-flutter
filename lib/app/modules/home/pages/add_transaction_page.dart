import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:personal_finances/app/models/cateogory_model.dart';
import 'package:personal_finances/app/modules/home/home_module.dart';
import 'package:personal_finances/app/models/transaction_model.dart';
import 'package:personal_finances/app/shared/style/app_colors.dart';
import 'package:personal_finances/app/shared/utils/categories.dart';
import 'package:personal_finances/app/shared/utils/handle_date_modal.dart';
import 'package:personal_finances/app/shared/widgets/custom_button.dart';
import 'package:personal_finances/app/shared/widgets/custom_dropdown.dart';
import 'package:personal_finances/app/shared/widgets/custom_text_field_widget.dart';

import '../home_bloc.dart';

class AddTransactionPage extends StatefulWidget {
  @override
  _AddTransactionPageState createState() => _AddTransactionPageState();
}

class _AddTransactionPageState extends State<AddTransactionPage> {
  final _valueController = TextEditingController();
  final _controllerDate = TextEditingController();
  final _typeController = TextEditingController(text: "Breakfast");
  final _titleController = TextEditingController();

  bool _isLoading = false;

  DateTime _dateSelected;

  final _homeBloc = HomeModule.to.getBloc<HomeBloc>();

 

  void _dateIsSelected(DateTime date) {
    setState(() {
      _dateSelected = date;
      _controllerDate.text = DateFormat("dd/MM/yyyy").format(date);
    });
  }

  void _onTap() {
    setState(() => _isLoading = true);

    if (_controllerDate.text.isNotEmpty &&
        _valueController.text.isNotEmpty &&
        _typeController.text.isNotEmpty &&
        _titleController.text.isNotEmpty) {
      final _item = TransactionModel(
        date: _dateSelected,
        value: double.parse(_valueController.text),
        type: _typeController.text,
        title: _titleController.text,
      );
      final result = _homeBloc.addNewTransaction(item: _item);

      if (result) {
        Navigator.pop(context);
      }
    }
    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                  child: Column(
                    children: <Widget>[
                      CustomTextFieldWidget(
                        controller: _valueController,
                        keyboardType: TextInputType.number,
                        prefixIcon: Icon(Icons.attach_money),
                        title: "Valor",
                      ),
                      SizedBox(height: 20),
                      CustomTextFieldWidget(
                        controller: _typeController,
                        title: "Categoria",
                        suffixIcon: Icon(Icons.arrow_drop_down),
                        onTap: () => CustomDropdown.show(
                          context,
                          onSelect: (CategoryModel category) =>
                              setState(() => _typeController.text = category.title),
                          items: Categories().list,
                        ),
                      ),
                      SizedBox(height: 20),
                      CustomTextFieldWidget(
                        controller: _controllerDate,
                        title: "Data da transação",
                        prefixIcon: Icon(Icons.calendar_today),
                        onTap: () => HandleDateModal.showPlatformDatePicker(
                          context,
                          onSelect: _dateIsSelected,
                        ),
                      ),
                      SizedBox(height: 20),
                      CustomTextFieldWidget(
                        controller: _titleController,
                        keyboardType: TextInputType.text,
                        prefixIcon: Icon(Icons.edit),
                        title: "Descrição",
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ),
            CustomButtonWidget(
              onTap: _onTap,
              text: "Adicionar",
              isLoading: _isLoading,
            )
          ],
        ),
      ),
    );
  }
}
