import 'package:flutter/material.dart';
import 'package:test_ta_1/config/app_asset.dart';

class DetailSchedule extends StatelessWidget {
  DetailSchedule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        title: const Text(
          "Detail Booking",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          header(context),
          const SizedBox(height: 16),
          scheduleDetail(context),
          const SizedBox(height: 20),
        ],
      ),
    );
  }



  Container scheduleDetail(BuildContext context) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
    ),
    padding: const EdgeInsets.all(16),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Detail',
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        itemscheduleDetail(
          context,
          'Name',
          'Wawan sutajo',
        ),
        const SizedBox(height: 16),
        itemscheduleDetail(
          context,
          'Phone',
          '081234567890',
        ),
        const SizedBox(height: 16),
        itemscheduleDetail(
          context,
          'Date',
          '20 Mei 2024',
        ),
        const SizedBox(height: 16),
        itemscheduleDetail(
          context,
          'Time',
          '08:00 WIB',
        ),
        const SizedBox(height: 16),
        itemscheduleDetail(
          context,
          'PIC',
          'Andhika Premesti',
        ),
        const SizedBox(height: 16),
        itemscheduleDetail(
          context,
          'PIC Phone',
          '080987655432',
        ),
        const SizedBox(height: 16),
        itemscheduleDetail(
          context,
          'Status',
          'Accept',
        ),
        const SizedBox(height: 50),
        Text(
          'Note :',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 8),
        Text(
          'Admin akan mengabari bapak secepatnya, di mohon untuk WA nya selalu Aktif',
          style: Theme.of(context).textTheme.subtitle1,
        ),
        const SizedBox(height: 8),
      ],
    ),
  );
}


  Row itemscheduleDetail(BuildContext context, String title, String data) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        Text(
          data,
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(fontWeight: FontWeight.bold),
        )
      ],
    );
  }

  Container header(BuildContext context) {
    return Container(
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
              fit: BoxFit.cover,
              height: 70,
              width: 90,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Nama properti',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                const Text(
                  'Lokasi Properti',
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
