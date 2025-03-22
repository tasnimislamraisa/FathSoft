import 'package:task_1_ios_app/my-imports.dart';

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
                // 📊 Dashboard with children
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
                        // TODO: Navigation or state update
                      },
                    ),
                    DrawerItem(
                      icon: Icons.apartment,
                      label: 'Rats/Apartment',
                      selectedItem: selectedItem,
                      onTap: () {
                        // TODO: Navigation or state update
                      },
                    ),
                    DrawerItem(
                      icon: Icons.location_on_outlined,
                      label: 'Land/Property',
                      selectedItem: selectedItem,
                      onTap: () {
                        // TODO: Navigation or state update
                      },
                    ),
                  ],
                ),

                // 🌐 Other menu items
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
                DrawerItem(
                  icon: Icons.event_note_outlined,
                  label: 'Project Control',
                  selectedItem: selectedItem,
                  hasArrow: true,
                  onTap: () {},
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
