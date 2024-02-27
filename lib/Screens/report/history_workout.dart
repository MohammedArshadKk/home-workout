import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:home_workout/database/functions/db_functions.dart';
import 'package:home_workout/database/modelDatabase/database_model.dart';

class HistoryWorkout extends StatelessWidget {
  const HistoryWorkout({super.key});

  @override
  Widget build(BuildContext context) {
    getAllHistory();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffffe401),
        title: const Text('HistoryWorkout'),
      ),
      body: ValueListenableBuilder(
  valueListenable: historyListNotifire,
  builder: (BuildContext ctx, List<HistoryModel> historyList, Widget? child) {
    final uniqueHistoryList = historyList.toSet().toList();
    if (uniqueHistoryList.isEmpty) {
      return const Center(
        child: Text(
          'History not available',
          style: TextStyle(fontSize:  18),
        ),
      );
    }
    return ListView.separated(
      itemBuilder: (ctx, index) {
        final data = uniqueHistoryList[index];
        return ListTile(
          leading: Container(
            height:  60,
            width:  60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: Colors.blueGrey),
            ),
            child: CachedNetworkImage(
              imageUrl: data.gif,
              placeholder: (context, url) =>
                  Image.asset('assets/praceholder.jpg'),
              errorWidget: (context, url, error) =>
                  const Icon(Icons.error),
              fit: BoxFit.cover,
            ),
          ),
          title: Text(data.workOutName.toString()),
          subtitle: Text(data.duration.toString()),
          trailing: IconButton(
              onPressed: () {
                if (data.id != null) {
                  deleteHistory(data.id!);
                  print('fff${data.id}');
                }
                // print('${data.id}');
              },
              icon: const Icon(
                Icons.delete,
                color: Colors.red,
              )),
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
