import 'package:flutter/material.dart';
import 'package:magnus_flutter_kelvin_prayitno/modules/dashboard/ui/dashboardview.dart';
import 'package:magnus_flutter_kelvin_prayitno/modules/news/ui/news_view.dart';
import 'package:magnus_flutter_kelvin_prayitno/modules/profile/ui/profile_view.dart';

import '../../../generated/l10n.dart';
import '../../widgets/app_bar.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  static const List<Widget> _pages = <Widget>[DashboardView(), NewsView(), ProfileScreen()];

  int _selectedIndex = 0;

  late PageController _pageController;

  @override
  void initState() {
    super.initState();

    _pageController = PageController(initialPage: _selectedIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: appBar(title: getTitle(context, _selectedIndex)),
        bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: const Icon(Icons.home),
              label: S.of(context).home_title,
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.newspaper),
              label: S.of(context).news_title,
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.people),
              label: S.of(context).profile_tab_title,
            ),
          ],

          currentIndex: _selectedIndex, //New
          onTap: _onItemTapped,
        ),
        body: PageView(
          controller: _pageController,
          physics: const NeverScrollableScrollPhysics(),
          children: _pages,
        ),
      ),
    );
  }

  String getTitle(BuildContext context, int page) {
    switch (page) {
      case 0:
        return S.of(context).home_title;
      case 1:
        return S.of(context).news_title;
      default:
        return S.of(context).profile_tab_title;
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _pageController.jumpToPage(index);
    });
  }
}
