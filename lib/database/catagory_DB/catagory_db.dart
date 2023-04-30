import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:money_app/catagories/wideets/income_catogory_list.dart';
import 'package:money_app/model/catagories/catagory_model.dart';

const CATEGORY_DB_NAME = 'category-database';

abstract class catagoryDbFunctions {
  Future<List<CatagoryModel>> getCategories();
  Future<void> insertCategory(CatagoryModel value);
}

class categoryDB implements catagoryDbFunctions {

  categoryDB._Intenal();
  static categoryDB instance=categoryDB._Intenal();

  factory categoryDB(){
    return instance;
  } 


  ValueNotifier<List<CatagoryModel>> icomeCategryList = ValueNotifier([]);
  ValueNotifier<List<CatagoryModel>> expenceCategryList = ValueNotifier([]);
  @override
  Future<void> insertCategory(CatagoryModel value) async {
    final categoryDB = await Hive.openBox<CatagoryModel>(CATEGORY_DB_NAME);
    categoryDB.add(value);
    refreshUI();
   }

  @override
  Future<List<CatagoryModel>> getCategories() async {
    final categoryDB = await Hive.openBox<CatagoryModel>(CATEGORY_DB_NAME);
    return categoryDB.values.toList();
  }

  Future<void> refreshUI() async {
    final _allCategories = await getCategories();
    icomeCategryList.value.clear();
    expenceCategryList.value.clear();
    await Future.forEach(
      _allCategories,
      (CatagoryModel category) {
        if(CatagoryModel==CategoryType.income){
          icomeCategryList.value.add(category);
        }else{
          expenceCategryList.value.add(category);
        };
      },
    );
    icomeCategryList.notifyListeners();
    expenceCategryList.notifyListeners();
  }
 
}
