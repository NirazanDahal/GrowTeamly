import 'dart:developer';

import 'package:flutter/material.dart';

class AddDailyUpdateView extends StatefulWidget {
  const AddDailyUpdateView({Key? key}) : super(key: key);

  @override
  State<AddDailyUpdateView> createState() => _AddDailyUpdateViewState();
}

class _AddDailyUpdateViewState extends State<AddDailyUpdateView> {
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add daily update"),
      ),
      body: Column(
        children: [
          //This one's for date
          TextFormField(
            controller: _dateController,
          ),
          const SizedBox(
            height: 20,
          ),
          //This one's for title
          TextFormField(
            controller: _titleController,
          ),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            controller: _descriptionController,
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {
              log(_dateController.text +
                  _titleController.text +
                  _descriptionController.text);
            },
            child: const Text(
              "Print",
            ),
          )
        ],
      ),
    );
  }
}
