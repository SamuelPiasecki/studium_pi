import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studium_pi/model/event_data_source.dart';
import 'package:studium_pi/provider/event_provider.dart';
import 'package:studium_pi/widget/calendar_widget/task_widget.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class CalendarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CalendarController _controller = CalendarController();
    final events = Provider.of<EventProvider>(context).events;

    return SfCalendar(
      view: CalendarView.week,
      allowedViews: [
        CalendarView.day,
        CalendarView.week,
        CalendarView.workWeek,
        CalendarView.month,
        CalendarView.timelineDay,
        CalendarView.timelineWeek,
        CalendarView.timelineWorkWeek
      ],
      controller: _controller,
      onTap: (CalendarTapDetails details) {
        if (_controller.view == CalendarView.month &&
            details.targetElement == CalendarElement.calendarCell) {
          _controller.view = CalendarView.day;
        } else if ((_controller.view == CalendarView.week ||
                _controller.view == CalendarView.workWeek) &&
            details.targetElement == CalendarElement.viewHeader) {
          _controller.view = CalendarView.day;
        }
      },
      monthViewSettings: MonthViewSettings(
          navigationDirection: MonthNavigationDirection.vertical),
      timeZone: 'E. South America Standard Time',
      dataSource: EventDataSource(events),
      initialSelectedDate: DateTime.now(),
      cellBorderColor: Colors.transparent,
      onLongPress: (details) {
        final provider = Provider.of<EventProvider>(context, listen: false);
        provider.setDate(details.date!);
        showModalBottomSheet(
          context: context,
          builder: (context) => TasksWidget(),
        );
      },
    );
  }
}
