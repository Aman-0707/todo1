import 'package:flutter/material.dart';
import 'package:todonofirebase/button.dart';

class dailogBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;

  dailogBox(
      {super.key,
      required this.controller,
      required this.onSave,
      required this.onCancel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.purpleAccent,
      content: SizedBox(
        height: 150,
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          TextField(
            controller: controller,
            decoration: const InputDecoration(
                border: OutlineInputBorder(), hintText: 'Add a new Tasks'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              MyButton(text: 'Save', onpressed: onSave),
              const SizedBox(
                width: 10,
              ),
              MyButton(text: 'Cancel', onpressed: onCancel),
            ],
          ),
        ]),
      ),
    );
  }
}










