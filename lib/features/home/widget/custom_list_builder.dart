import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:insights_news/core/utils/colors.dart';
import 'package:insights_news/core/utils/text_style.dart';

class CustomListBuilder extends StatelessWidget {
  const CustomListBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.symmetric(vertical: 13),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: ProjectColors.greyContainer,
          ),
          child: Row(
            children: [
              ClipRRect(
                child: Image.asset('assets/rodri small.png'),
              ),
              const Gap(10),
              Expanded(
                child: Column(
                  children: [
                    Text(
                      'Man City stay perfect despite Rodri red against Forest',
                      style: getBodySytle(context),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const Gap(5),
                    Row(
                      children: [
                        const Icon(
                          Icons.menu,
                          color: Colors.white,
                        ),
                        const Gap(10),
                        Text(
                          'READ',
                          style: getSmallSytle(context, color: Colors.white),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
