import 'package:task_1_ios_app/my-imports.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width * 0.8,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 🧑 Header
          Container(
            color: AppColors.themeColor,
            padding: EdgeInsets.only(top: 50, bottom: 16, left: 16, right: 16),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Icon(Icons.arrow_back, color: Colors.white),
                ),
                SizedBox(width: 12),
                CircleAvatar(
                  radius: 24,
                  backgroundImage: AssetImage(
                      'assets/images/profile.jpg'), // 👤 Your profile image asset
                ),
                SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Võ Nguyễn Minh Huy',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'nguyenminhhuyvo@gmail.com',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 12,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),

          SizedBox(height: 16),

          // 🔹 Section 1: Thông tin
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text('Thông tin',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          ),
          SizedBox(height: 8),
          drawerItem(Icons.edit, 'Chỉnh sửa hồ sơ'),
          drawerItem(Icons.person_outline, 'Tên tài khoản'),
          drawerItem(Icons.email_outlined, 'E-mail'),
          drawerItem(Icons.lock_outline, 'Mật khẩu'),

          SizedBox(height: 24),

          // 🔹 Section 2: Tài khoản
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text('Tài khoản',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          ),
          SizedBox(height: 8),
          drawerItem(Icons.add, 'Thêm tài khoản'),
          drawerItem(Icons.swap_horiz, 'Chuyển tài khoản'),
          drawerItem(Icons.logout, 'Đăng xuất'),
        ],
      ),
    );
  }

  Widget drawerItem(IconData icon, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Row(
        children: [
          Icon(icon, size: 20),
          SizedBox(width: 12),
          Expanded(
            child: Text(
              title,
              style: TextStyle(fontSize: 15),
            ),
          ),
        ],
      ),
    );
  }
}
