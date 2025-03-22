import 'package:intl/intl.dart';
import 'package:task_1_ios_app/my-imports.dart';

Widget BuildChartSection() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      Container(
        margin: const EdgeInsets.symmetric(vertical: 16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
        ),
        child: Column(
          children: [
            const SizedBox(height: 15),
            const Text("Sales Performance",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
            const SizedBox(height: 35),
            const SalesPerformanceChart(),
            const SizedBox(height: 12),
            const Text("30%",
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
            const Text(
                "Your sales performance is 30% better compare to last month",
                style: TextStyle(color: Colors.grey, fontSize: 13),
                textAlign: TextAlign.center),
            const SizedBox(height: 10),
            TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                  backgroundColor: Colors.blue.shade50,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
              child: const Text('Details'),
            )
          ],
        ),
      ),
      //RevenueOverviewChart
      Container(
        margin: const EdgeInsets.only(bottom: 32),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
        ),
        child: Column(
          children: [
            const Text("Revenue Overview",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            const SizedBox(height: 4),
            Text(DateFormat('MMMM dd, yyyy').format(DateTime.now()),
                style: const TextStyle(color: Colors.grey, fontSize: 12)),
            const SizedBox(height: 12),
            RevenueOverviewChart(),
          ],
        ),
      )
    ],
  );
}
