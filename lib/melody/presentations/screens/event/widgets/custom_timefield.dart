import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomTimefield extends StatefulWidget {
  final String title;
  final DateTime initialDate;
  final DateTime firstDate;
  final DateTime lastDate;
  final TextEditingController startDateController;
  final TextEditingController startTimeController;
  final TextEditingController endDateController;
  final TextEditingController endTimeController;

  const CustomTimefield({
    Key? key,
    required this.title,
    required this.initialDate,
    required this.firstDate,
    required this.lastDate,
    required this.startDateController,
    required this.startTimeController,
    required this.endDateController,
    required this.endTimeController,
  }) : super(key: key);

  @override
  _CustomTimefieldState createState() => _CustomTimefieldState();
}

class _CustomTimefieldState extends State<CustomTimefield> {
  DateTime? startDate;
  DateTime? endDate;
  TimeOfDay? startTime;
  TimeOfDay? endTime;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 364,
      height: 210,
      decoration: BoxDecoration(
        color: Color(0xFF94C7D7),
        borderRadius: BorderRadius.circular(9),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Row(
              children: [
                Icon(Icons.calendar_today, color: Colors.white),
                SizedBox(width: 8),
                Text(
                  widget.title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontFamily: 'Vesper Libre',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          Divider(color: Colors.white),
          ListTile(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Start', style: TextStyle(color: Colors.white)),
                SizedBox(width: 8),
                Expanded(
                  flex: 2,
                  child: TextField(
                    controller: widget.startDateController,
                  ),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: TextField(
                    controller: widget.startTimeController,
                  ),
                ),
              ],
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.calendar_today),
                  onPressed: () async {
                    DateTime initialDate =
                        widget.initialDate.isBefore(widget.firstDate)
                            ? widget.firstDate
                            : widget.initialDate;
                    final selectedDate = await showDatePicker(
                      context: context,
                      initialDate: initialDate,
                      firstDate: widget.firstDate,
                      lastDate: widget.lastDate,
                    );
                    if (selectedDate != null) {
                      setState(() {
                        startDate = selectedDate;
                        widget.startDateController.text =
                            DateFormat('MMMM dd, yyyy').format(startDate!);
                      });
                    }
                  },
                ),
                IconButton(
                  icon: Icon(Icons.access_time),
                  onPressed: () async {
                    final selectedTime = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(),
                    );
                    if (selectedTime != null) {
                      setState(() {
                        startTime = selectedTime;
                        final now = DateTime.now();
                        final dateTime = DateTime(now.year, now.month, now.day,
                                startTime!.hour, startTime!.minute)
                            .toUtc()
                            .add(Duration(hours: 7));
                        widget.startTimeController.text =
                            DateFormat('HH:mm:ss').format(dateTime);
                      });
                    }
                  },
                ),
              ],
            ),
          ),
          ListTile(
            title: Row(
              children: [
                Text('End', style: TextStyle(color: Colors.white)),
                SizedBox(width: 8),
                Expanded(
                  flex: 2,
                  child: TextField(
                    controller: widget.endDateController,
                  ),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: TextField(
                    controller: widget.endTimeController,
                  ),
                ),
              ],
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.calendar_today),
                  onPressed: () async {
                    DateTime initialDate =
                        widget.initialDate.isBefore(widget.firstDate)
                            ? widget.firstDate
                            : widget.initialDate;
                    final selectedDate = await showDatePicker(
                      context: context,
                      initialDate: initialDate,
                      firstDate: widget.firstDate,
                      lastDate: widget.lastDate,
                    );
                    if (selectedDate != null) {
                      setState(() {
                        endDate = selectedDate;
                        widget.endDateController.text =
                            DateFormat('MMMM dd, yyyy').format(endDate!);
                      });
                    }
                  },
                ),
                IconButton(
                  icon: Icon(Icons.access_time),
                  onPressed: () async {
                    final selectedTime = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(),
                    );

                    if (selectedTime != null) {
                      setState(() {
                        endTime = selectedTime;
                        final now = DateTime.now();
                        final dateTime = DateTime(now.year, now.month, now.day,
                                endTime!.hour, endTime!.minute)
                            .toUtc()
                            .add(Duration(hours: 7));
                        widget.endTimeController.text =
                            DateFormat('HH:mm:ss').format(dateTime);
                      });
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
