import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:test_ta_1/config/app_asset.dart';
import 'package:test_ta_1/config/app_color.dart';
import 'package:test_ta_1/config/app_format.dart';
import 'package:test_ta_1/config/app_route.dart';


class ScheduleList {
  final String name;
  final DateTime date;
  final String status;

  ScheduleList({
    required this.name,
    required this.date,
    required this.status,
  });
}

class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  
  // Inisialisasi data jadwal
  final List<dynamic> _elements = [
    ScheduleList(
      name: 'Nama Properti',
      date: DateTime.now().subtract(const Duration(days: 2)),
      status: 'Completed',
    ),
    ScheduleList(
      name: 'Nama Properti',
      date: DateTime.now().subtract(const Duration(days: 1)),
      status: 'Pending',
    ),
    ScheduleList(
      name: 'Nama Properti',
      date: DateTime.now(),
      status: 'Completed',
    ),
    ScheduleList(
      name: 'Nama Properti',
      date: DateTime.now().subtract(const Duration(days: 4)),
      status: 'Completed',
    ),
    ScheduleList(
      name: 'John Doe',
      date: DateTime.now().subtract(const Duration(days: 5)),
      status: 'Completed',
    ),
  ]; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        title: const Text(
          "Schedule History",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          const SizedBox(height: 24),
          GroupedListView<dynamic, DateTime>(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            elements: _elements,
            groupBy: (schedule) => schedule.date,
            groupSeparatorBuilder: (DateTime groupByValue) {
              String date = DateFormat('yyyy-MM-dd').format(DateTime.now()) ==
                      DateFormat('yyyy-MM-dd').format(groupByValue)
                  ? 'Today New'
                  : AppFormat.date(groupByValue.toString());
              return Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(
                  date,
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              );
            },
            itemBuilder: (context, schedule) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, AppRoute.detailschedule,
                        arguments: schedule);
                  },
                  child: item(context, schedule), 
                ),
              );
            },
            itemComparator: (item1, item2) =>
                  item1.date.compareTo(item2.date),
            order: GroupedListOrder.DESC,
          ),
        ],
      ),
    );
  }

  Widget item(BuildContext context, dynamic schedule) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              AppAsset.profile,
              width: 70,
              height: 50,
              fit: BoxFit.fitWidth,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  schedule.name, 
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                Text(
                  DateFormat('dd MMMM yyyy').format(schedule.date), 
                  style: const TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          Container(
            decoration: BoxDecoration(
              color: AppColor.accept,
              borderRadius: BorderRadius.circular(30),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
            child: Text(
              schedule.status, 
              style: const TextStyle(color: Colors.white, fontSize: 12),
            ),
          )
        ],
      ),
    );
  }

}
