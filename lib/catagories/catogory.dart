import 'package:flutter/material.dart';
import 'package:money_app/catagories/wideets/expence_catagory-List.dart';
import 'package:money_app/catagories/wideets/income_catogory_list.dart';
import 'package:money_app/database/catagory_DB/catagory_db.dart';

class catogoryScreen extends StatefulWidget {
  const catogoryScreen({super.key});

  @override
  State<catogoryScreen> createState() => _catogoryScreenState();
}

class _catogoryScreenState extends State<catogoryScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    categoryDB().refreshUI();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          indicator: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
            color: Colors.white,
          ),
          indicatorColor: Colors.red,
          controller: _tabController,
          labelColor: Colors.red,
          unselectedLabelColor: Colors.white,
          tabs: const [
            Tab(
              text: 'Income',
            ),
            Tab(
              text: 'Expence',
            ),
          ],
        ),
        Expanded(
          child: TabBarView(controller: _tabController, children: const [
            incomeCatagoryList(),
            expenceCatagoryList(),
          ]),
        )
      ],
    );
  }
}
