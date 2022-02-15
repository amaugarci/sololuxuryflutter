// import 'package:geolocator/geolocator.dart';

// class CommonRepository {
//   static Future<Position> getCurrentLocation() async {
//     // ignore: deprecated_member_use
//     LocationPermission permission = await Geolocator.checkPermission();
//     if (permission == LocationPermission.always ||
//         permission == LocationPermission.whileInUse) {
//       Position position =
//           // ignore: deprecated_member_use
//           await Geolocator.getCurrentPosition(
//               desiredAccuracy: LocationAccuracy.high);
//       return position;
//     } else {
//       // ignore: deprecated_member_use
//       LocationPermission permission = await Geolocator.requestPermission();
//       if (permission == LocationPermission.always ||
//           permission == LocationPermission.whileInUse) {
//         Position position =
//             // ignore: deprecated_member_use
//             await Geolocator.getCurrentPosition(
//                 desiredAccuracy: LocationAccuracy.high);
//         return position;
//       } else {
//         return Future.error('Location permissions are denied');
//       }
//     }
//   }

//   static Future<Position> getStoragePermission() async {
//     // ignore: deprecated_member_use
//     LocationPermission permission = await Geolocator.checkPermission();
//     if (permission == LocationPermission.always ||
//         permission == LocationPermission.whileInUse) {
//       Position position =
//           // ignore: deprecated_member_use
//           await Geolocator.getCurrentPosition(
//               desiredAccuracy: LocationAccuracy.high);
//       return position;
//     } else {
//       // ignore: deprecated_member_use
//       LocationPermission permission = await Geolocator.requestPermission();
//       if (permission == LocationPermission.always ||
//           permission == LocationPermission.whileInUse) {
//         Position position =
//             // ignore: deprecated_member_use
//             await Geolocator.getCurrentPosition(
//                 desiredAccuracy: LocationAccuracy.high);
//         return position;
//       } else {
//         return Future.error('Location permissions are denied');
//       }
//     }
//   }
// }
