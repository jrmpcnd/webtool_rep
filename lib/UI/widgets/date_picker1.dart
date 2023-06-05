import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

class DatePickerScreen1 extends StatefulWidget {
  @override
  _DatePickerScreen1State createState() => _DatePickerScreen1State();
}

class _DatePickerScreen1State extends State<DatePickerScreen1> {
  DateTime? startDate;
  DateTime? endDate;
  TextEditingController _startDateController = TextEditingController();
  TextEditingController _endDateController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _startDateController = TextEditingController();
    _endDateController = TextEditingController();
  }

  Future<void> _selectStartDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: startDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: endDate ?? DateTime(2100),
      selectableDayPredicate: (DateTime day) =>
      endDate == null ||
          day.isBefore(endDate!) ||
          day.isAtSameMomentAs(endDate!),
    );

    if (picked != null && picked != startDate) {
      setState(() {
        startDate = picked;
        _startDateController.text = DateFormat('yyyy-MM-dd').format(startDate!);
        _updateRangeDuration();
      });
    }
  }

  Future<void> _selectEndDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: endDate ?? DateTime.now(),
      firstDate: startDate ?? DateTime(2000),
      lastDate: DateTime(2100),
      selectableDayPredicate: (DateTime day) =>
      startDate == null ||
          day.isAfter(startDate!) ||
          day.isAtSameMomentAs(startDate!),
    );

    if (picked != null && picked != endDate) {
      setState(() {
        endDate = picked;
        _endDateController.text = DateFormat('yyyy-MM-dd').format(endDate!);
        _updateRangeDuration();
      });
    }
  }

  void _searchRange() {
    if (startDate != null && endDate != null) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Selected Range'),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                    'Start Date: ${DateFormat('yyyy-MM-dd').format(startDate!)}'),
                SizedBox(height: 10),
                Text('End Date: ${DateFormat('yyyy-MM-dd').format(endDate!)}'),
                SizedBox(height: 10),
                Text('Duration: ${_getRangeDuration()} day(s)'),
                SizedBox(height: 10),
                Text('Selected Dates:'),
                SizedBox(height: 10),
                Column(
                  children: _buildSelectedDates(),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('OK'),
            ),
          ],
        ),
      );
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Error'),
          content: Text('Please select both start and end dates.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  String _getRangeDuration() {
    if (startDate != null && endDate != null) {
      final difference = endDate!.difference(startDate!).inDays;
      return difference.toString();
    }
    return '0';
  }

  void _updateRangeDuration() {
    if (startDate != null && endDate != null) {
      _endDateController.text = DateFormat('yyyy-MM-dd').format(endDate!);
    }
  }

  List<Widget> _buildSelectedDates() {
    List<Widget> dateWidgets = [];
    if (startDate != null && endDate != null) {
      DateTime currentDate = startDate!;

      while (currentDate.isBefore(endDate!) ||
          currentDate.isAtSameMomentAs(endDate!)) {
        dateWidgets.add(
          Text(
            DateFormat('yyyy-MM-dd').format(currentDate),
            style: TextStyle(fontSize: 16),
          ),
        );
        currentDate = currentDate.add(Duration(days: 1));
      }
    }

    return dateWidgets;
  }

  @override
  void dispose() {
    _startDateController.dispose();
    _endDateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          children: <Widget>[
            SizedBox(width: 20),
            SizedBox(
              height: 40.0,
              width: 150.0,
              child: TextFormField(
                controller: _startDateController,
                readOnly: true,
                decoration: InputDecoration(
                  hintText: 'Date Start',hintStyle: TextStyle(color: Colors.black),
                  suffixIcon: IconButton(
                    onPressed: () => _selectStartDate(context),
                    icon: Icon(Icons.calendar_today,color: Colors.black,),
                  ),
                ),
              ),
            ),
            SizedBox(width: 20),
            SizedBox(
              height: 40.0,
              width: 150.0,
              child: TextFormField(
                controller: _endDateController,
                readOnly: true,
                decoration: InputDecoration(
                  hintText: 'Date End',
                  hintStyle: TextStyle(color: Colors.black),
                  suffixIcon: IconButton(
                    onPressed: () => _selectEndDate(context),
                    icon: Icon(Icons.calendar_today,color: Colors.black,),
                  ),
                ),
              ),
            ),
            SizedBox(width: 20),
            SizedBox(height: 15,),
            Row(children: [
              Container(
                child: ElevatedButton(
                  onPressed: _searchRange,
                  child: Text('Filter Range'),
                ),
              ),
            ],),
            SizedBox(width: 40),
            if (startDate != null && endDate != null) SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}


