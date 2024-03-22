import 'package:flutter/material.dart';
import 'package:magnus_flutter_kelvin_prayitno/features/cinema/ui/cinema_view.dart';
import 'package:magnus_flutter_kelvin_prayitno/features/movie/ui/movie_view.dart';

import '../../../generated/l10n.dart';
import '../../dashboard/ui/dashboardview.dart';
import '../../widgets/app_bar.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  static const List<Widget> _pages = <Widget>[DashboardView(), MovieView(), CinemaView()];

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
        key: const Key("Home-parent-Scaffold"),
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
              label: S.of(context).movie_title,
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.location_city),
              label: S.of(context).cinema_tab_title,
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
        return S.of(context).movie_title;
      default:
        return S.of(context).cinema_tab_title;
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _pageController.jumpToPage(index);
    });
  }
}
