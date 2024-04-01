import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:insights_news/core/utils/colors.dart';
import 'package:insights_news/core/utils/text_style.dart';
import 'package:insights_news/features/home/widget/custom_list_builder.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Find Your News', style: getTitleSytle(context)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              onChanged: (value) {
                setState(() {});
              },
              style: getBodySytle(context),
              cursorColor: Colors.white,
              decoration: InputDecoration(
                filled: true,
                fillColor: ProjectColors.greyText,
                hintStyle: getBodySytle(context),
                hintText: 'Search for news',
                prefixIcon: SvgPicture.asset(
                  'assets/search.svg',
                  fit: BoxFit.scaleDown,
                  colorFilter:
                      const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                ),
              ),
            ),
            const Gap(30),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text(
                'Total Results : 10',
                style: getBodySytle(context),
              ),
            ),
            const Gap(15),
            const Expanded(
                child: Padding(
              padding: EdgeInsets.only(bottom: 50),
              child: CustomListBuilder(),
            )),
          ],
        ),
      ),
    );
  }
}
