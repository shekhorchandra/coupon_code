import 'package:flutter/material.dart';

import '../values/app_color.dart';

class CustomDropdownField<T> extends StatelessWidget {
  final String hint;
  final T? value;
  final List<T> items;
  final String Function(T) itemLabel;
  final void Function(T?) onChanged;
  final Widget? prefixIcon;

  const CustomDropdownField({
    super.key,
    required this.hint,
    required this.items,
    required this.itemLabel,
    required this.onChanged,
    this.value,
    this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: InputDecorator(
        decoration: InputDecoration(
          hintText: hint,
          prefixIcon: prefixIcon,
          contentPadding: const EdgeInsets.symmetric(horizontal: 20),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: const BorderSide(color: AppColor.primary, width: 1),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: const BorderSide(color: AppColor.border, width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: const BorderSide(color: AppColor.primary, width: 1.5),
          ),
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<T>(
            value: value,
            isExpanded: true, // this is critical
            hint: Text(hint),
            onChanged: onChanged,
            items: items.map((item) {
              return DropdownMenuItem<T>(value: item, child: Text(itemLabel(item)));
            }).toList(),
          ),
        ),
      ),
    );
  }
}
