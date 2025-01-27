import 'package:stroll_task/imports/imports.dart';
import 'package:stroll_task/screens/home/placeholder_page.dart';

class HomeScreen extends StatefulWidget {
  /// initialPageIndex jumps to a page,
  /// rather than default page when screen class is called.
  const HomeScreen({
    super.key,
    this.initialPageIndex,
  });

  final int? initialPageIndex;
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ScrollController scrollController = ScrollController();
  int _currentPageIndex = 1;
  bool isPageChanged = false;
  // late SignUpResponseMerchant signUpResponse;

  @override
  initState() {
    super.initState();
  }

  @override
  dispose() {
    super.dispose();
  }

  /// Getter & Setter for bottomNavBar's page index
  /// Use to change HomeScreen page from within this class
  int pageIndex([int? index]) {
    // 1. Returns initialPageIndex if its set on HomeLegalX() call,
    //    else index 2(HomePage) is returned.
    // 2. assigns index to _currentPageIndex on getPageIndex(index: int) call,
    //    triggered by bottomNavBar item tap, while setting isPageChanged to true.
    // 3. If isPageChanged is true, then only _currentPageIndex is returned,
    //    regardless of if initialPageIndex is null or not.
    // Note if widget.initialPageIndex is set directly, keyboard may crash on open.
    if (isPageChanged || index != null) {
      if (index != null) {
        setState(() {
          _currentPageIndex = index;
          isPageChanged = true;
        });
      }
      return _currentPageIndex;
    }
    return widget.initialPageIndex ?? _currentPageIndex;
  }

  @override
  Widget build(BuildContext context) {
    final _pageOptions = [
      PlaceholderPage(),
      DashboardPage(),
      PlaceholderPage(),
      PlaceholderPage(),
    ];
    return Scaffold(
      backgroundColor: Colors.black,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: false,
        showSelectedLabels: false,
        backgroundColor: Colors.black,
        selectedLabelStyle:
            TextStyle(fontWeight: FontWeight.w600, fontSize: 10),
        selectedItemColor: Colors.white,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: getIcon(
              0,
              pageIndex(),
              activeSVGpath: 'assets/svgs/nav_icon1.svg',
              noOfNotification: 25,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: getIcon(
              1,
              pageIndex(),
              activeSVGpath: 'assets/svgs/nav_icon2.svg',
              noOfNotification: 0,
            ),
            label: 'News',
          ),
          BottomNavigationBarItem(
            icon: getIcon(
              2,
              pageIndex(),
              activeSVGpath: 'assets/svgs/nav_icon3.svg',
              noOfNotification: 12,
            ),
            label: 'Wallet',
          ),
          BottomNavigationBarItem(
            icon: getIcon(
              3,
              pageIndex(),
              activeSVGpath: 'assets/svgs/nav_icon4.svg',
              noOfNotification: null,
            ),
            label: 'Tasks',
          ),
        ],
        currentIndex: pageIndex(), //New
        onTap: onTabTapped,
      ),
      body: _pageOptions[pageIndex()],
    );
  }

  Widget getIcon(
    int index,
    int selectedIndex, {
    int? noOfNotification,
    required String activeSVGpath,
  }) {
    bool isCurrent = selectedIndex == index;
    return SizedBox(
      height: 40,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Stack(
            alignment: Alignment.topRight,
            children: [
              SvgPicture.asset(activeSVGpath, height: 35),
              if (noOfNotification != null && noOfNotification != 0) Container(
                width: 16,
                height: 11,
                margin: EdgeInsets.only(top: 5),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(width: 1.4, color: Color(0xFF0F1115)),
                  color: kAppPurpleAccent,
                ),
                child: Text(
                  noOfNotification.toString(),
                  style: TextStyle(
                    fontSize: 7,
                    color: Color(0xFF0F1115),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          AnimatedContainer(
            height: isCurrent ? 5 : 0,
            duration: Duration(milliseconds: 350),
          ),
        ],
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      pageIndex(index);
    });
  }
}
