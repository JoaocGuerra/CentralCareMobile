import 'package:centralcaremobile/pages/appointments/appointment_card.dart';
import 'package:flutter/material.dart';

class AppointmentsListBuilder extends StatefulWidget {
  final listAppointments;

  const AppointmentsListBuilder({Key? key, this.listAppointments})
      : super(key: key);

  @override
  State<AppointmentsListBuilder> createState() =>
      _AppointmentsListBuilderState();
}

class _AppointmentsListBuilderState extends State<AppointmentsListBuilder> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.listAppointments.length,
      itemBuilder: (context, index) {
        return AppointmentCard(
          data: widget.listAppointments[index],
        );
      },
    );
  }
}
