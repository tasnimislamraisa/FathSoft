import 'package:intl/intl.dart';
import 'package:task_1_ios_app/my-imports.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  bool showDropdown = false;
  DateTimeRange? selectedRange;
  String selectedDateLabel = 'Filter by date';

  void _selectPreset(String label, DateTimeRange range) {
    setState(() {
      selectedDateLabel = label;
      selectedRange = range;
      showDropdown = false;
    });
  }

  void _selectCustomRange(DateTimeRange range) {
    setState(() {
      selectedDateLabel =
          '${DateFormat('MM/dd/yyyy').format(range.start)} ~ ${DateFormat('MM/dd/yyyy').format(range.end)}';
      selectedRange = range;
      showDropdown = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff9f9fb),
      appBar: AppBar(
        title: const Text('Dashboard',
            style: TextStyle(fontWeight: FontWeight.bold)),
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.wb_sunny_outlined)),
          BuildProfileMenu(),
        ],
      ),
      drawer: CustomDrawer(
        selectedItem: '',
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Date filter section
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 6)],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.menu),
                  label: const Text('Filter'),
                ),
                GestureDetector(
                  onTap: () => setState(() => showDropdown = !showDropdown),
                  child: Row(
                    children: [
                      const Icon(Icons.calendar_month_outlined),
                      const SizedBox(width: 6),
                      Text(selectedDateLabel),
                      const SizedBox(width: 6),
                      const Icon(Icons.keyboard_arrow_down_rounded),
                    ],
                  ),
                )
              ],
            ),
          ),

          const SizedBox(height: 8),

          if (showDropdown)
            Container(
              margin: const EdgeInsets.only(top: 8),
              padding: const EdgeInsets.symmetric(vertical: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 6)],
              ),
              child: Column(
                children: [
                  _dateOption(
                      'Today',
                      DateTimeRange(
                          start: DateTime.now(), end: DateTime.now())),
                  _dateOption(
                      'Yesterday',
                      DateTimeRange(
                        start: DateTime.now().subtract(const Duration(days: 1)),
                        end: DateTime.now().subtract(const Duration(days: 1)),
                      )),
                  _dateOption(
                      'Last 7 Days',
                      DateTimeRange(
                        start: DateTime.now().subtract(const Duration(days: 6)),
                        end: DateTime.now(),
                      )),
                  _dateOption(
                      'Last 30 Days',
                      DateTimeRange(
                        start:
                            DateTime.now().subtract(const Duration(days: 29)),
                        end: DateTime.now(),
                      )),
                  _dateOption(
                      'This Month',
                      DateTimeRange(
                        start: DateTime(
                            DateTime.now().year, DateTime.now().month, 1),
                        end: DateTime.now(),
                      )),
                  _dateOption(
                      'Last Month',
                      DateTimeRange(
                        start: DateTime(
                            DateTime.now().year, DateTime.now().month - 1, 1),
                        end: DateTime(
                            DateTime.now().year, DateTime.now().month, 0),
                      )),
                  ListTile(
                    title: const Text('Custom Range'),
                    onTap: () async {
                      final picked = await showDateRangePicker(
                        context: context,
                        firstDate: DateTime(2020),
                        lastDate: DateTime.now(),
                        initialDateRange: selectedRange,
                      );
                      if (picked != null) _selectCustomRange(picked);
                    },
                  ),
                ],
              ),
            ),

          const SizedBox(height: 16),

          // Dashboard cards
          BuildGradientCard(
              'Sales Amount', '12,000 TK', Icons.show_chart, Colors.blue),
          BuildGradientCard('Purchase Amount', '12,000 TK', Icons.shopping_bag,
              Colors.deepOrangeAccent),
          BuildGradientCard('Payment Due', '12,000 TK', Icons.receipt,
              Colors.deepPurpleAccent),
          BuildGradientCard(
              'Receipt Due', '12,000 TK', Icons.receipt_long, Colors.teal),

          BuildSimpleCard('Dpress', '8,500 TK', Icons.account_balance_wallet,
              Colors.indigoAccent.withOpacity(0.15)),
          BuildSimpleCard('Salary', '5,000 TK', Icons.credit_card,
              Colors.greenAccent.withOpacity(0.15)),
          BuildSimpleCard('Total Clients', '120', Icons.group,
              Colors.redAccent.withOpacity(0.15)),
          BuildSimpleCard('Total Suppliers', '45', Icons.people_alt,
              Colors.amberAccent.withOpacity(0.2)),
          BuildSimpleCard('Total Employees', '25', Icons.shopping_bag_outlined,
              Colors.green.withOpacity(0.15)),

          const SizedBox(height: 20),

          BuildChartSection(),
        ],
      ),
    );
  }

  Widget _dateOption(String label, DateTimeRange range) {
    return ListTile(
      title: Text(label),
      onTap: () => _selectPreset(label, range),
    );
  }
}
