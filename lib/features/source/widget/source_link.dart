import 'package:flutter/material.dart';
import 'package:insights_news/core/services/routing.dart';
import 'package:insights_news/core/utils/colors.dart';
import 'package:insights_news/core/utils/text_style.dart';
import 'package:insights_news/features/source/views/reuslts_view.dart';

class SourceLink extends StatelessWidget {
  const SourceLink({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        navigateTo(context, const ResultView());
      },
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            Container(
              width: 130,
              height: 150,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  color: ProjectColors.greyContainer),
              child: Column(
                children: [
                  ClipRRect(
                    child: Image.asset('assets/ESPN.png'),
                  ),
                  Text(
                    'BBC NEWS',
                    style: getBodySytle(context),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
