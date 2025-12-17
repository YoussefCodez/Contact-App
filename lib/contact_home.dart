import 'package:contact/add_contact_btn.dart';
import 'package:contact/const.dart';
import 'package:contact/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

  class ContactHome extends StatefulWidget {
    ContactHome(this.contacts);
    List<Map<String, dynamic>> contacts;
    @override
    State<ContactHome> createState() => _ContactHomeState();
  }

  class _ContactHomeState extends State<ContactHome> {
    late double screenWidth = MediaQuery.of(context).size.width;
    @override
    Widget build(BuildContext context) {
      return Container(
        margin: EdgeInsets.only(
          left: screenWidth < 370 ? 8 : 25,
          right: screenWidth < 370 ? 8 : 25,
          top: 20,
        ),
        child: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  child: ValueListenableBuilder<List<Map<String, dynamic>>>(
                    valueListenable: contacts,
                    builder: (context, value, child) {
                      return GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: screenWidth < 370 ? 8 : 16,
                          childAspectRatio: 177 / 341,
                          mainAxisSpacing: screenWidth < 370 ? 8 : 16
                        ),
                        itemCount: contacts.value.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              Stack(
                                children: [
                                  Container(
                                    clipBehavior: Clip.antiAlias,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(8),
                                        topRight: Radius.circular(8)
                                      )
                                    ),
                                    width: double.infinity,
                                    child: Image.file(contacts.value[index]["image"] , fit: BoxFit.fill, height: 177,)
                                  ),
                                  Positioned(
                                    left: 7,
                                    bottom: 8,
                                    child: Container(
                                      padding: EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                        color: gold,
                                        borderRadius: BorderRadius.circular(8)
                                      ),
                                      child: Text(
                                        contacts.value[index]["name"],
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 15
                                ),
                                decoration: BoxDecoration(
                                  color: gold,
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(8),
                                    bottomRight: Radius.circular(8),
                                  )
                                ),
                                child: Column(
                                  children: [
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        SvgPicture.asset("assets/images/mail.svg"),
                                        SizedBox(width: 8,),
                                        Text(
                                          contacts.value[index]["email"],
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 10,
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(height: 10,),
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.call,
                                        ),
                                        SizedBox(width: 8,),
                                        Text(
                                          contacts.value[index]["number"],
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 10,
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(height: 10,),
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          contacts.value = List.from(contacts.value)..removeAt(index);
                                        });
                                      },
                                      child: Container(
                                        width: double.infinity,
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 8,
                                          vertical: 16
                                        ),
                                        decoration: BoxDecoration(
                                          color: Colors.red,
                                          borderRadius: BorderRadius.circular(16)
                                        ),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.delete,
                                              color: Colors.white,
                                            ),
                                            SizedBox(width: 2,),
                                            Text(
                                              "Delete",
                                              style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 10,
                                                color: Colors.white
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          );
                        },
                      );
                    }
                  ),
                ),
              ],
            ),

            Positioned(
              right: 16,
              bottom: contacts.value.length < 6 ? 80 : 16,
              child: InkWell(
                onTap: () {
                  setState(() {
                    contacts.value = List.from(contacts.value)..removeAt(contacts.value.length - 1);
                  });
                },
                child: Container(
                  width: 56,
                  height: 56,
                  padding: EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 16,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Icon(
                    Icons.delete,
                    color: Colors.white,
                  ),
                ),
              )
            ),
            if (contacts.value.length < 6)
              Positioned(right: 16,bottom: 16,child: AddContactBtn()),
          ],
        ),
      );
    }
  }
