import 'package:task_1_ios_app/my-imports.dart';

class BuildGridMenu extends StatelessWidget {
  const BuildGridMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> menuItems = [
      {
        'icon': Icons.credit_card, // 🟩 Payment request
        'label': 'Đề nghị thanh toán',
        'badge': 3,
      },
      {
        'icon': Icons.attach_money, // 💵 Advance request
        'label': 'Đề nghị tạm ứng',
      },
      {
        'icon': Icons.replay, // 🔄 Reimbursement
        'label': 'Đề nghị hoàn ứng',
      },
      {
        'icon': Icons.meeting_room, // 🏠 Meeting room
        'label': 'Đăng ký phòng họp',
      },
      {
        'icon': Icons.calendar_today, // 📅 Leave request
        'label': 'Đăng ký nghỉ phép',
        'badge': 3,
      },
      {
        'icon': Icons.directions_car, // 🚗 Car registration
        'label': 'Đăng ký xe',
        'badge': 3,
      },
      {
        'icon': Icons.edit_note, // 📝 Task/work
        'label': 'Công việc',
        'badge': 3,
      },
      {
        'icon': Icons.access_time, // ⏰ Attendance
        'label': 'Chấm công',
      },
      {
        'icon': Icons.local_shipping, // 🚚 Transportation
        'label': 'Vận chuyển',
      },
    ];

    return Expanded(
      child: GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          mainAxisSpacing: 12,
          crossAxisSpacing: 10,
          childAspectRatio: 0.75, // Keep cards same height-width ratio
        ),
        itemCount: menuItems.length,
        itemBuilder: (context, index) {
          return _buildMenuItem(menuItems[index]);
        },
      ),
    );
  }

  Widget _buildMenuItem(Map<String, dynamic> item) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Stack(
          children: [
            // Full stretch tile container
            Container(
              width: constraints.maxWidth,
              height: constraints.maxHeight,
              decoration: BoxDecoration(
                color: Color(0xFFE8F2F1),
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 4,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Floating white icon box
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 4,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Icon(item['icon'], size: 26, color: Colors.teal),
                    ),
                  ),

                  // Label
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: Text(
                      item['label'],
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: Colors.black87,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),

            // Optional badge
            if (item.containsKey('badge'))
              Positioned(
                right: 6,
                top: 6,
                child: CircleAvatar(
                  radius: 10,
                  backgroundColor: Colors.red,
                  child: Text(
                    '${item['badge']}',
                    style: TextStyle(color: Colors.white, fontSize: 11),
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}
