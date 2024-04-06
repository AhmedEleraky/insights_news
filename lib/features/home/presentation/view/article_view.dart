import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:insights_news/core/services/routing.dart';
import 'package:insights_news/core/utils/colors.dart';
import 'package:insights_news/core/utils/text_style.dart';
import 'package:insights_news/core/widget/navigation.dart';
import 'package:insights_news/features/home/model/new_model/article.dart';
import 'package:insights_news/features/upload/widgets/custom_button.dart';
import 'package:url_launcher/url_launcher.dart';

class ArticleView extends StatelessWidget {
  const ArticleView({super.key, required this.article});
  final Article article;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            leading: IconButton(
                onPressed: () {
                  navigateTo(context, const NavigationBarView());
                },
                icon: const Icon(Icons.arrow_back))),
        bottomNavigationBar: CustomButton(
            text: 'Read More',
            onPressed: () async {
              var url = Uri.parse(article.url ?? '');
              await launchUrl(url);
            }),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  article.urlToImage ?? '',
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(Icons.error);
                  },
                ),
              ),
              const Gap(5),
              Text(
                article.title ?? '',
                style: getTitleSytle(context),
              ),
              const Gap(5),
              Row(
                children: [
                  Text(
                    article.author ?? '',
                    style:
                        getSmallSytle(context, color: ProjectColors.greyText),
                  ),
                  const Spacer(),
                  Text(article.publishedAt ?? '',
                      style: getSmallSytle(context,
                          color: ProjectColors.greyText)),
                ],
              ),
              const Gap(5),
              Text(
                article.description ?? '',
                style: getBodySytle(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
