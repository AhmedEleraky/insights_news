import 'dart:io';

import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:insights_news/core/services/local_storage.dart';
import 'package:insights_news/core/utils/colors.dart';
import 'package:insights_news/core/utils/text_style.dart';
import 'package:insights_news/features/home/presentation/widget/custom_list_builder.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int currentSlider = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 4,
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hello ${ProjectLocalStorage.getCashedData(
                            'name',
                          )}',
                          style: getTitleSytle(context),
                        ),
                        Text(
                          'Have a nice day!',
                          style: getBodySytle(context,
                              color: ProjectColors.greyText),
                        ),
                      ],
                    ),
                    const Spacer(),
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: FileImage(
                          File(ProjectLocalStorage.getCashedData('image'))),
                    ),
                  ],
                ),
                CarouselSlider.builder(
                    itemCount: 5,
                    itemBuilder: (context, index, realIndex) {
                      return Image.asset('assets/rodri.png');
                    },
                    options: CarouselOptions(
                      height: 200,
                      aspectRatio: 16 / 9,
                      viewportFraction: 0.8,
                      initialPage: 0,
                      enableInfiniteScroll: true,
                      reverse: false,
                      autoPlay: true,
                      autoPlayInterval: const Duration(seconds: 3),
                      autoPlayAnimationDuration:
                          const Duration(milliseconds: 800),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enlargeCenterPage: true,
                      enlargeFactor: 0.3,
                      onPageChanged: (index, reason) {
                        setState(() {
                          currentSlider = index;
                        });
                      },
                      scrollDirection: Axis.horizontal,
                    )),
                SmoothPageIndicator(
                  controller: PageController(initialPage: currentSlider),
                  count: 5,
                  effect: SlideEffect(
                      spacing: 8.0,
                      paintStyle: PaintingStyle.stroke,
                      strokeWidth: 1.5,
                      dotColor: Colors.grey,
                      activeDotColor: ProjectColors.greenSelected),
                ),
                const Gap(20),
                ButtonsTabBar(
                  // Customize the appearance and behavior of the tab bar
                  unselectedBackgroundColor: ProjectColors.greyContainer,
                  backgroundColor: ProjectColors.greenSelected,
                  borderWidth: 2,
                  borderColor: Colors.black,
                  labelStyle: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                  buttonMargin: const EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  unselectedLabelStyle: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),

                  // Add your tabs here
                  tabs: const [
                    Tab(
                      text: 'Science',
                    ),
                    Tab(
                      text: 'Entertainment',
                    ),
                    Tab(
                      text: 'Sports',
                    ),
                    Tab(
                      text: 'Business',
                    ),
                  ],
                ),
                const Gap(5),
                const Expanded(
                  child: TabBarView(
                    children: [
                      CustomListBuilder(
                        category: 'science',
                      ),
                      CustomListBuilder(
                        category: 'entertainment',
                      ),
                      CustomListBuilder(
                        category: 'sports',
                      ),
                      CustomListBuilder(
                        category: 'business',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
