import 'package:flutter/material.dart';
import 'package:home_workout/database/functions/db_dailyRoutine_function.dart';
import 'package:home_workout/database/modelDatabase/database_model.dart';

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
          child: Center(
        child: Padding(
          padding: const EdgeInsets.all(50.0),
          child: Column(
            children: [
              const Text(
                'SET WAKE UP TIME',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 29,
              ),
              ElevatedButton(
                onPressed: () async {
                  final TimeOfDay? timeOfDay = await showTimePicker(
                    context: context,
                    initialTime: selectedWakeUpTime,
                    initialEntryMode: TimePickerEntryMode.dial,
                  );
                  if (timeOfDay != null) {
                    setState(() {
                      selectedWakeUpTime = timeOfDay;
                    });
                  }
                },
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(const Color(0xFFFFE401)),
                ),
                child: const Text('SET'),
              ),
              const SizedBox(
                height: 29,
              ),
              Container(
                width: 200,
                height: 50,
                decoration: BoxDecoration(
                  border: Border.all(),
                ),
                child: Center(
                    child: Text(
                        '${selectedWakeUpTime.hourOfPeriod > 12 ? selectedWakeUpTime.hourOfPeriod - 12 : selectedWakeUpTime.hourOfPeriod}:${selectedWakeUpTime.minute}${selectedWakeUpTime.period.index == 0 ? 'AM' : 'PM'}')),
              ),
              const SizedBox(
                height: 50,
              ),
              const Text(
                'SET WORK OUT TIME',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 29,
              ),
              ElevatedButton(
                onPressed: () async {
                  final TimeOfDay? timeOfDay = await showTimePicker(
                    context: context,
                    initialTime: selectedWorkoutTime,
                    initialEntryMode: TimePickerEntryMode.dial,
                  );
                  if (timeOfDay != null) {
                    setState(() {
                      selectedWorkoutTime = timeOfDay;
                    });
                  }
                },
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(const Color(0xFFFFE401)),
                ),
                child: const Text('SET'),
              ),
              const SizedBox(
                height: 29,
              ),
              Container(
                width: 200,
                height: 50,
                decoration: BoxDecoration(
                  border: Border.all(),
                ),
                child: Center(
                    child: Text(
                        '${selectedWorkoutTime.hourOfPeriod > 12 ? selectedWorkoutTime.hourOfPeriod - 12 : selectedWorkoutTime.hourOfPeriod}:${selectedWorkoutTime.minute}${selectedWorkoutTime.period.index == 0 ? 'AM' : 'PM'}')),
              ),
              const SizedBox(
                height: 50,
              ),
              const Text(
                'SET SLEEP TIME',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 29,
              ),
              ElevatedButton(
                onPressed: () async {
                  final TimeOfDay? timeOfDay = await showTimePicker(
                    context: context,
                    initialTime: selectedSleepTime,
                    initialEntryMode: TimePickerEntryMode.dial,
                  );
                  if (timeOfDay != null) {
                    setState(() {
                      selectedSleepTime = timeOfDay;
                    });
                  }
                },
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(const Color(0xFFFFE401)),
                ),
                child: const Text('SET'),
              ),
              const SizedBox(
                height: 29,
              ),
              Container(
                width: 200,
                height: 50,
                decoration: BoxDecoration(
                  border: Border.all(),
                ),
                child: Center(
                    child: Text(
                        '${selectedSleepTime.hourOfPeriod > 12 ? selectedSleepTime.hourOfPeriod - 12 : selectedSleepTime.hourOfPeriod}:${selectedSleepTime.minute}${selectedSleepTime.period.index == 0 ? 'AM' : 'PM'}')),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  final wakeUp =
                      '${selectedWakeUpTime.hourOfPeriod > 12 ? selectedWakeUpTime.hourOfPeriod - 12 : selectedWakeUpTime.hourOfPeriod}:${selectedWakeUpTime.minute}${selectedWakeUpTime.period.index == 0 ? 'AM' : 'PM'}';
                  final workoutTime =
                      '${selectedWorkoutTime.hourOfPeriod > 12 ? selectedWorkoutTime.hourOfPeriod - 12 : selectedWorkoutTime.hourOfPeriod}:${selectedWorkoutTime.minute}${selectedWorkoutTime.period.index == 0 ? 'AM' : 'PM'}';
                  final sleep =
                      '${selectedSleepTime.hourOfPeriod > 12 ? selectedSleepTime.hourOfPeriod - 12 : selectedSleepTime.hourOfPeriod}:${selectedSleepTime.minute}${selectedSleepTime.period.index == 0 ? 'AM' : 'PM'}';

                  final dailyRoutine = DailyRoutineModel(
                      wakeUp: wakeUp.toString(),
                      workoutTime: workoutTime.toString(),
                      sleep: sleep.toString());
                  adddailyRoutineDetails(dailyRoutine);
                },
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(const Color(0xFFFFE401)),
                ),
                child: const Text('SAVE'),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
