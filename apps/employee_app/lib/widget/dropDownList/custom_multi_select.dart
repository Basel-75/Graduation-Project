import 'package:employee_app/component/drop_down_item.dart';
import 'package:flutter/material.dart';
import 'package:get_all_pkg/get_all_pkg.dart';

class CustomMultiSelects extends StatelessWidget {
  final List<DropDownItem>? items;
  final dynamic Function(List<DropDownItem>)? onListChanged;
  final String label, hintText;
  final Color? backgroundColor;
  const CustomMultiSelects({
    super.key,
    this.items,
    this.onListChanged,
    required this.label,
    required this.hintText,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: const TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff103C37)),
            ),
            SizedBox(
              height: 0.5.h,
            ),
            CustomDropdown<DropDownItem>.multiSelectSearch(
                itemsListPadding: EdgeInsets.symmetric(horizontal: 8.w),
                decoration: CustomDropdownDecoration(
                  closedFillColor: backgroundColor ?? const Color(0xffF6FAFD),
                  closedBorder: Border.all(
                      width: 0.8, color: Colors.grey.withOpacity(0.2)),
                  closedShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 0.2,
                      blurRadius: 2,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                hintText: hintText,
                items: items,
                onListChanged: onListChanged),
          ],
        ),
      ),
    );
  }
}
