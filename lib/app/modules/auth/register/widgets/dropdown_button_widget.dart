import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

class DropdownButtonWidget extends StatelessWidget {
  final List<Map<String, String>> items;
  final String title;
  final String? Function(List<String?>? value)? validator;
  final Function(List<String?> items) onChanged;
  const DropdownButtonWidget({
    super.key,
    required this.items,
    required this.onChanged,
    required this.title,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownSearch.multiSelection(
      items: items.map((e) => e['label']).toList(),
      validator: validator,
      dropdownDecoratorProps: DropDownDecoratorProps(
        dropdownSearchDecoration: InputDecoration(
          labelText: title,
        ),
      ),
      onChanged: onChanged,
    );
  }
}
