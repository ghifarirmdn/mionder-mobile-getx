import 'package:flutter/material.dart';
import 'package:mionder_mobile_get/app/shared/import/main_import.dart';

import '../controllers/profile_controller.dart';

class EditProfileView extends GetView<ProfileController> {
  const EditProfileView({super.key});
  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        title: const Text("Edit Profile"),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        children: [
          Column(
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () async {
                      // await pickImage();
                    },
                    // child: CircleAvatar(
                    //   radius: 22,
                    //   backgroundImage: AssetImage("assets/images/alya.png"),
                    // ),
                    child: const Icon(Icons.person),
                  ),
                  const SizedBox(width: 20),
                  const Text(
                    "Put your best profile pic!",
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              TextFormField(
                // initialValue: user.displayName,
                controller: nameController,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Enter your name',
                ),
              ),
              const SizedBox(height: 10),
              GestureDetector(
                onTap: () => {controller.updateName(nameController.text)},
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xff004AAD),
                  ),
                  child: const Text(
                    "Save",
                    style: TextStyle(
                      color: Color.fromARGB(255, 255, 250, 176),
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
