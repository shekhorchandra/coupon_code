import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../values/app_color.dart';
import '../values/app_text.dart';

class CustomDateRangeSelector extends StatelessWidget {
  final Rx<DateTimeRange?> selectedRange;
  final String hint;

  const CustomDateRangeSelector({
    super.key,
    required this.selectedRange,
    this.hint = 'Select Validity Range',
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      String text;
      if (selectedRange.value != null) {
        final start = selectedRange.value!.start;
        final end = selectedRange.value!.end;
        text =
            "${start.day.toString().padLeft(2, '0')}-${start.month.toString().padLeft(2, '0')}-${start.year}  →  "
            "${end.day.toString().padLeft(2, '0')}-${end.month.toString().padLeft(2, '0')}-${end.year}";
      } else {
        text = hint;
      }

      return GestureDetector(
        onTap: () async {
          DateTime now = DateTime.now();
          DateTimeRange? picked = await showDateRangePicker(
            context: context,
            firstDate: DateTime(2000),
            lastDate: DateTime(now.year + 5),
            initialDateRange: selectedRange.value,
          );

          if (picked != null) {
            selectedRange.value = picked;
          }
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: AppColor.border),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(Icons.calendar_today, color: AppColor.bw.s500),
              const SizedBox(width: 10),

              Expanded(
                child: Text(
                  text,
                  style: AppText.h5.medium.copyWith(
                    color: selectedRange.value != null ? Colors.black : Colors.grey,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
