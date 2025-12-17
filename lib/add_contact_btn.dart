import 'package:contact/add_contact_content.dart';
import 'package:contact/const.dart';
import 'package:flutter/material.dart';

class AddContactBtn extends StatelessWidget {
  const AddContactBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        showModalBottomSheet(
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          context: context,
          builder: (context) {
            return AddContactContent();
          },
        );
      },
      backgroundColor: gold,
      child: Icon(Icons.add, size: 25, color: Colors.black),
    );
  }
}
