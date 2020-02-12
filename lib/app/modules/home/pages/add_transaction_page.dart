import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:personal_finances/app/models/category_model.dart';
import 'package:personal_finances/app/modules/home/home_module.dart';
import 'package:personal_finances/app/models/transaction_model.dart';
import 'package:personal_finances/app/shared/utils/categories.dart';
import 'package:personal_finances/app/shared/utils/custom_snackbar.dart';
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
  final _typeController = TextEditingController(text: Categories.list[0].title);
  final _descriptionController = TextEditingController();

  bool _isLoading = false;

  DateTime _dateSelected;
  CategoryModel categorySelected = Categories.list[0];

  final _homeBloc = HomeModule.to.getBloc<HomeBloc>();

  void _dateIsSelected(DateTime date) {
    setState(() {
      _dateSelected = date;
      _controllerDate.text = DateFormat("dd/MM/yyyy").format(date);
    });
  }

  void _categorySelected(CategoryModel category) {
    setState(() {
      _typeController.text = category.title;
      categorySelected = category;
    });
  }

  void _onTap() {
    setState(() => _isLoading = true);

    if (_controllerDate.text.isNotEmpty &&
        _valueController.text.isNotEmpty &&
        _typeController.text.isNotEmpty &&
        _descriptionController.text.isNotEmpty) {
      final val = double.parse(_valueController.text);
      final value = categorySelected.isSpeend ? val * (-1) : val;

      final _item = TransactionModel(
        date: _dateSelected,
        value: value,
        type: categorySelected.id,
        description: _descriptionController.text,
      );

      final result = _homeBloc.addNewTransaction(item: _item);

      if (result) {
        Navigator.pop(context);
      } else {
        CustomSnackbar.error(context, message: "Não foi possível adicionar");
      }
    }
    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    double _widhtSize = MediaQuery.of(context).size.width;

    return AlertDialog(
      content: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: SingleChildScrollView(
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
                controller: _typeController,
                title: "Categoria",
                prefixIcon: Icon(categorySelected.icon),
                suffixIcon: Icon(Icons.arrow_drop_down),
                onTap: () => CustomDropdown.show(
                  context,
                  onSelect: _categorySelected,
                  items: Categories.list,
                ),
              ),
              SizedBox(height: 20),
              CustomTextFieldWidget(
                controller: _descriptionController,
                keyboardType: TextInputType.text,
                prefixIcon: Icon(Icons.edit),
                title: "Descrição",
              ),
              SizedBox(height: 20),
              CustomButtonWidget(
                onTap: _onTap,
                text: "Adicionar",
                isLoading: _isLoading,
              )
            ],
          ),
        ),
      ),
    );
  }
}
