import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:insights_news/core/utils/colors.dart';
import 'package:insights_news/core/utils/text_style.dart';
import 'package:insights_news/features/home/presentation/manager/news_cubit.dart';
import 'package:insights_news/features/home/presentation/manager/news_state.dart';

class CustomSearchListBuilder extends StatelessWidget {
  const CustomSearchListBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsCubit, NewsState>(
      builder: (context, state) {
        if (state is NewsBySearchSuccessState) {
          var news = state.model.articles;
          return ListView.builder(
            itemCount: news?.length,
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
                      child: Image.network(
                        news?[index].urlToImage ?? '',
                        height: 150,
                        width: 150,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return SizedBox(
                              height: 150,
                              width: 150,
                              child: Icon(
                                Icons.error,
                                color: ProjectColors.greyText,
                              ));
                        },
                      ),
                    ),
                    const Gap(10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            news?[index].title ?? '',
                            style: getBodySytle(context),
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const Gap(5),
                          Text(
                            news?[index].author ?? '',
                            style: getSmallSytle(context,
                                color: ProjectColors.greyText),
                          ),
                          const Gap(10),
                          Row(
                            children: [
                              const Icon(
                                Icons.menu,
                                color: Colors.white,
                              ),
                              const Gap(10),
                              Text(
                                'READ',
                                style:
                                    getSmallSytle(context, color: Colors.white),
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
        } else if (state is NewsBySearchErrorState) {
          return const Text('Error');
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
