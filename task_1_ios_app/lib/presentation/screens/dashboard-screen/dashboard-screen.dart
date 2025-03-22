import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart';

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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale('en')],
      home: Scaffold(
        backgroundColor: const Color(0xfff9f9fb),
        appBar: AppBar(
          title: const Text('Dashboard'),
          backgroundColor: Colors.white,
          elevation: 0,
          actions: [
            IconButton(
                onPressed: () {}, icon: const Icon(Icons.wb_sunny_outlined)),
            const CircleAvatar(
              backgroundColor: Colors.black12,
              child: Text('SC', style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            const SizedBox(width: 16),
          ],
        ),
        body: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: const [
                  BoxShadow(color: Colors.black12, blurRadius: 6),
                ],
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
                  boxShadow: const [
                    BoxShadow(color: Colors.black12, blurRadius: 6),
                  ],
                ),
                child: Column(
                  children: [
                    _dateOption(
                        'Today',
                        DateTimeRange(
                          start: DateTime.now(),
                          end: DateTime.now(),
                        )),
                    _dateOption(
                        'Yesterday',
                        DateTimeRange(
                          start:
                              DateTime.now().subtract(const Duration(days: 1)),
                          end: DateTime.now().subtract(const Duration(days: 1)),
                        )),
                    _dateOption(
                        'Last 7 Days',
                        DateTimeRange(
                          start:
                              DateTime.now().subtract(const Duration(days: 6)),
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
            _dashboardCard(
                'Sales Amount', '12,000 TK', Icons.show_chart, Colors.blue),
            _dashboardCard('Purchase Amount', '12,000 TK', Icons.shopping_bag,
                Colors.deepOrangeAccent),
            _dashboardCard('Payment Due', '12,000 TK', Icons.receipt,
                Colors.deepPurpleAccent),
            _dashboardCard(
                'Receipt Due', '12,000 TK', Icons.receipt_long, Colors.teal),
          ],
        ),
      ),
    );
  }

  Widget _dashboardCard(
      String title, String value, IconData icon, Color color) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [color.withOpacity(0.85), color]),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: Colors.white, size: 32),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,
                  style: const TextStyle(color: Colors.white, fontSize: 14)),
              const SizedBox(height: 4),
              Text(value,
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
            ],
          )
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
