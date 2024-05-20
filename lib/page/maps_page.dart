import 'package:flutter/material.dart';
import 'package:test_ta_1/config/app_asset.dart';
import 'package:test_ta_1/config/app_color.dart';
import 'package:test_ta_1/config/app_route.dart';
import 'package:test_ta_1/widget/map_content.dart';

class MapsPage extends StatelessWidget {
  const MapsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const SizedBox(height: 24),
        searchField(context),
        const SizedBox(height: 20),
        const MapContent(),
      ],
    );
  }

  Widget searchField(context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Expanded(
            child: SizedBox(
              height: 45,
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none,
                        ),
                        hintText: 'Search by Name or City',
                        hintStyle: const TextStyle(color: Colors.grey, fontSize: 14),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Material(
                      color: AppColor.secondary,
                      borderRadius: BorderRadius.circular(45),
                      child: InkWell(
                        onTap: () {},
                        borderRadius: BorderRadius.circular(45),
                        child: const SizedBox(
                          height: 45,
                          width: 45,
                          child: Center(
                            child: ImageIcon(
                              AssetImage(AppAsset.iconSearch),
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(width: 8),
          Material(
            color: AppColor.primary,
            borderRadius: BorderRadius.circular(45),
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, AppRoute.filter);
              },
              borderRadius: BorderRadius.circular(45),
              child: const SizedBox(
                height: 45,
                width: 45,
                child: Center(
                  child: Icon(
                    Icons.filter_list,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          Material(
            color: AppColor.primary,
            borderRadius: BorderRadius.circular(45),
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, AppRoute.notif);
              },
              borderRadius: BorderRadius.circular(45),
              child: const SizedBox(
                height: 45,
                width: 45,
                child: Center(
                  child: Icon(
                    Icons.notifications,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}