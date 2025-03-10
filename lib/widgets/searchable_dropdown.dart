import 'package:flutter/material.dart';

class SearchableDropdown extends StatelessWidget {
  final String label;
  final List<String> options;
  final String? selectedValue;
  final Function(String) onSelected;
  final String hintText;
  final String? errorText;

  const SearchableDropdown({
    super.key,
    required this.label,
    required this.options,
    required this.selectedValue,
    required this.onSelected,
    required this.hintText,
    this.errorText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        Autocomplete<String>(
          optionsBuilder: (TextEditingValue textEditingValue) {
            if (textEditingValue.text.isEmpty) {
              return const Iterable<String>.empty();
            }
            return options.where((option) =>
                option.toLowerCase().contains(textEditingValue.text.toLowerCase()));
          },
          onSelected: (String selection) {
            onSelected(selection);
          },
          fieldViewBuilder: (context, controller, focusNode, onEditingComplete) {
            return TextField(
              controller: controller,
              focusNode: focusNode,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                hintText: hintText,
                errorText: errorText
              ),
              onEditingComplete: onEditingComplete,
            );
          },
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
