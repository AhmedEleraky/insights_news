import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:insights_news/core/services/routing.dart';
import 'package:insights_news/core/utils/colors.dart';
import 'package:insights_news/core/utils/text_style.dart';
import 'package:insights_news/features/source/views/reuslts_view.dart';

import '../../home/presentation/manager/news_cubit.dart';

class SourceLink extends StatefulWidget {
  const SourceLink({
    super.key,
  });

  @override
  State<SourceLink> createState() => _SourceLinkState();
}

class _SourceLinkState extends State<SourceLink> {
  @override
  void initState() {
    context.read<NewsCubit>().getSources();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        navigateTo(context, const ResultView());
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            color: ProjectColors.greyContainer),
        child: Column(
          children: [
            ClipRRect(
              child: Image.asset(
                'assets/ESPN.png',
                fit: BoxFit.cover,
              ),
            ),
            const Gap(20),
            Text(
              'ESPN',
              style: getBodySytle(context),
            ),
          ],
        ),
      ),
    );
  }
}
