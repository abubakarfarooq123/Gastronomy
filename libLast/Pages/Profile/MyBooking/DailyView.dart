import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reserved4u/Helper/NotificatiokKeys.dart';
import 'package:reserved4u/Pages/Profile/MyBooking/CalendarViewModel.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'BookingController.dart';

// ignore: must_be_immutable
class DailyView extends StatelessWidget {
  BookingController _bookingController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      height: Get.height * 0.67,
      decoration: BoxDecoration(
          boxShadow: [BoxShadow(blurRadius: 10, color: Color(0xFFf6f6f8))]),
      child: SfCalendar(
        initialDisplayDate: DateTime.now(),
        timeSlotViewSettings:
            TimeSlotViewSettings(timeFormat: 'HH', startHour: 6),
        initialSelectedDate: DateTime.now().add(Duration(days: 2)),        view: CalendarView.day,
        viewHeaderHeight: 55,
        headerHeight: 45,
        controller: _bookingController.calendarController,
        todayHighlightColor: Color(0xFFdb8a8a),
        cellBorderColor: Colors.grey[400],
        selectionDecoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(color: Colors.grey[400], width: 0.5),
        ),
        appointmentBuilder: (context, details) {
          return details.appointments.first.subject == null
              ? SizedBox()
              : Container(
                  color: Color(0xFFdb8a8a),
                  padding: EdgeInsets.only(left: 9, top: 5),
                  child: Text(
                    details.appointments.first.subject,
                    style: TextStyle(
                        fontSize: 14,
                        fontFamily: AppFont.regular,
                        color: Colors.white),
                  ),
                );
        },
        dataSource: _getDataSource(),
        showCurrentTimeIndicator: true,
        monthCellBuilder: (context, cell) {
          return Container(
            color: Colors.redAccent,
            height: 30,
          );
        },
        appointmentTextStyle: TextStyle(
            fontSize: 17, fontFamily: AppFont.regular, color: Colors.black),
        appointmentTimeTextFormat: 'HH:mm',
        monthViewSettings: MonthViewSettings(
            appointmentDisplayMode: MonthAppointmentDisplayMode.indicator),
        onViewChanged: (value) {
          print(value.visibleDates);
          if (value.visibleDates.length > 0) {
            _bookingController.currentDate.value = value.visibleDates.first;
            _bookingController.currentDateWithFormate();
          } else {}
        },
        onTap: (value) {
          print(value.appointments.first);
          Appointment obj = value.appointments.first;
          print(obj.notes);
          _bookingController.getBookingDetailsFromCalendar(
              appID: obj.notes, serviceID: obj.location);
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
        var endTime = temp.apooDate + " " + temp.end;
        var dateTime = DateTime.parse(appoinmentData);
        var endDateTime = DateTime.parse(endTime);

        appointments.add(Appointment(
          startTime: dateTime,
          endTime: endDateTime.add(Duration(minutes: 30)),
          subject: temp.serviceName,
          notes: temp.appId.toString(),
          location: temp.serviceId.toString(),
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
