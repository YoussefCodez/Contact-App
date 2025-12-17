import 'dart:io';
import 'package:contact/const.dart';
import 'package:contact/data.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:image_picker/image_picker.dart';

class AddContactContent extends StatefulWidget {
  const AddContactContent({super.key});

  @override
  State<AddContactContent> createState() => _AddContactContentState();
}

class _AddContactContentState extends State<AddContactContent> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController numberController = TextEditingController();
  File? file;
  double padding = 20;
  List<String> info = ["User Name", "example@email.com", "+200000000000"];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.65,
        decoration: BoxDecoration(
          color: darkBlue,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 18),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () async {
                        final ImagePicker picker = ImagePicker();
                        final XFile? photo = await picker.pickImage(
                          source: ImageSource.gallery,
                        );
                        file = File(photo!.path);
                        padding = 0;
                        setState(() {});
                      },
                      child: Container(
                        padding: EdgeInsets.all(padding),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          border: Border.all(color: gold, width: 1),
                          borderRadius: BorderRadius.circular(28),
                        ),
                        child: file == null
                            ? Lottie.asset(
                                "assets/animation/Image.json",
                                width: 120,
                                height: 120,
                                repeat: false,
                              )
                            : Container(
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(28),
                                ),
                                child: Image.file(file!, fit: BoxFit.fill),
                              ),
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      children: [
                        showInput(title: info[0]),
                        showInput(title: info[1]),
                        showInput(
                          title: info[2],
                          borderColor: Colors.transparent,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Form(
                controller: usernameController,
                hintText: "Enter User Name",
                info: info[0],
                onChanged: (value) {
                  setState(() {
                    info[0] = value;
                  });
                },
                type: TextInputType.name,
              ),
              SizedBox(height: 8),
              Form(
                controller: emailController,
                hintText: "Enter User Email",
                info: info[1],
                onChanged: (value) {
                  setState(() {
                    info[1] = value;
                  });
                },
                type: TextInputType.emailAddress,
              ),
              SizedBox(height: 8),
              Form(
                controller: numberController,
                hintText: "Enter User Number",
                info: info[2],
                onChanged: (value) {
                  setState(() {
                    info[2] = value;
                  });
                },
                type: TextInputType.number,
              ),
              SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: darkBlue,
                    backgroundColor: gold,
                    overlayColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(16),
                    ),
                  ),
                  onPressed: () {
                    Map<String, dynamic> contactData = {
                      "name": info[0],
                      "email": info[1],
                      "number": info[2],
                      "image": file,
                    };
                    contacts.value = [
                      ...contacts.value,
                      contactData,
                    ];
                    setState(() {
                      info = ["User Name", "example@email.com", "+200000000000"];
                      file = null;
                      usernameController.text = "";
                      emailController.text = "";
                      numberController.text = "";
                      Navigator.pop(context);
                    });
                    print(contacts);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text("Enter User", style: TextStyle(fontSize: 20)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Form extends StatefulWidget {
  Form({
    super.key,
    required this.controller,
    required this.hintText,
    required this.info,
    required this.onChanged,
    required this.type,
  });

  final TextEditingController controller;
  final String hintText;
  final ValueChanged<String> onChanged;
  final TextInputType type;
  String info;
  @override
  State<Form> createState() => _FormState();
}

class _FormState extends State<Form> {
  late String info;
  @override
  void initState() {
    super.initState();
    info = widget.info;
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextField(
        controller: widget.controller,
        keyboardType: widget.type,
        cursorColor: gold,
        style: TextStyle(
          color: gold,
          fontWeight: FontWeight.w400,
          fontSize: 16,
        ),
        decoration: InputDecoration(
          fillColor: darkBlue,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            gapPadding: 5,
            borderSide: BorderSide(color: gold, width: 2),
          ),
          hintText: widget.hintText,
          hintStyle: TextStyle(
            color: lightBlue,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            gapPadding: 5,
            borderSide: BorderSide(color: gold, width: 2),
          ),
        ),
        onChanged: (value) {
          setState(() {
            widget.onChanged(value);
          });
        },
      ),
    );
  }
}

class showInput extends StatelessWidget {
  String title;
  Color borderColor;
  showInput({required this.title, this.borderColor = const Color(0xFFFFF1D4)});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(width: 1, color: borderColor)),
      ),
      child: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 16,
          color: gold,
        ),
      ),
    );
  }
}
