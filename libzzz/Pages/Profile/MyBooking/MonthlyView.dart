import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reserved4u/Helper/NotificatiokKeys.dart';
import 'package:reserved4u/Pages/Profile/MyBooking/CalendarViewModel.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'BookingController.dart';

// ignore: must_be_immutable
class MonthlyView extends StatelessWidget {
  final TabController tabControllerMonthPage;
  MonthlyView({Key key, this.tabControllerMonthPage}) : super(key: key);
  BookingController _bookingController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      height: Get.height * 0.60,
      decoration: BoxDecoration(
          boxShadow: [BoxShadow(blurRadius: 10, color: Color(0xFFf6f6f8))]),
      child: SfCalendar(
        view: CalendarView.month,
        scheduleViewSettings: ScheduleViewSettings(
          appointmentItemHeight: 70,
        ),
        headerHeight: 50,
        showNavigationArrow: false,
        headerStyle: CalendarHeaderStyle(textAlign: TextAlign.center),
        firstDayOfWeek: DateTime.monday,
        showDatePickerButton: false,
        todayHighlightColor: Color(0xFFdb8a8a),
        cellBorderColor: Colors.grey[400],
        headerDateFormat: 'MMMM,yyy',
        showCurrentTimeIndicator: true,
        selectionDecoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(color: Colors.grey[400], width: 0.5),
        ),
        dataSource: _getDataSource(),
        appointmentTextStyle: TextStyle(
            fontSize: 10, fontFamily: AppFont.regular, color: Colors.black),
        appointmentTimeTextFormat: 'HH:mm',
        monthViewSettings: MonthViewSettings(
          appointmentDisplayMode: MonthAppointmentDisplayMode.indicator,
          showAgenda: false,
        ),
        onTap: (value) {
          _bookingController.currentDate.value = value.date;
          _bookingController.currentDateWithFormate();

          _bookingController.calenderSelectedIndex.value = 0;
          this.tabControllerMonthPage.animateTo(0);
        },
      ),
    );
  }

  _DataSource _getDataSource() {
    final List<Appointment> appointments = <Appointment>[];

    for (CalendarViewModel temp
        in _bookingController.arrCalendarDataForMonthly) {
      if (temp.apooDate != null && temp.apooTime != null) {
        var appoinmentData = temp.apooDate + " " + temp.apooTime;
        var dateTime = DateTime.parse(appoinmentData);
        appointments.add(Appointment(
          startTime: dateTime,
          endTime: dateTime,
          subject: temp.serviceName,
          color: Color(0xFFe8e8ec),
        ));
      }
    }

    return _DataSource(appointments);
  }
}

class _DataSource extends CalendarDataSource {
  _DataSource(List<Appointment> source) {
    appointments = source;
  }
}
