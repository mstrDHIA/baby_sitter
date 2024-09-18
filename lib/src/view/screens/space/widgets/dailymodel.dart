
import 'package:flutter/material.dart';


class DayModel {
  String? name;
  String? startTime;
  String? endTime;

  DayModel({this.name, this.startTime, this.endTime});
}


// ChipDay.dart


class ChipDay extends StatelessWidget {
  final DayModel day;
  final bool isSelected;
  final VoidCallback onTap;

  ChipDay({required this.day, required this.isSelected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return FilterChip(
      label: Text(day.name ?? ''),
      selected: isSelected,
      onSelected: (_) => onTap(),
    );
  }
}
