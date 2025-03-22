import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class SalesPerformanceChart extends StatelessWidget {
  const SalesPerformanceChart({super.key});

  @override
  Widget build(BuildContext context) {
    final values = [2800, 4300, 3000, 3800, 4300, 3800, 3300];
    final colors = [
      Colors.pink.shade200,
      Colors.blue.shade200,
      Colors.yellow.shade200,
      Colors.cyan.shade200,
      Colors.purple.shade200,
      Colors.orange.shade200,
      Colors.grey.shade300,
    ];

    return SizedBox(
      height: 280,
      child: Stack(
        children: [
          /// ✅ Bar chart
          BarChart(
            BarChartData(
              alignment: BarChartAlignment.spaceAround,
              maxY: 5000,
              minY: 0,
              gridData: FlGridData(show: false),
              borderData: FlBorderData(show: false),
              titlesData: FlTitlesData(
                leftTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                rightTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                topTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    getTitlesWidget: (value, _) {
                      const months = [
                        'Jan',
                        'Feb',
                        'Mar',
                        'Apr',
                        'May',
                        'Jun',
                        'Jul'
                      ];
                      return Padding(
                        padding: const EdgeInsets.only(top: 4.0),
                        child: Text(
                          months[value.toInt()],
                          style: const TextStyle(fontSize: 12),
                        ),
                      );
                    },
                  ),
                ),
              ),
              barGroups: List.generate(values.length, (index) {
                return BarChartGroupData(
                  x: index,
                  barRods: [
                    BarChartRodData(
                      toY: values[index].toDouble(),
                      width: 44,
                      borderRadius: BorderRadius.circular(8),
                      color: colors[index],
                      backDrawRodData: BackgroundBarChartRodData(show: false),
                    )
                  ],
                );
              }),
              barTouchData: BarTouchData(enabled: true),
            ),
          ),

          /// ✅ Line chart overlay
          LineChart(
            LineChartData(
              minY: 0,
              maxY: 5000,
              lineBarsData: [
                LineChartBarData(
                  spots: const [
                    FlSpot(0, 3000),
                    FlSpot(1, 4300),
                    FlSpot(2, 3300),
                    FlSpot(3, 4000),
                    FlSpot(4, 4300),
                    FlSpot(5, 3800),
                    FlSpot(6, 3600),
                  ],
                  isCurved: true,
                  color: Colors.blue,
                  barWidth: 2,
                  dotData: FlDotData(show: true),
                ),
              ],
              gridData: FlGridData(show: false),
              titlesData: FlTitlesData(show: false),
              borderData: FlBorderData(show: false),
              lineTouchData: LineTouchData(enabled: false),
            ),
          ),

          /// Value labels above bars
          Positioned.fill(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: List.generate(values.length, (index) {
                return Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: Text(
                    values[index].toString(),
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
