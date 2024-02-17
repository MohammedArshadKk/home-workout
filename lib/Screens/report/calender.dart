import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class TableCalendarReport extends StatelessWidget {
  const TableCalendarReport({super.key});

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
              focusedDay: DateTime.now(),
              firstDay: DateTime.utc(2005, 1, 1),
              lastDay: DateTime.utc(2050, 12, 1),
              calendarFormat: CalendarFormat.week,
            );
  }
}