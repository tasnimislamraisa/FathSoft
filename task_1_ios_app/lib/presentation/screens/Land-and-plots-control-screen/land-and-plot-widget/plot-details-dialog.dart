import 'package:task_1_ios_app/my-imports.dart';

class PlotDetailsDialog extends StatelessWidget {
  final Map<String, String> plot;

  const PlotDetailsDialog({super.key, required this.plot});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.all(24),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 6),
                const Text(
                  'Plot Details',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                const Divider(),
                _buildInfoRow('Plot Name:', plot['name']),
                const Divider(),
                _buildInfoRow('Plot Shape:', plot['shape']),
                const Divider(),
                _buildInfoRow('Plot Area:', plot['area']),
                const Divider(),
                _buildInfoRow('Inventory for Sale:', plot['inventoryForSale']),
                const Divider(),
                _buildInfoRow('Note:', plot['note']),
                const Divider(),
                _buildInfoRow('Property ID:', plot['propertyId']),
                const Divider(),
                _buildInfoRow('Property Name:', plot['propertyName']),
                const Divider(),
              ],
            ),
          ),

          // Close Button
          Positioned(
            top: 18,
            right: 18,
            child: InkWell(
              onTap: () => Get.back(),
              child: const Icon(Icons.close, size: 24),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String? value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 3,
            child: Text(
              label,
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
          Expanded(
            flex: 5,
            child: Text(
              value ?? '',
              style: const TextStyle(fontWeight: FontWeight.w400),
            ),
          ),
        ],
      ),
    );
  }
}
