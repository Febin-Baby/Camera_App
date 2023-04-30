
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:money_app/add_transactions/add_transactions.dart';
import 'package:money_app/database/catagory_DB/catagory_db.dart';
import 'package:money_app/homeScreen/homeScreen.dart';
import 'package:money_app/model/catagories/catagory_model.dart';



void main(List<String> args) async{
  final obj1=categoryDB();
  final obj2=categoryDB();
  print(obj1==obj2); 
  WidgetsFlutterBinding.ensureInitialized(); 
  if(!Hive.isAdapterRegistered(CategoryTypeAdapter().typeId)){
    Hive.registerAdapter(CategoryTypeAdapter()); 
  }


  if(!Hive.isAdapterRegistered(CatagoryModelAdapter().typeId)){
    Hive.registerAdapter(CatagoryModelAdapter());
  }
  await Hive.initFlutter();
  runApp(const Myapp());
}
class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: homeScreen(),
      routes: {
        addTransactions.routName:(ctx)=>addTransactions(),
      },
    );
  }
}