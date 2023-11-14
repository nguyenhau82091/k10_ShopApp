import 'package:flutter/material.dart';

class ContactInformation extends StatelessWidget {
  const ContactInformation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Thông tin liên hệ'),
        backgroundColor: const Color(0XFFc89595),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Image.asset(
                  'assets/logo/logo1.png',
                  width: 120,
                  height: 120,
                  fit: BoxFit.fill,
                ),
              ),
              const Card(
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Jilgyngyi',
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Jilgyngyi, với mục đích bảo vệ sức khỏe và sắc đẹp phụ nữ.',
                        style: TextStyle(
                          fontSize: 16.0,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Địa chỉ : số 37 ngõ 20 Nguyễn Chánh, Trung Hỏa, Cầu Giấy, Hà Nội',
                        style: TextStyle(
                          fontSize: 16.0,
                        ),
                      ),
                      Text(
                        'Điện Thoại : 1900 633 296',
                        style: TextStyle(
                          fontSize: 16.0,
                        ),
                      ),
                      Text(
                        'Email : s.healthyvn@gmail.com',
                        style: TextStyle(
                          fontSize: 16.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Divider(
                height: 1.0,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                child: const Card(
                  child: Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Text(
                          'Dịch vụ khách hàng :',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Mua hàng online: 1900 633 296\nGóp ý, khiếu nại: 1900 633 296',
                          style: TextStyle(
                            fontSize: 16.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const Divider(
                height: 1.0,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                child: const Card(
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Text(
                          'Hỗ trợ khách hàng :',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Chính sách đổi trả\nChính sách bảo hành',
                          style: TextStyle(
                            fontSize: 16.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const Divider(
                height: 1.0,
              ),
              const Card(
                child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Kết nối với chúng tôi :',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Icon(
                        Icons.facebook,
                        size: 40,
                        color: Colors.blue,
                      ),
                      SizedBox(width: 20),
                      Icon(
                        Icons.youtube_searched_for,
                        size: 40,
                        color: Colors.blue,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
