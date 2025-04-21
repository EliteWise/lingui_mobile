import 'package:flutter/material.dart';

class MultiSelectList<T> extends StatefulWidget {

  final List<T> data;
  final List<T> selectedItems;
  final String Function(T) itemLabelBuilder;

  const MultiSelectList({required this.data, super.key, required this.selectedItems, required this.itemLabelBuilder});

  @override
  State<MultiSelectList<T>> createState() => _MultiSelectListState<T>();
}

class _MultiSelectListState<T> extends State<MultiSelectList<T>> {
  late List<T> _selectedItems;

  @override
  void initState() {
    super.initState();
    _selectedItems = List.from(widget.selectedItems);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: ListBody(
          children: widget.data.map((item) {
            final isSelected = _selectedItems.contains(item);
            return ListTile(
              title: Text(widget.itemLabelBuilder(item)),
              tileColor: isSelected ? Colors.blue.withOpacity(0.2) : null,
              onTap: () {
                setState(() {
                  if(isSelected) {
                    _selectedItems.remove(item);
                  } else {
                    _selectedItems.add(item);
                  }
                });
              },
            );
          }).toList(),
        ),
      ),
    );
  }
}
