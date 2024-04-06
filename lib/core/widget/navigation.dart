import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:insights_news/core/utils/colors.dart';
import 'package:insights_news/features/home/presentation/view/home_view.dart';
import 'package:insights_news/features/profile/profile_view.dart';
import 'package:insights_news/features/search/search_view.dart';
import 'package:insights_news/features/source/views/source_view.dart';

class NavigationBarView extends StatefulWidget {
  const NavigationBarView({super.key});

  @override
  State<NavigationBarView> createState() => _NavigationBarViewState();
}

class _NavigationBarViewState extends State<NavigationBarView> {
  int selectedPage = 0;
  List<Widget> views = [
    const HomeView(),
    const SearchView(),
    const SourceView(),
    const ProfileView(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: views[selectedPage],
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          currentIndex: selectedPage,
          onTap: (value) {
            setState(() {
              selectedPage = value;
            });
          },
          items: [
            BottomNavigationBarItem(
                activeIcon: SvgPicture.asset(
                  'assets/home.svg',
                  colorFilter: ColorFilter.mode(
                      ProjectColors.greenSelected, BlendMode.srcIn),
                ),
                icon: SvgPicture.asset('assets/home.svg'),
                label: 'Home'),
            BottomNavigationBarItem(
                activeIcon: SvgPicture.asset(
                  'assets/search.svg',
                  colorFilter: ColorFilter.mode(
                      ProjectColors.greenSelected, BlendMode.srcIn),
                ),
                icon: SvgPicture.asset('assets/search.svg'),
                label: 'search'),
            BottomNavigationBarItem(
                activeIcon: SvgPicture.asset(
                  'assets/folder.svg',
                  colorFilter: ColorFilter.mode(
                      ProjectColors.greenSelected, BlendMode.srcIn),
                ),
                icon: SvgPicture.asset('assets/folder.svg'),
                label: 'Sources'),
            BottomNavigationBarItem(
                activeIcon: SvgPicture.asset(
                  'assets/Profile.svg',
                  colorFilter: ColorFilter.mode(
                      ProjectColors.greenSelected, BlendMode.srcIn),
                ),
                icon: SvgPicture.asset('assets/Profile.svg'),
                label: 'Profile'),
          ]),
    );
  }
}
