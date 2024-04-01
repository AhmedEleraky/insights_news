import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:insights_news/core/utils/text_style.dart';
import 'package:insights_news/features/source/widget/source_link.dart';

class SourceView extends StatefulWidget {
  const SourceView({super.key});

  @override
  State<SourceView> createState() => _SourceViewState();
}

class _SourceViewState extends State<SourceView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sources', style: getTitleSytle(context)),
        centerTitle: true,
      ),
      body: const Padding(
        padding: EdgeInsets.all(15),
        child: Row(
          children: [
            Column(
              children: [
                SourceLink(),
                Gap(20),
                SourceLink(),
                Gap(20),
                SourceLink(),
              ],
            ),
            Spacer(),
            Column(
              children: [
                SourceLink(),
                Gap(20),
                SourceLink(),
                Gap(20),
                SourceLink(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
