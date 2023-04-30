import 'package:flutter/material.dart';

class transactionScreen extends StatefulWidget {
  transactionScreen({super.key});

  @override
  State<transactionScreen> createState() => _transactionScreenState();
}

class _transactionScreenState extends State<transactionScreen> {
  final names = [
    'Febin',
    'Sebin',
    'Jibin',
    'Baby',
    'Arun',
    'Ananth',
    'Arundev',
    'appu',
    'Sreerag',
    'sudeep',
    'shakar'
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.separated(
        itemBuilder: (ctx, index) {
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            elevation: 4,
            child: ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
              leading: CircleAvatar(
                child: Container(
                  width: 50,
                  height: 50,
                ),
              ),
              title: Text(names[index]),
              subtitle: Text('100000'),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return SizedBox(
            height: 10,
          );
        },
        itemCount: 11,
      ),
    );
  }
}
