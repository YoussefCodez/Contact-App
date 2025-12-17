import 'package:contact/add_contact_btn.dart';
import 'package:contact/const.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class EmptyHome extends StatelessWidget {
  const EmptyHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 3,
              child: SizedBox(
                width: double.infinity,
                child: Lottie.asset("assets/animation/empty_list_2.json", animate: false,),
              ),
            ),
            Expanded(
              flex: 2,
              child: Text(
                "There is No Contacts Added Here",
                style: TextStyle(
                  color: gold,
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
        Positioned(
          right: 16,
          bottom: 16,
          child: AddContactBtn()
        ),
      ],
    );
  }
}