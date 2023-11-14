import 'package:flutter/material.dart';

class CommunityPage extends StatelessWidget {
//   final List<Map<String, String>> list = [
//     {
//       'imageUrl':
//           'https://jilgyungyi.vn/static/media/banner_3.0d3a247965acacdc44cb.jpg',
//       'title': 'JilGyungYi',
//       'description':
//           '           JilGyungYi \n Mỗi ngày, JilGyungYi - một thói quen trong \n cuộc sống của bạn.',
//     },
//     {
//       'imageUrl':
//           'https://jilgyungyi.vn/static/media/ls.bf249acd756aa2d9de70.png',
//       'title': 'Khởi nguồn',
//       'description':
//           '   Câu chuyện bắt đầu từ tình yêu và sự tinh tế của người chồng trước những khó khăn thầm kín mà vợ mình phải chịu đựng. Bằng năng lực tuyệt vời của một chuyên gia hóa học hữu cơ sinh học, trong 3 năm ông đã cho ra một sản phẩm signature trong việc chăm sóc vùng kín cho phụ nữ. Bắt đầu từ đấy, Jilgyungyi không những là giải pháp tuyệt vời để chăm sóc và làm đẹp vùng kín hằng ngày cho phụ nữ mà còn là một sự thăng hoa của tình yêu.',
//     },
//     {
//       'imageUrl':
//           'https://jilgyungyi.vn/static/media/tn.a19a28112855c77b9a46.png',
//       'title': 'Cam kết',
//       'description':
//           '   Chúng tôi cam kết sử dụng nguyên liệu tự nhiên tối đa. Luôn nỗ lực nghiên cứu và tạo ra sản phẩm hiệu quả nhất không sử dụng Paraben, không có hương liệu nhân tạo, không chất tạo bọt.',
//     },
//     {
//       'imageUrl':
//           'https://jilgyungyi.vn/static/media/1.a823dc8c40a19d970ec7.gif',
//       'title': '',
//       'description': ''
//     },
//     {
//       'imageUrl':
//           'https://jilgyungyi.vn/static/media/th.5c5bee89e9815c0dc2a2.png',
//       'title': 'Nhận diện thương hiệu',
//       'description':
//           '   JilGyungYi tin rằng vẻ đẹp đích thực đến từ hạnh phúc khi phụ nữ cảm thấy thoải mái và tự tin. Đối với sức khỏe của tất cả phụ nữ, JilGyungYi tự sản xuất để mang đến chất lượng tốt nhất.',
//     },
//     {
//       'imageUrl':
//           'https://jilgyungyi.vn/static/media/sm.70615cb527e4425535c8.png',
//       'title': 'Về chúng tôi',
//       'description':
//           '   JilGungyi trở thành một thói quen mỗi ngày của bạn.Chúng tôi tự tin sẽ mang đến những sản phẩm chất lượng nhất và nâng cao sức khỏe vùng kín của tất cả phụ nữ hiện đại.\n Chất tẩy rửa đã và đang cống hiến niềm đam mê của mình để đạt được mục tiêu bằng việc cung cấp Jilgyngyi.Công ty đã và đang nỗ lực trở thành người bạn của phụ nữ trên toàn thế giới dựa trên công nghệ nổi bật của chúng tôi đã được công nhận trong và ngoài nước.',
//     },
//     {
//       'imageUrl':
//           'https://jilgyungyi.vn/static/media/feature_image.c606d63ad7a13ff69a24.gif',
//       'title': '',
//       'description': '  ',
//     },
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: ListView.builder(
//         itemCount: list.length,
//         itemBuilder: (context, index) {
//           return communityCard(
//             imageUrl: list[index]['imageUrl']!,
//             title: list[index]['title']!, // Get image URL from the list
//             description: list[index]['description']!,
//           );
//         },
//       ),
//     );
//   }
// }

// class communityCard extends StatelessWidget {
//   final String imageUrl;
//   final String description;
//   final String title;

//   communityCard(
//       {required this.imageUrl, required this.description, required this.title});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Image.network(
//           imageUrl,
//         ),
//         Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Text(
//             title,
//             style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//           ),
//         ),
//         Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Text(
//             description,
//             style: TextStyle(fontSize: 16),
//           ),
//         ),
//       ],
//     );
//   }
  @override
  Widget build(BuildContext context) {
    AppBar appBar = AppBar(
      title: const Text('Cộng đồng'),
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          // Navigate back to the previous screen
          Navigator.of(context).pop();
        },
      ),
    );
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Image of perfume bottle
            Image.network(
                'https://jilgyungyi.vn/static/media/banner_3.0d3a247965acacdc44cb.jpg'),
            const SizedBox(height: 10),
            // Text
            const Text(
              'JilGyungYi - Mỗi ngày, một thói quen trong cuộc sống của bạn.',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Image.network(
                'https://jilgyungyi.vn/static/media/ls.bf249acd756aa2d9de70.png'),
            const SizedBox(height: 10),
            const Text(
              'Khởi nguồn',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xffc89595)),
            ),
            const SizedBox(height: 10),
            const Text(
              'Câu chuyện bắt đầu từ tinh yêu và sự tinh tế của người chồng trước những khó khăn thăm kin mà vợ mình phải chịu đựng. Bằng năng lực tuyệt vời của một chuyên gia hóa học hữu cơ sinh học, trong 3 năm ông đã cho ra một sản phẩm signature trong việc chăm sóc vùng kín cho phụ nữ. Bắt đầu từ đấy, Jilgyungyi không những là giải pháp tuyệt vời để chăm sóc và làm đẹp vùng kín hàng ngày cho phụ nữ mà còn là một sự thăng hoa của tình yêu.',
              style: TextStyle(
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 20),
            Image.network(
                'https://jilgyungyi.vn/static/media/tn.a19a28112855c77b9a46.png'),
            const SizedBox(height: 10),
            const Text(
              'Cam kết ',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xffc89595)),
            ),
            const SizedBox(height: 10),
            const Text(
              'Chúng tôi cam kết sử dụng nguyên liệu tự nhiên tối đa. Luôn nỗ lực nghiên cứu và tạo ra sản phẩm hiệu quả nhất không sử dụng Paraben, không có hương liệu nhân tạo, không chất tạo bọt.',
              style: TextStyle(
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 20),
            Image.network(
                'https://jilgyungyi.vn/static/media/1.a823dc8c40a19d970ec7.gif'),
            const SizedBox(height: 20),
            Image.network(
                'https://jilgyungyi.vn/static/media/th.5c5bee89e9815c0dc2a2.png'),
            const SizedBox(height: 10),
            const Text(
              'Nhận diện thương hiệu',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xffc89595)),
            ),
            const SizedBox(height: 10),
            const Text(
              'JilGyungYi tin rằng vẻ đẹp đích thực đến từ hạnh phúc khi phụ nữ cảm thấy thoải mái và tự tin. Đối với sức khỏe của tất cả phụ nữ, JilGyungYi tự sản xuất để mang đến chất lượng tốt nhất.',
              style: TextStyle(
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 20),
            Image.network(
                'https://jilgyungyi.vn/static/media/sm.70615cb527e4425535c8.png'),
            const SizedBox(height: 10),
            const Text(
              'Về chúng tôi',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xffc89595)),
            ),
            const SizedBox(height: 10),
            const Text(
              'JilGungyi trở thành một thói quen mỗi ngày của bạn.Chúng tôi tự tin sẽ mang đến những sản phẩm chất lượng nhất và nâng cao sức khỏe vùng kín của tất cả phụ nữ hiện đại.\n Chất tẩy rửa đã và đang cống hiến niềm đam mê của mình để đạt được mục tiêu bằng việc cung cấp Jilgyngyi.Công ty đã và đang nỗ lực trở thành người bạn của phụ nữ trên toàn thế giới dựa trên công nghệ nổi bật của chúng tôi đã được công nhận trong và ngoài nước.',
              style: TextStyle(
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 20),
            Image.network(
                'https://jilgyungyi.vn/static/media/feature_image.c606d63ad7a13ff69a24.gif'),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
