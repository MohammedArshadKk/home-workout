import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class TableCalendarReport extends StatelessWidget {
  const TableCalendarReport({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return TableCalendar(
      focusedDay: DateTime.now(),
      firstDay: DateTime.utc(2005, 1, 1),
      lastDay: DateTime.utc(2050, 12, 1),
      calendarFormat: CalendarFormat.week,
      availableGestures: AvailableGestures.horizontalSwipe,
      daysOfWeekHeight: screenWidth * 0.06,
      rowHeight: screenWidth * 0.1,
      headerStyle: HeaderStyle(
        titleTextStyle: TextStyle(fontSize: screenWidth * 0.05),
      ),
      calendarStyle: CalendarStyle(
        outsideDaysVisible: false,
        todayTextStyle:const TextStyle(color: Colors.blue),
        todayDecoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(color: Colors.blue, width: 2),
          shape: BoxShape.circle,
        ),
        defaultTextStyle: TextStyle(fontSize: screenWidth * 0.035),
      ),
    );
  }
}
