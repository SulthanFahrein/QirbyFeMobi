import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:test_ta_1/config/app_asset.dart';
import 'package:test_ta_1/config/app_color.dart';
import 'package:test_ta_1/config/app_route.dart';
import 'package:test_ta_1/widget/button_custom.dart';

class EditProfile extends StatelessWidget {
  EditProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        title: const Text(
          "Edit Profile",
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
              editField(context),
              const SizedBox(height: 50),
              buttonEditPro(context),
            ],
          ),
        ],
      ),
    );
  }

  SizedBox buttonEditPro(BuildContext context) {
    return SizedBox(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: ButtonCustom(
                  label: 'Save',
                  isExpand: true,
                  onTap: (){
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
                                      textAlign: TextAlign.center, 
                                      style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                                        color: const Color.fromARGB(255, 0, 0, 0),
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
                                  ],
                                ),
                                backgroundColor: Colors.white,
                                actions: <Widget>[
                                  ButtonCustom(
                                    label: 'Yes',
                                    hasShadow: false,
                                    onTap: () {
                                      Navigator.pushNamed(context, AppRoute.profile);
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
              ),
            );
  }

  SizedBox editField(BuildContext context) {
    return SizedBox(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  children: [
                    TextFormField(
                      validator: (value) => value!.isEmpty ? "Don't leave empty" : null,
                      decoration: InputDecoration(
                        isDense: true,
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                        hintText: ' Name',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: const BorderSide(color: AppColor.secondary),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      validator: (value) => value!.isEmpty ? "Don't leave empty" : null,
                      decoration: InputDecoration(
                        isDense: true,
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                        hintText: ' Phone',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: const BorderSide(color: AppColor.secondary),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      validator: (value) => value!.isEmpty ? "Don't leave empty" : null,
                      decoration: InputDecoration(
                        isDense: true,
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                        hintText: ' Email',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: const BorderSide(color: AppColor.secondary),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    const SizedBox(height: 50),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, AppRoute.changepass);
                      },
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Change Password',
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
  }

  Widget photoname(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: Column(
        children: [
          Center(
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(65),
                  child: Image.asset(
                    AppAsset.profile,
                    width: 130,
                    height: 130,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        width: 4,
                        color: Theme.of(context).scaffoldBackgroundColor,
                      ),
                      color: AppColor.primary,
                    ),
                    child: const Icon(
                      Icons.edit,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
