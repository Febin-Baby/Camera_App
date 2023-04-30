import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:money_app/database/catagory_DB/catagory_db.dart';
import 'package:money_app/model/catagories/catagory_model.dart';

class addTransactions extends StatefulWidget {
  static const routName = 'add_transactions';
  const addTransactions({super.key});

  @override
  State<addTransactions> createState() => _addTransactionsState();
}

class _addTransactionsState extends State<addTransactions> {
  
  DateTime? _selectDate;
  CategoryType? _selectedCategoryType;
  CatagoryModel? _selectedCategoryModel;
  
  //purpose
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          child: Column(
            children: [
              //purpose
              TextField(
                decoration: InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(13),
                  ),
                ),
              ),
              TextField(
                //amount
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Amount',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(13),
                  ),
                ),
              ),
              if(_selectDate==null)
              TextButton.icon(
                
                //calender
                onPressed: ()async {
                 final _selectDate=await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now().subtract(Duration(days: 12),),
                    lastDate: DateTime.now(),
                  );
                  if(_selectDate==null){
                    return;
                  }
                },
                icon: Icon(
                  Icons.calendar_month,
                ),
                label: Text('Select date'),
              )else
              Text(_selectDate.toString()),
              Row(
                // category
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Radio(
                    value: CategoryType.income,
                    groupValue: CategoryType.income,
                    onChanged: (newValue) {},
                  ),
                  Radio(
                    value: CategoryType.expence,
                    groupValue: CategoryType.income,
                    onChanged: (newValue) {},
                  ),
                ],
              ),
              DropdownButton(
                hint: Text('Select Category'),
                items: categoryDB().expenceCategryList.value.map(
                  (e) {
                    return DropdownMenuItem(
                      value: e.id,
                      child: Text(e.name),
                    );
                  },
                ).toList(),
                onChanged: (selectedValue) {},
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
