import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../viewmodel/profile_viewmodel.dart';
import 'package:image_picker/image_picker.dart';

class ProfileView extends StatelessWidget {
  final ProfileViewModel viewModel = Get.put(ProfileViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Profile'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Handle back navigation
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {
              // Handle more options
            },
          ),
        ],
      ),
      body: Obx(() => Padding(
            padding: const EdgeInsets.only(top: 24),
            child: ListView(
              shrinkWrap: true,
              children: [
                GestureDetector(
                  onTap: () => _pickImage(),
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: viewModel.profileImage.value != null
                        ? FileImage(viewModel.profileImage.value!)
                        : null,
                    child: viewModel.profileImage.value == null
                        ? Icon(Icons.person, size: 50)
                        : null,
                  ),
                ),
                SizedBox(height: 20),
                Center(
                  // Add this line
                  child: Text(
                    viewModel.email.value,
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                SizedBox(height: 10),
                Center(
                  // Add this line
                  child: Text(
                    viewModel.username.value,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Center(
                          // Add this line
                          child: Text(
                            viewModel.followers.value.toString(),
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Center(
                          // Add this line
                          child: Text('Followers'),
                        ),
                      ],
                    ),
                    SizedBox(width: 40),
                    Column(
                      children: [
                        Center(
                          // Add this line
                          child: Text(
                            viewModel.following.value.toString(),
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Center(
                          // Add this line
                          child: Text('Following'),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          )),
    );
  }

  Future<void> _pickImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      viewModel.updateProfileImage(image.path);
    }
  }
}
