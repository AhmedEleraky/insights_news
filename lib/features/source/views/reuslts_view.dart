import 'package:flutter/material.dart';
import 'package:insights_news/core/utils/text_style.dart';
import 'package:insights_news/features/home/widget/custom_list_builder.dart';

class ResultView extends StatelessWidget {
  const ResultView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BBC NEWS', style: getTitleSytle(context)),
        centerTitle: true,
      ),
      body: Padding(
        padding:
            const EdgeInsets.only(right: 35, left: 35, bottom: 200, top: 35),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Total Results : 10',
              style: getBodySytle(context),
            ),
            const Expanded(child: CustomListBuilder()),
          ],
        ),
      ),
    );
  }
}
