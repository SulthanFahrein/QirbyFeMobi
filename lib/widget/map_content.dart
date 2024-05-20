import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:test_ta_1/config/app_color.dart';
import 'package:test_ta_1/config/app_route.dart';
import 'package:test_ta_1/widget/property_card.dart';

class MapContent extends StatelessWidget {
  const MapContent({Key? key}) : super(key: key);

  void _showLocationDetails(BuildContext context, String title, int price, String imageUrl, int sqft, int bedrooms, int bathrooms, int garages, int floors, String location, String status) {
    showDialog(
      context: context,
      barrierColor: Colors.transparent,
      builder: (context) {
        return Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 70),
            child: GestureDetector(
              onTap: () {
                Navigator.pushReplacementNamed(context, AppRoute.detailpage);
              },
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: PropertyCard(
                  title: title,
                  price: price,
                  imageUrl: imageUrl,
                  sqft: sqft,
                  bedrooms: bedrooms,
                  bathrooms: bathrooms,
                  garages: garages,
                  floors: floors,
                  location: location,
                  status: status,
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;

    return SizedBox(
      height: screenHeight,
      child: FlutterMap(
        options: const MapOptions(
          initialCenter: LatLng(-6.97426, 107.6337),
          initialZoom: 11,
          interactionOptions: InteractionOptions(
            flags: ~InteractiveFlag.doubleTapZoom,
          ),
        ),
        children: [
          TileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            userAgentPackageName: 'dev.fleaflet.flutter_map.example',
          ),
          MarkerLayer(
            markers: [
              Marker(
                point: const LatLng(-6.89426, 107.5337),
                width: 60,
                height: 60,
                alignment: Alignment.centerLeft,
                child: GestureDetector(
                  onTap: () {
                    _showLocationDetails(
                      context,
                      'First Location',
                      10000000,
                      'https://static.wixstatic.com/media/a7d241_3670738216284b54a8bfbc59eb3abb49~mv2_d_2817_1891_s_2.jpg/v1/fill/w_980,h_658,al_c,q_85,usm_0.66_1.00_0.01,enc_auto/a7d241_3670738216284b54a8bfbc59eb3abb49~mv2_d_2817_1891_s_2.jpg',
                      250,
                      3,
                      2,
                      1,
                      2,
                      'Bandung', 
                      'For Sale', 
                    );
                  },
                  child: const Icon(
                    Icons.location_pin,
                    size: 50,
                    color: AppColor.primary,
                  ),
                ),
              ),
              Marker(
                point: const LatLng(-6.9202, 107.6233),
                width: 60,
                height: 60,
                alignment: Alignment.centerLeft,
                child: GestureDetector(
                  onTap: () {
                    _showLocationDetails(
                      context,
                      'Second Location',
                      12100000,
                      'https://asset.kompas.com/crops/2dxHFNYo1p3WEonRM9VnEBM6w8c=/0x0:780x520/780x390/data/photo/2023/08/21/64e2ec07a40f4.jpg',
                      300,
                      4,
                      3,
                      2,
                      3,
                      'Jakarta', 
                      'Sold', 
                    );
                  },
                  child: const Icon(
                    Icons.location_pin,
                    size: 50,
                    color: AppColor.primary,
                  ),
                ),
              ),
              Marker(
                point: const LatLng(-6.9802, 107.6433),
                width: 60,
                height: 60,
                alignment: Alignment.centerLeft,
                child: GestureDetector(
                  onTap: () {
                    _showLocationDetails(
                      context,
                      'Third Location',
                      30000000,
                      'https://lifetimedesign.co/cdn/shop/articles/ARSITEKTUR_D22_072_WISNU_DEPOK_FACADE_DITO_221222_MALAM_V2_1.jpg?v=1697529699',
                      400,
                      5,
                      4,
                      3,
                      4,
                      'Surabaya', 
                      'Pending',
                    );
                  },
                  child: const Icon(
                    Icons.location_pin,
                    size: 50,
                    color: AppColor.primary,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
