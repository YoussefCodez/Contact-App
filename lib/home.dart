import 'package:contact/const.dart';
import 'package:contact/contact_home.dart';
import 'package:contact/data.dart';
import 'package:contact/empty_home.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkBlue,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: Padding(
          padding: EdgeInsetsGeometry.only(left: 26),
          child: Image.asset("assets/images/logo.png"),
        ),
        leadingWidth: 130,
      ),
      body: ValueListenableBuilder<List<Map<String, dynamic>>>(
        valueListenable: contacts,
        builder: (context, contacts, _) {
          return contacts.isEmpty ? EmptyHome() : ContactHome(contacts);
        },
      ),
    );
  }
}
