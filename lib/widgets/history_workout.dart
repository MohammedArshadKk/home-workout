import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:home_workout/database/functions/db_functions.dart';
import 'package:home_workout/database/modelDatabase/database_model.dart';

class HistoryWorkout extends StatelessWidget {
  const HistoryWorkout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFE401),
        title: const Text('HistoryWorkout'),
      ),
      body: ValueListenableBuilder<List<HistoryModel>>(
        valueListenable: historyListNotifire,
        builder:
            (BuildContext ctx, List<HistoryModel> historyList, Widget? child) {
          final uniqueHistoryList = historyList.toSet().toList();
          if (uniqueHistoryList.isEmpty) {
            return Center(
              child: Text(
                'History not available',
                style: TextStyle(fontSize: screenWidth * 0.04),
              ),
            );
          }
          return ListView.separated(
            itemBuilder: (ctx, index) {
              final data = uniqueHistoryList[index];
              return ListTile(
                leading: Container(
                  height: screenWidth * 0.15,
                  width: screenWidth * 0.15,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(screenWidth * 0.02),
                    border: Border.all(color: Colors.blueGrey),
                  ),
                  child: CachedNetworkImage(
                    imageUrl: data.gif ?? '',
                    placeholder: (context, url) =>
                        Image.asset('assets/praceholder.jpg'),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                    fit: BoxFit.cover,
                  ),
                ),
                title: Text(
                  data.workOutName ?? '',
                  style: TextStyle(fontSize: screenWidth * 0.04),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data.dateAndTime,
                      style: TextStyle(fontSize: screenWidth * 0.035),
                    ),
                  ],
                ),
                trailing: IconButton(
                  onPressed: () {
                    if (data.id != null) {
                      deleteHistory(data.id!);
                      log("date time${DateTime.now()}");
                    }
                  },
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                ),
              );
            },
            separatorBuilder: (ctx, index) {
              return const Divider();
            },
            itemCount: uniqueHistoryList.length,
          );
        },
      ),
    );
  }
}
