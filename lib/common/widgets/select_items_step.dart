import 'dart:collection';

import 'package:echofetch/features/pickup/models/waste_item.dart';
import 'package:echofetch/common/widgets/waste_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:echofetch/data/waste_item_list.dart';

class SelectItemStep extends StatefulWidget {
  SelectItemStep({super.key, required this.onNext});
  final void Function(HashSet<WasteItem>) onNext;

  @override
  State<SelectItemStep> createState() => _SelectItemStepState();
}

class _SelectItemStepState extends State<SelectItemStep> {
  final HashSet<WasteItem> _selectedItems = HashSet();

  void _selectMultipleItems(WasteItem item) {
    setState(() {
      if (_selectedItems.contains(item)) {
        _selectedItems.remove(item);
      } else {
        _selectedItems.add(item);
      }
    },);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: GridView(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 3 / 2,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
            ),
            children: [
              ...wasteItemList.map(
                (item) => WasteItemWidget(
                  wasteItem: item,
                  onTap: _selectMultipleItems,
                  isSelected: _selectedItems.contains(item),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 8,
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(
              vertical: 14,
              horizontal: 50,
            ),
            backgroundColor: Theme.of(context).colorScheme.primaryContainer,
          ),
          onPressed: (){widget.onNext(_selectedItems);},
          child: Text(
            'Next',
            style: TextStyle(
              fontSize: 18,
            ),
          ),
        ),
      ],
    );
  }
}
