import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:insights_news/core/functions/snack_bar.dart';
import 'package:insights_news/core/services/local_storage.dart';
import 'package:insights_news/core/services/routing.dart';
import 'package:insights_news/core/utils/colors.dart';
import 'package:insights_news/core/utils/text_style.dart';
import 'package:insights_news/core/widget/navigation.dart';
import 'package:insights_news/features/upload/widgets/custom_button.dart';

String name = '';
String? path;

class UploadView extends StatefulWidget {
  const UploadView({super.key});

  @override
  State<UploadView> createState() => _UploadViewState();
}

class _UploadViewState extends State<UploadView> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
              onPressed: () {
                if (path != null && name.isNotEmpty) {
                  ProjectLocalStorage.casheData('name', name);
                  ProjectLocalStorage.casheData('image', path);
                  ProjectLocalStorage.casheData('isUpload', true);
                  navigateWithReplacement(context, const NavigationBarView());
                } else if (path == null && name.isNotEmpty) {
                  showErrorDialog(context, 'Please add your image');
                } else if (path != null && name.isEmpty) {
                  showErrorDialog(context, 'Please add your name');
                } else {
                  showErrorDialog(context, 'Please add your name and image');
                }
              },
              child: Text(
                'Done',
                style: getBodySytle(context,
                    fontSize: 20, color: ProjectColors.greenSelected),
              ))
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundColor: ProjectColors.greyText,
                    radius: 80,
                    backgroundImage: path != null
                        ? FileImage(File(path!)) as ImageProvider
                        : const AssetImage('assets/user.png'),
                  ),
                  const Gap(30),
                  CustomButton(
                    text: 'Upload From Camera',
                    onPressed: () {
                      getImageCamera();
                    },
                  ),
                  const Gap(15),
                  CustomButton(
                    text: 'Upload From Gallery',
                    onPressed: () {
                      getImageGallery();
                    },
                  ),
                  const Gap(15),
                  Divider(
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
                      fillColor: ProjectColors.greyText,
                      hintStyle: getBodySytle(context),
                      hintText: 'Enter Your Name',
                      prefixIcon: SvgPicture.asset(
                        'assets/Profile.svg',
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  getImageCamera() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.camera);

    if (pickedImage != null) {
      setState(() {
        path = pickedImage.path;
      });
    }
  }

  getImageGallery() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        path = pickedImage.path;
      });
    }
  }
}
