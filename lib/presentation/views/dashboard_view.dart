import 'package:recipes_api/presentation/views/bookmarks/bookmarks_view.dart';

import '../../app/imports.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  int selectedIndex = 0;

  void changeIndex(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  List<Widget> items = <Widget>[
    const HomeView(),
    const SettingsView(),
    const BookMarksView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (index) {
          changeIndex(index);
        },
        unselectedItemColor: Colors.white,
        selectedItemColor:
            Theme.of(context).bottomNavigationBarTheme.selectedItemColor,
        showUnselectedLabels: true,
        backgroundColor:
            Theme.of(context).bottomNavigationBarTheme.backgroundColor,
        items: [
          const BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(
              Icons.home,
              color: Colors.white,
            ),
          ),
          const BottomNavigationBarItem(
            label: 'Settings',
            icon: Icon(
              Icons.settings,
              color: Colors.white,
            ),
          ),
          BottomNavigationBarItem(
            label: 'BookMarks',
            icon: SvgPicture.asset(
              'assets/images/icon_bookmark.svg',
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: items[selectedIndex],
    );
  }
}
