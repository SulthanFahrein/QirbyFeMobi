import 'package:flutter/material.dart';
import 'package:test_ta_1/config/app_route.dart';
import 'package:test_ta_1/widget/property_card.dart';


class FavoritePage extends StatelessWidget {
  FavoritePage({Key? key}) : super(key: key);

  final List<Map<String, dynamic>> favoriteProperties = [
    {
      "title": "Beautiful House",
      "price": 250000,
      "imageUrl": "https://asset.kompas.com/crops/2dxHFNYo1p3WEonRM9VnEBM6w8c=/0x0:780x520/780x390/data/photo/2023/08/21/64e2ec07a40f4.jpg",
      "sqft": 2000,
      "bedrooms": 3,
      "bathrooms": 2,
      "garages": 2,
      "floors": 1,
      "location": "Bandung",
      "status": "For Sale",
    },
    {
      "title": "Luxury Apartment",
      "price": 500000,
      "imageUrl": "https://static.wixstatic.com/media/a7d241_3670738216284b54a8bfbc59eb3abb49~mv2_d_2817_1891_s_2.jpg/v1/fill/w_980,h_658,al_c,q_85,usm_0.66_1.00_0.01,enc_auto/a7d241_3670738216284b54a8bfbc59eb3abb49~mv2_d_2817_1891_s_2.jpg",
      "sqft": 1500,
      "bedrooms": 2,
      "bathrooms": 2,
      "garages": 1,
      "floors": 1,
      "location": "Jakarta",
      "status": "For Sale",
    },
    {
      "title": "Luxury Apartment",
      "price": 500000,
      "imageUrl": "https://lifetimedesign.co/cdn/shop/articles/ARSITEKTUR_D22_072_WISNU_DEPOK_FACADE_DITO_221222_MALAM_V2_1.jpg?v=1697529699",
      "sqft": 1500,
      "bedrooms": 2,
      "bathrooms": 2,
      "garages": 1,
      "floors": 1,
      "location": "Padang",
      "status": "For Sale",
    },
    
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        title: const Text(
          "Favorite",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: favoriteProperties.length,
        itemBuilder: (context, index) {
          final property = favoriteProperties[index];
          return GestureDetector(
            onTap: () {

              Navigator.pushNamed(context, AppRoute.detailpage);
            },
            child: PropertyCard(
              title: property["title"],
              price: property["price"],
              imageUrl: property["imageUrl"],
              sqft: property["sqft"],
              bedrooms: property["bedrooms"],
              bathrooms: property["bathrooms"],
              garages: property["garages"],
              floors: property["floors"],
              location: property["location"],
              status: property["status"],
            ),
          );
        },
      ),
    );
  }
}
