import 'package:task_1_ios_app/my-imports.dart';
import 'package:task_1_ios_app/presentation/screens/dashboard-screen/land-property-screen.dart';
import 'package:task_1_ios_app/presentation/screens/dashboard-screen/rats-apartment-screen.dart';

class CustomDrawer extends StatelessWidget {
  final String selectedItem;

  const CustomDrawer({super.key, required this.selectedItem});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width * 0.8,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 🏢 Top Logo
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 32.0),
            child: Center(
              child: Image.asset(
                'assets/images/logo.png',
                height: 60,
              ),
            ),
          ),

          // 📜 Scrollable Menu List
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              physics: ClampingScrollPhysics(),
              children: [
                // Dashboard with children
                ExpansionTile(
                  initiallyExpanded: [
                    'Overall Dashboard',
                    'Rats/Apartment',
                    'Land/Property'
                  ].contains(selectedItem),
                  leading: Icon(Icons.dashboard_outlined),
                  title: Text(
                    'Dashboard',
                    style: TextStyle(fontSize: 15),
                  ),
                  children: [
                    DrawerItem(
                      icon: Icons.grid_view,
                      label: 'Overall Dashboard',
                      selectedItem: selectedItem,
                      onTap: () {
                        Get.to(() => DashboardScreen());
                        // TODO: Navigation or state update
                      },
                    ),
                    DrawerItem(
                      icon: Icons.apartment,
                      label: 'Rats/Apartment',
                      selectedItem: selectedItem,
                      onTap: () {
                        // TODO: Navigation or state update
                        Get.to(() => RatsOrApartmentScreen());
                      },
                    ),
                    DrawerItem(
                      icon: Icons.location_on_outlined,
                      label: 'Land/Property',
                      selectedItem: selectedItem,
                      onTap: () {
                        Get.to(() => const LandPropertyScreen());
                      },
                    ),
                  ],
                ),

                //  Other menu items
                DrawerItem(
                  icon: Icons.people_outline,
                  label: 'CRM Management',
                  selectedItem: selectedItem,
                  onTap: () {},
                ),
                DrawerItem(
                  icon: Icons.supervisor_account_outlined,
                  label: 'HRM Management',
                  selectedItem: selectedItem,
                  onTap: () {},
                ),
                DrawerItem(
                  icon: Icons.payments_outlined,
                  label: 'Payroll Management',
                  selectedItem: selectedItem,
                  onTap: () {},
                ),
                DrawerItem(
                  icon: Icons.bar_chart_outlined,
                  label: 'Accounts Management',
                  selectedItem: selectedItem,
                  onTap: () {},
                ),
                DrawerItem(
                  icon: Icons.settings_outlined,
                  label: 'Administrator',
                  selectedItem: selectedItem,
                  hasArrow: true,
                  onTap: () {},
                ),
                DrawerItem(
                  icon: Icons.notifications_outlined,
                  label: 'Marketing & Notifications',
                  selectedItem: selectedItem,
                  hasArrow: true,
                  onTap: () {},
                ),
                //
                ExpansionTile(
                  initiallyExpanded: [
                    'Project Type',
                    'Projects',
                    'Buildings/Sites'
                  ].contains(selectedItem),
                  leading: Icon(Icons.grid_view_outlined),
                  title: Text(
                    'Project Control',
                    style: TextStyle(fontSize: 15),
                  ),
                  children: [
                    DrawerItem(
                      icon: Icons.event_note,
                      label: 'Project Type',
                      selectedItem: selectedItem,
                      onTap: () {
                        Get.to(() => DashboardScreen());
                        // TODO: Navigation or state update
                      },
                    ),
                    DrawerItem(
                      icon: Icons.apartment,
                      label: 'Projects',
                      selectedItem: selectedItem,
                      onTap: () {
                        // TODO: Navigation or state update
                        Get.to(() => RatsOrApartmentScreen());
                      },
                    ),
                    DrawerItem(
                      icon: Icons.location_on_outlined,
                      label: 'Buildings/Sites',
                      selectedItem: selectedItem,
                      onTap: () {
                        Get.to(() => const LandPropertyScreen());
                      },
                    ),
                  ],
                ),
                DrawerItem(
                  icon: Icons.stacked_bar_chart_outlined,
                  label: 'Budgetary Control',
                  selectedItem: selectedItem,
                  hasArrow: true,
                  onTap: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
