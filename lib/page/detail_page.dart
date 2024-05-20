import 'package:flutter/material.dart';
import 'package:test_ta_1/config/app_asset.dart';
import 'package:test_ta_1/config/app_route.dart';
import 'package:test_ta_1/widget/button_custom.dart';
import 'package:test_ta_1/widget/map_content.dart';

class DetailPage extends StatefulWidget {
  DetailPage({Key? key}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  bool isFavorite = false; 

  final List<Map<String, dynamic>> facilities = [
    {
      'icon': AppAsset.iconHome,
      'label': 'sqft',
    },
    {
      'icon': AppAsset.iconGarage,
      'label': 'Garage',
    },
    {
      'icon': AppAsset.iconBed,
      'label': 'Bed',
    },
    {
      'icon': AppAsset.iconBath,
      'label': 'Bath',
    },
    {
      'icon': AppAsset.iconFloor,
      'label': 'Floor',
    }
  ];

  final List<String> imageAssets = [
    AppAsset.profile,
    AppAsset.profile,
    AppAsset.profile,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        title: const Text(
          "Property Detail",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      bottomNavigationBar: buildBottomNavigationBar(context),
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
        ),
        child: ListView(
          children: [
            const SizedBox(height: 24),
            images(),
            const SizedBox(height: 16),
            statHarga(context),
            const SizedBox(height: 5),
            nameLok(context),
            const SizedBox(height: 25),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "Dipersembahkan untuk Anda adalah rumah mewah yang terletak di lingkungan yang tenang dan penuh ketenangan. Properti ini menawarkan gaya hidup modern dengan sentuhan elegan yang memikat. Dengan luas bangunan sekitar 250 meter persegi, rumah ini menawarkan ruang yang cukup untuk memenuhi kebutuhan Anda dan keluarga.",
                textAlign: TextAlign.justify,
              ),
            ),
            const SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Facilities',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
            gridfacilities(),
            const SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Maps',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
            const SizedBox(height: 10),
            maps(),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Padding maps() {
  return Padding(
    padding: const EdgeInsets.only(right: 20, left: 20),
    child: Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 0, 0, 0),
        border: Border.all(color: const Color.fromARGB(255, 0, 0, 0)),
      ),
      height: 250,
      child: const MapContent(),
    ),
  );
}

  Widget buildBottomNavigationBar(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(color: Colors.grey[100]!, width: 1.5),
        ),
      ),
      height: 80,
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
      child: ButtonCustom(
        label: 'Set Schedule',
        isExpand: true,
        onTap: () {
          Navigator.pushNamed(context, AppRoute.schedule);
        },
      ),
    );
  }

  GridView gridfacilities() {
    return GridView.builder(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
      itemCount: facilities.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 5,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
            border: Border.all(color: const Color.fromARGB(255, 162, 162, 162)),
            borderRadius: BorderRadius.circular(24),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ImageIcon(AssetImage(facilities[index]['icon'])),
              const SizedBox(height: 4),
              Text(
                facilities[index]['label'],
                style: const TextStyle(fontSize: 13),
              ),
            ],
          ),
        );
      },
    );
  }

  Padding statHarga(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Status", 
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5),
                Text(
                  "Harga", 
                  style: Theme.of(context)
                      .textTheme
                      .headline6!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 5), 
            child: InkWell(
              onTap: () {
                // Ubah status ikon saat diklik
                setState(() {
                  isFavorite = !isFavorite;
                });
              },
              child: Icon(
                Icons.favorite,
                size: 45, 
                color: isFavorite
                    ? Theme.of(context).primaryColor
                    : Colors.grey, 
              ),
            ),
          ),
        ],
      ),
    );
  }

  Padding nameLok(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Nama Properti", 
            style: Theme.of(context)
                .textTheme
                .headline6!
                .copyWith(fontWeight: FontWeight.normal),
          ),
          const SizedBox(height: 3),
          Text(
            "Lokasi", 
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(fontWeight: FontWeight.normal),
          ),
        ],
      ),
    );
  }

  SizedBox images() {
    return SizedBox(
      height: 180,
      child: ListView.builder(
        itemCount: imageAssets.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.fromLTRB(
              index == 0 ? 16 : 8,
              0,
              index == imageAssets.length - 1 ? 16 : 8,
              0,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                imageAssets[index],
                fit: BoxFit.cover,
                height: 180,
                width: 240,
              ),
            ),
          );
        },
      ),
    );
  }
}
