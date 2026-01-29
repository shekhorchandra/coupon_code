import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget filterDropdown({
  required String hint,
  required RxString selectedValue,
  required List<String> items,
}) {
  return Obx(
        () => Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          isDense: true,
          alignment: Alignment.centerLeft,
          value: items.contains(selectedValue.value) ? selectedValue.value : null,
          hint: Text(
            hint,
            style: const TextStyle(fontSize: 12),
          ),
          icon: const Padding(
            padding: EdgeInsets.only(left: 8),
            child: Icon(Icons.keyboard_arrow_down, size: 18),
          ),
          onChanged: (value) {
            if (value != null) {
              selectedValue.value = value;
            }
          },
          items: items
              .map(
                (item) => DropdownMenuItem<String>(
              value: item,
              child: Padding(
                padding: const EdgeInsets.only(right: 8), // ensures space from arrow
                child: Text(
                  item,
                  style: const TextStyle(fontSize: 12),
                ),
              ),
            ),
          )
              .toList(),
        ),
      ),
    ),
  );
}
