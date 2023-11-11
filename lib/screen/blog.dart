import 'package:flutter/material.dart';

class BlogPage extends StatelessWidget {
  final List<Map<String, String>> list = [
    {
      'imageUrl':
          'http://drive.google.com/uc?export=view&id=12qiXwb21RXBHrLoJORO71j8_igRMzARd',
      'description':
          'Có nên dùng dung dịch vệ sinh phụ nữ hàng ngày không? \nDung dịch vệ sinh là sản phẩm chăm sóc vùng kín dành cho nữ giới, mặc dù được sử dụng phổ biến trong cuộc sống hàng ngày nhưng không phải ai cũng hiểu rõ về sản phẩm này. Tham....',
    },
    {
      'imageUrl':
          'http://drive.google.com/uc?export=view&id=1tl_F-TjxXqsMWeKhBBzKFzRZEfePTwlP',
      'description':
          'Độ tuổi nào có thể sử dụng dung dịch vệ sinh phụ nữ? \nDung dịch vệ sinh phụ nữ là một sản phẩm làm sạch vùng kín, ngăn ngừa viêm nhiễm phụ khoa cho các bạn nữ. Vậy độ tuổi nào sẽ thích hợp để sử dụng sản phẩm này? Các bước sử dụn...',
    },
    {
      'imageUrl':
          'http://drive.google.com/uc?export=view&id=1gssjvbmChcuZDzrsh3A-14lWr6Qg9wss',
      'description':
          'Mang thai có được dùng dung dịch vệ sinh không?\n Loại nào tốt...Việc vệ sinh vùng kín là rất quan trọng đối với chị em phụ nữ, đặc biệt là với mẹ bầu. Tuy nhiên, khi mang thai có được dùng dung dịch vệ sinh hay không là câu hỏi luôn nhận đ...',
    },
    {
      'imageUrl':
          'http://drive.google.com/uc?export=view&id=14X8aChCtcPKA7V3IczWh2bLH0jGAbPZR',
      'description':
          'Vùng kín bị thâm đen lý do?\nVùng kín bị thâm thường khiến chị em phụ nữ không còn hài lòng với cơ thể mình, tự ti trong chuyện gối chăn. Tuy nhiên, thâm vùng kín lại là kết quả tự nhiên không thể tránh k...',
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
          return BlogCard(
            imageUrl: list[index]['imageUrl']!, // Get image URL from the list
            description: list[index]['description']!,
          );
        },
      ),
    );
  }
}

class BlogCard extends StatelessWidget {
  final String imageUrl;
  final String description;

  BlogCard({required this.imageUrl, required this.description});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8), // Add margin to the card
      elevation: 4, // Add elevation for a shadow effect
      child: Column(
        children: [
          Image.network(
            imageUrl,
            width: double.infinity,
            height: 200,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              description,
              style: TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
