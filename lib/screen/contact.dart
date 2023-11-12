import 'package:flutter/material.dart';

class ContactInformation extends StatelessWidget {
  const ContactInformation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Image.asset(
                'assets/logo/logo1.png',
                width: 120,
                height: 120,
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                'Jilgyngyi',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(
                'Jilgyngyi, với mục đích bảo vệ sức khỏe và sắc đẹp phụ nữ.',
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(
                'số 37 ngõ 20 Nguyễn Chánh, Trung Hỏa, Cầu Giấy, Hà Nội',
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(
                '1900 633 296',
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(
                's.healthyvn@gmail.com',
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
            ),
            const Divider(
              height: 1.0,
            ),
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(
                'Dịch vụ khách hàng',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(
                'Mua hàng online: 1900 633 296\nGóp ý, khiếu nại: 1900 633 296',
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
            ),
            const Divider(
              height: 1.0,
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Hỗ trợ khách hàng',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(
                'Chính sách đổi trả\nChính sách bảo hành',
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
            ),
            const Divider(
              height: 1.0,
            ),
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(
                'Kết nối với chúng tôi',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment:
                    MainAxisAlignment.center, // Căn giữa biểu tượng
                children: [
                  // Biểu tượng thứ nhất (ví dụ: biểu tượng Facebook)
                  Icon(
                    Icons.facebook,
                    size: 40,
                    color: Colors.blue, // Màu của biểu tượng
                  ),
                  // Khoảng cách giữa hai biểu tượng
                  SizedBox(width: 20),
                  // Biểu tượng thứ hai (ví dụ: biểu tượng Twitter)
                  Icon(
                    Icons.youtube_searched_for,
                    size: 40,
                    color: Colors.blue, // Màu của biểu tượng
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
