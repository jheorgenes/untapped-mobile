import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

class DropdownButtonWidget extends StatelessWidget {
  final List items;
  final List selectedItems;
  final String title;
  final String? Function(List<String?>? value)? validator;
  final Function(List<String?> items) onChanged;
  final Color? labelColor;
  final String labelKey;
  const DropdownButtonWidget({
    super.key,
    required this.items,
    required this.selectedItems,
    required this.onChanged,
    required this.title,
    this.labelKey = 'label',
    this.validator,
    this.labelColor,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownSearch<String?>.multiSelection(
      items: items.map((e) => e[labelKey].toString()).toList(),
      selectedItems: selectedItems.map((e) => e[labelKey].toString()).toList(),
      validator: validator,
      // popupProps: const PopupPropsMultiSelection.dialog(
      //   dialogProps: DialogProps(),
      // ),
      dropdownDecoratorProps: DropDownDecoratorProps(
        dropdownSearchDecoration: InputDecoration(
            labelText: title,
            labelStyle: TextStyle(
              color: labelColor,
            )),
      ),
      onChanged: onChanged,
    );
  }
}
