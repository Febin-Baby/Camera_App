import 'package:flutter/material.dart';
import 'package:money_app/add_transactions/add_transactions.dart';
import 'package:money_app/catagories/catogory.dart';
import 'package:money_app/catagories/wideets/cate_popup.dart';
import 'package:money_app/homeScreen/widgets/bottomNAvigationBar.dart';
import 'package:money_app/transations/transactionPage.dart';

class homeScreen extends StatelessWidget {
  homeScreen({super.key});
  static ValueNotifier<int> selected = ValueNotifier(0);

  final pages = [transactionScreen(), catogoryScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(' Money Manager'),
        centerTitle: true,
      ),
      bottomNavigationBar: moneyManagerBottomNavigatopnBar(),
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: selected,
          builder: (context, int updatedindex, _) {
            return pages[updatedindex];
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        child: Icon(
          Icons.add,
          color: Colors.black,
        ), 
        onPressed: () {
          if (selected.value == 0) {
            Navigator.of(context).pushNamed(addTransactions.routName);
            print('Add transactions');
          } else {
            showCategoryAddPopup(context);
            print('Add');
          //   final _samble = CatagoryModel(
          //     id: DateTime.now().millisecondsSinceEpoch.toString(),
          //     name: 'Travel',
          //     type: CategoryType.expence);
          //   categoryDB().insertCategory(_samble);
          // }
         } },
      ),
    );
  }
}
