import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class RevenueOverviewChart extends StatelessWidget {
  const RevenueOverviewChart({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov'
    ];

    final List<double> sales = [
      95,
      85,
      130,
      85,
      95,
      115,
      115,
      95,
      105,
      115,
      130
    ];

    final List<double> expenses = [30, 35, 50, 30, 40, 45, 40, 35, 40, 45, 50];

    return Column(
      children: [
        SizedBox(
          height: 280,
          child: LineChart(
            LineChartData(
              minY: 0,
              maxY: 140,
              gridData: FlGridData(show: true, drawVerticalLine: false),
              titlesData: FlTitlesData(
                leftTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 30,
                    interval: 20,
                    getTitlesWidget: (value, _) => Text(
                      value.toInt().toString(),
                      style: const TextStyle(fontSize: 10),
                    ),
                  ),
                ),
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    getTitlesWidget: (value, _) => Padding(
                      padding: const EdgeInsets.only(top: 6),
                      child: Text(
                        months[value.toInt()],
                        style: const TextStyle(fontSize: 11),
                      ),
                    ),
                  ),
                ),
                topTitles:
                    AxisTitles(sideTitles: SideTitles(showTitles: false)),
                rightTitles:
                    AxisTitles(sideTitles: SideTitles(showTitles: false)),
              ),
              borderData: FlBorderData(show: false),
              lineBarsData: [
                LineChartBarData(
                  spots: List.generate(
                    sales.length,
                    (index) => FlSpot(index.toDouble(), sales[index]),
                  ),
                  isCurved: true,
                  color: Colors.blue,
                  belowBarData: BarAreaData(
                    show: true,
                    gradient: LinearGradient(
                      colors: [
                        Colors.blue.withOpacity(0.5),
                        Colors.blue.withOpacity(0.1)
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  barWidth: 2,
                  dotData: FlDotData(show: false),
                ),
                LineChartBarData(
                  spots: List.generate(
                    expenses.length,
                    (index) => FlSpot(index.toDouble(), expenses[index]),
                  ),
                  isCurved: true,
                  color: Colors.pinkAccent,
                  belowBarData: BarAreaData(
                    show: true,
                    gradient: LinearGradient(
                      colors: [
                        Colors.pinkAccent.withOpacity(0.4),
                        Colors.pinkAccent.withOpacity(0.05)
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  barWidth: 2,
                  dotData: FlDotData(show: false),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 12),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildLegendDot(Colors.blue, "Sales"),
              const SizedBox(width: 16),
              _buildLegendDot(Colors.pinkAccent, "Expenses"),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildLegendDot(Color color, String label) {
    return Row(
      children: [
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        const SizedBox(width: 6),
        Text(
          label,
          style: const TextStyle(fontSize: 12, color: Colors.black54),
        ),
      ],
    );
  }
}
