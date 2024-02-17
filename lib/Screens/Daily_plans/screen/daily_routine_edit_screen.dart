import 'package:flutter/material.dart';

class DailyRoutineEditScreen extends StatefulWidget {
  const DailyRoutineEditScreen({Key? key}) : super(key: key);

  @override
  State<DailyRoutineEditScreen> createState() => _DailyRoutineEditScreenState();
}

class _DailyRoutineEditScreenState extends State<DailyRoutineEditScreen> {
  TimeOfDay selectedWakeUpTime = TimeOfDay.now();
  TimeOfDay selectedWorkoutTime = TimeOfDay.now();
  TimeOfDay selectedSleepTime = TimeOfDay.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFE401),
        title: const Text(
          'EDIT',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _buildTimePickerButton(
                  text: 'SET WAKE UP TIME',
                  selectedTime: selectedWakeUpTime,
                  onPressed: () => _showTimePicker((time) {
                    setState(() {
                      selectedWakeUpTime = time;
                    });
                  }),
                ),
                _buildTimeDisplay(selectedTime: selectedWakeUpTime),
                SizedBox(height: 60),
                _buildTimePickerButton(
                  text: 'SET WORKOUT TIME',
                  selectedTime: selectedWorkoutTime,
                  onPressed: () => _showTimePicker((time) {
                    setState(() {
                      selectedWorkoutTime = time;
                    });
                  }),
                ),
                _buildTimeDisplay(selectedTime: selectedWorkoutTime),
                SizedBox(height: 60),
                _buildTimePickerButton(
                  text: 'SET SLEEP TIME',
                  selectedTime: selectedSleepTime,
                  onPressed: () => _showTimePicker((time) {
                    setState(() {
                      selectedSleepTime = time;
                    });
                  }),
                ),
                _buildTimeDisplay(selectedTime: selectedSleepTime),
                SizedBox(height: 50),
                ElevatedButton(
                  onPressed: _saveRoutine,
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(const Color(0xFFFFE401)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                  child: const Text(
                    'SAVE',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTimePickerButton({
    required String text,
    required TimeOfDay selectedTime,
    required VoidCallback onPressed,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          text,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 8),
        ElevatedButton(
          onPressed: onPressed,
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(const Color(0xFFFFE401)),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
          child: const Text(
            'SET',
            style: TextStyle(color: Colors.black),
          ),
        ),
      ],
    );
  }

  Widget _buildTimeDisplay({required TimeOfDay selectedTime}) {
    return Container(
      height: 60,
      width: 200,
      decoration: BoxDecoration(border: Border.all()),
      child: Center(
        child: Text(
          _formatTime(selectedTime),
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }

  String _formatTime(TimeOfDay timeOfDay) {
    final hours = timeOfDay.hourOfPeriod;
    final minutes = timeOfDay.minute.toString().padLeft(2, '0');
    final period = timeOfDay.period == DayPeriod.am ? 'AM' : 'PM';
    return '$hours:$minutes $period';
  }

  Future<void> _showTimePicker(Function(TimeOfDay) onTimeSelected) async {
    final TimeOfDay? timeOfDay = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      initialEntryMode: TimePickerEntryMode.dial,
    );
    if (timeOfDay != null) {
      onTimeSelected(timeOfDay);
    }
  }

  void _saveRoutine() {
    Navigator.of(context).pop({
      'wakeUpTime': _formatTime(selectedWakeUpTime),
      'workoutTime': _formatTime(selectedWorkoutTime),
      'sleepTime': _formatTime(selectedSleepTime),
    });
  }
}
