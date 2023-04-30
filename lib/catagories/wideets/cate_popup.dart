import 'package:flutter/material.dart';
import 'package:money_app/database/catagory_DB/catagory_db.dart';
import 'package:money_app/model/catagories/catagory_model.dart';

ValueNotifier<CategoryType> selectedCtegoryNotifier =
  ValueNotifier(CategoryType.income);

final name = TextEditingController();

Future<void> showCategoryAddPopup(BuildContext context) async {
  showDialog(
    context: context,
    builder: (ctx) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: SimpleDialog(
          title: Text('Add Category'),
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: name,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(21)),
                  hintText: 'Name',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: Row(
                children: [
                  radioButtun(tittle: "income", type: CategoryType.income),
                  radioButtun(tittle: "EXPENCE", type: CategoryType.expence),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  final _name = name.text;
                  if (_name.isEmpty) {
                    return;
                  }
                  final _type = selectedCtegoryNotifier.value;
                  final category= CatagoryModel(
                    id: DateTime.now().microsecondsSinceEpoch.toString(),
                    name: _name,
                    type: _type);
                    categoryDB.instance.insertCategory(category);
                    Navigator.of(ctx).pop();
                },
                child: Text('add'),
              ),
            ),
          ],
        ),
      );
    },
  );
}

class radioButtun extends StatelessWidget {
  final String tittle;
  final CategoryType type;
  radioButtun({super.key, required this.tittle, required this.type});

  CategoryType? _type;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ValueListenableBuilder(
          valueListenable: selectedCtegoryNotifier,
          builder: (ctx, newCategory, _) {
            return Radio<CategoryType>(
              value: type,
              groupValue: selectedCtegoryNotifier.value,
              onChanged: (value) {
                if (value == null) {
                  return;
                }
                selectedCtegoryNotifier.value = value;
                selectedCtegoryNotifier.notifyListeners();
              },
            );
          },
        ),
        Text(tittle),
      ],
    );
  }
}
