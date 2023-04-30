import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:money_app/database/catagory_DB/catagory_db.dart';

class expenceCatagoryList extends StatelessWidget {
  const expenceCatagoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: categoryDB().expenceCategryList,
      builder: (ctx, newList, _) {
        return ListView.builder(
            itemBuilder: (ctx, i) {
              final Categ=newList[i];
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: ListTile(
                    contentPadding:
                      EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
                    leading: CircleAvatar(
                      child: Container(
                        width: 50,
                        height: 50,
                      ),
                    ),
                    title: Text(Categ.name),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min, 
                      children: [
                        IconButton(
                          icon: Icon(Icons.edit),
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: Icon(Icons.delete,color: Colors.red,),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
            itemCount: newList.length);
      },
    );
  }
}
