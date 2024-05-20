// import 'package:flutter/material.dart';
// import 'package:test_ta_1/config/app_asset.dart';
// import 'package:test_ta_1/widget/button_custom.dart';

// class CustomDialog {
//   static Future<void> showLogoutDialog(BuildContext context) async {
//     return showDialog<void>(
//       context: context,
//       builder: (BuildContext context) => AlertDialog(
//         content: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Image.asset(
//               AppAsset.alert,
//               width: 180,
//               fit: BoxFit.fitWidth,
//             ),
//             const SizedBox(height: 8),
//             Text(
//               'Do you want to\nlog out',
//               textAlign: TextAlign.center,
//               style: Theme.of(context).textTheme.headlineSmall!.copyWith(
//                 color: const Color.fromARGB(255, 0, 0, 0),
//                 fontWeight: FontWeight.w900,
//               ),
//             ),
//           ],
//         ),
//         backgroundColor: Colors.white,
//         actions: <Widget>[
//           ButtonCustom(
//             label: 'Yes',
//             hasShadow: false,
//             onTap: () {
//               Navigator.pushNamed(context, '/signin');
//             },
//           ),
//           TextButton(
//             onPressed: () {
//               Navigator.pop(context);
//             },
//             child: Container(
//               alignment: Alignment.center,
//               width: double.infinity,
//               child: Text(
//                 'No',
//                 style: Theme.of(context).textTheme.bodyLarge!.copyWith(
//                   color: const Color.fromARGB(255, 0, 0, 0),
//                   fontWeight: FontWeight.w900,
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }