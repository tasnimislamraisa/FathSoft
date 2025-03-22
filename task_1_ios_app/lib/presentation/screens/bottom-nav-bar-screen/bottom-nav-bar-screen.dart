import 'package:task_1_ios_app/my-imports.dart';

class BottomNavBarScreen extends StatefulWidget {
  const BottomNavBarScreen({super.key});

  @override
  State<BottomNavBarScreen> createState() => _BottomNavBarScreenState();
}

class _BottomNavBarScreenState extends State<BottomNavBarScreen> {
  final BottomNavbarController _bottomNavbarController =
      Get.find<BottomNavbarController>();
  final List<Widget> _screens = const [
    HomeScreen(),
    EditScreen(),
    NotificationScreen(),
    ProfileScreen(),
  ];
  //to reduce api call again and again we used this here instead of homescreen
/*  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Ensure all necessary controllers are initialized
      if (!Get.isRegistered<SliderListController>()) {
        Get.put(SliderListController());
      }
      if (!Get.isRegistered<CategoryListController>()) {
        Get.put(CategoryListController());
      }
      if (!Get.isRegistered<PopularProductListController>()) {
        Get.put(PopularProductListController());
      }
      if (!Get.isRegistered<NewProductListController>()) {
        Get.put(NewProductListController());
      }
      if (!Get.isRegistered<SpecialProductListController>()) {
        Get.put(SpecialProductListController());
      }

      // Fetch the data for these controllers
      Get.find<SliderListController>().getSliderList();
      Get.find<CategoryListController>().getCategoryList();
      Get.find<PopularProductListController>().getPopularProductList();
      Get.find<NewProductListController>().getNewProductList();
      Get.find<SpecialProductListController>().getSpecialProductList();
    });
    /*WidgetsBinding.instance.addPostFrameCallback((_)
    {
      Get.find<SliderListController>().getSliderList();
      Get.find<CategoryListController>().getCategoryList();
      Get.find<PopularProductListController>().getPopularProductList();
      Get.find<NewProductListController>().getNewProductList();
      Get.find<SpecialProductListController>().getSpecialProductList();
    });*/
  }*/

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomNavbarController>(builder: (_) {
      // Ensure the selectedIndex is within the bounds of the _screens list
      if (_bottomNavbarController.selectedIndex < 0 ||
          _bottomNavbarController.selectedIndex >= _screens.length) {
        return const Center(
          child: Text('Error: Invalid Index'),
        );
      }
      return Scaffold(
        body: _screens[_bottomNavbarController.selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _bottomNavbarController.selectedIndex,
          //selectedIndex: _bottomNavbarController.selectedIndex,
          onTap: _bottomNavbarController.changeIndex,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.edit_document), label: 'Edit'),
            BottomNavigationBarItem(
                icon: Icon(Icons.notifications_active), label: 'Notification'),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_remove_outlined), label: 'User List'),
          ],
          type: BottomNavigationBarType
              .fixed, // or BottomNavigationBarType.shifting
          iconSize: 20, // Adjust icon size
          selectedFontSize: 12, // Adjust selected label font size
          unselectedFontSize: 10, // Adjust unselected label font size
          selectedItemColor: Colors.blue, // Customize selected item color
          unselectedItemColor: Colors.grey, // Customize unselected item color
        ),
      );
    });
  }
}
