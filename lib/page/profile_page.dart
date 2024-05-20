import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:test_ta_1/config/app_asset.dart';
import 'package:test_ta_1/config/app_color.dart';
import 'package:test_ta_1/config/app_route.dart';
import 'package:test_ta_1/widget/button_custom.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        title: const Text(
          "Profile",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.only(top: 20),
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              photoname(context),
              button(context),
              listviewtrinity(context),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: const Color.fromARGB(255, 255, 255, 255)),
                ),
                width: double.infinity,
                height: 200,
              ),
            ],
          )
        ],
      ),
    );
  }

  Container listviewtrinity(BuildContext context) {
    return Container(
              color: AppColor.netrall,
              padding: const EdgeInsets.all(15),
              child: ListView(
                shrinkWrap: true, // Use this to wrap the ListView content
                physics: NeverScrollableScrollPhysics(), // Disable ListView scrolling
                children: <Widget>[
                  ListTile(
                    leading: Material(
                      color: AppColor.primary,
                      borderRadius: BorderRadius.circular(45),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(45),
                        child: const SizedBox(
                          height: 45,
                          width: 45,
                          child: Center(
                            child: Icon(
                              Icons.settings,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    title: const Text('Setting'),
                    onTap: () {
                  
                    },
                  ),
                  const SizedBox(height: 10),
                  ListTile(
                    leading: Material(
                      color: AppColor.primary,
                      borderRadius: BorderRadius.circular(45),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(45),
                        child: const SizedBox(
                          height: 45,
                          width: 45,
                          child: Center(
                            child: Icon(
                              Icons.book,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    title: const Text('Information'),
                    onTap: () {
                      
                    },
                  ),
                  const SizedBox(height: 10),
                  ListTile(
                    leading: Material(
                      color: AppColor.alert,
                      borderRadius: BorderRadius.circular(45),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(45),
                        child: const SizedBox(
                          height: 45,
                          width: 45,
                          child: Center(
                            child: Icon(
                              Icons.logout,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    title: const Text('Logout'),
                    onTap: () {
                          showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              content: Column(
                                mainAxisSize: MainAxisSize.min, 
                                children: [
                                  Image.asset(
                                    AppAsset.alert,
                                    width: 180,
                                    fit: BoxFit.fitWidth,
                                  ),
                                  const SizedBox(height: 8), 
                                  Text(
                                    'Do you want to\nlog out',
                                    textAlign: TextAlign.center, // Posisikan teks di tengah
                                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                                      color: const Color.fromARGB(255, 0, 0, 0),
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                ],
                              ),
                              backgroundColor: Colors.white, // Menjadikan latar belakang putih
                              actions: <Widget>[
                                ButtonCustom(
                                  label: 'Yes',
                                  hasShadow: false,
                                  onTap: () {
                                    Navigator.pushNamed(context, AppRoute.signin);
                                  },
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    width: double.infinity,
                                    child: Text(
                                      'No',
                                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                                        color: const Color.fromARGB(255, 0, 0, 0),
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                  ),
                ],
              ),
            );
  }

  Container button(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: const Color.fromARGB(255, 255, 255, 255)),
      ),
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ButtonCustom(
        label: 'Edit Profile',
        hasShadow: false,
        onTap: () {
          Navigator.pushNamed(context, AppRoute.editprofile);
        },
      ),
    );
  }

  Container photoname(context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: const Color.fromARGB(255, 255, 255, 255)),
      ),
      width: 1000,
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: Image.asset(
              AppAsset.profile,
              width: 130,
              fit: BoxFit.fitWidth,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            "Wawan Sutajo",
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
              color: const Color.fromARGB(255, 0, 0, 0),
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'mantapslurr@gmail.com',
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: const Color.fromARGB(255, 0, 0, 0),
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
