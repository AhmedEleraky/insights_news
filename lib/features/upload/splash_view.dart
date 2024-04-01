import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:insights_news/core/services/local_storage.dart';
import 'package:insights_news/core/services/routing.dart';
import 'package:insights_news/core/utils/colors.dart';
import 'package:insights_news/core/utils/text_style.dart';
import 'package:insights_news/core/widget/navigation.dart';
import 'package:insights_news/features/upload/upload.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    final isUpload = ProjectLocalStorage.getCashedData('isUpload') ?? false;
    Future.delayed(const Duration(seconds: 4), () {
      navigateWithReplacement(
          context, isUpload ? const NavigationBarView() : const UploadView());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/logo.png'),
            const Gap(50),
            Text('Insights News', style: getTitleSytle(context)),
            const Gap(25),
            Text(
              'Stay Informed, Anytime, Anywhere.',
              style: getBodySytle(context, color: ProjectColors.greyText),
            ),
          ],
        ),
      ),
    );
  }
}
