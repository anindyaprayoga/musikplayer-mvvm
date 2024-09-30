import 'package:get/get.dart';
import 'dart:io';

class ProfileViewModel extends GetxController {
  final email = 'soroushnorzyui@gmail.com'.obs;
  final username = 'Soroushnrz'.obs;
  final followers = 778.obs;
  final following = 243.obs;
  final Rx<File?> profileImage = Rx<File?>(null);

  void updateProfileImage(String path) {
    profileImage.value = File(path);
  }
}
