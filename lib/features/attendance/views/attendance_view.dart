import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AttendanceView extends StatefulWidget {
  const AttendanceView({Key? key}) : super(key: key);

  @override
  State<AttendanceView> createState() => _AttendanceViewState();
}

class _AttendanceViewState extends State<AttendanceView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Attendance"),
      ),
      body: Column(
        children: [
          ElevatedButton(
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8),
                    )),
                    builder: (context) {
                      return SizedBox(
                        height: 220,
                        child: Column(
                          children: [
                            ListTile(
                              onTap: () async {
                                final ImagePicker _picker = ImagePicker();
                                final image = await _picker.pickImage(
                                    source: ImageSource.camera);
                                print(image?.path);
                              },
                              leading: const Icon(Icons.camera),
                              title: const Text("Camera"),
                            ),
                            ListTile(
                              onTap: () {
                                final ImagePicker _picker = ImagePicker();
                                _picker.pickImage(source: ImageSource.gallery);
                                log("Gallery Tapped");
                              },
                              leading: const Icon(Icons.photo),
                              title: const Text("Gallery"),
                            )
                          ],
                        ),
                      );
                    });
              },
              child: const Text("Pick an image"))
        ],
      ),
    );
  }
}
