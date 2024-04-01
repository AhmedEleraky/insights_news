import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:insights_news/core/services/local_storage.dart';
import 'package:insights_news/core/utils/colors.dart';
import 'package:insights_news/core/utils/text_style.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  String name = '';
  String? path;
  @override
  void initState() {
    super.initState();
    name = ProjectLocalStorage.getCashedData('name');
    path = ProjectLocalStorage.getCashedData('image');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(children: [
              Center(
                child: Column(
                  children: [
                    CircleAvatar(
                      backgroundColor: ProjectColors.greyText,
                      radius: 80,
                      backgroundImage: path != null
                          ? FileImage(File(path!)) as ImageProvider
                          : const AssetImage('assets/user.png'),
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 0,
                right: 110,
                child: InkWell(
                  child: CircleAvatar(
                    backgroundColor: ProjectColors.greenSelected,
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.add_a_photo,
                      ),
                    ),
                  ),
                ),
              ),
            ]),
            const Gap(70),
            Divider(
              indent: 5,
              endIndent: 5,
              color: ProjectColors.greenSelected,
            ),
            const Gap(30),
            TextFormField(
              onChanged: (value) {
                setState(() {
                  name = value;
                });
              },
              style: getBodySytle(context),
              cursorColor: Colors.white,
              decoration: InputDecoration(
                filled: true,
                fillColor: ProjectColors.greyContainer,
                hintStyle: getBodySytle(context,
                    color: ProjectColors.greenSelected, fontSize: 20),
                hintText: name,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
