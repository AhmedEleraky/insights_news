import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:insights_news/core/utils/text_style.dart';
import 'package:insights_news/features/home/presentation/manager/news_cubit.dart';
import 'package:insights_news/features/home/presentation/manager/news_state.dart';
import 'package:insights_news/features/source/widget/source_link.dart';

class SourceView extends StatefulWidget {
  const SourceView({
    super.key,
  });

  @override
  State<SourceView> createState() => _SourceViewState();
}

class _SourceViewState extends State<SourceView> {
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Sources', style: getTitleSytle(context)),
          centerTitle: true,
        ),
        body: BlocBuilder<NewsCubit, NewsState>(
          builder: (context, state) {
            return GridView.builder(
              itemCount: 8,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, mainAxisSpacing: 10, crossAxisSpacing: 10),
              itemBuilder: (context, index) {
                return const SourceLink();
              },
            );
          },
        ));
  }
}
