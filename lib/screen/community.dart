import 'dart:async';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

final PageController _pageController = PageController();
final int _numPages = 3;

class CommunityPage extends StatefulWidget {
  @override
  State<CommunityPage> createState() => _CommunityPageState();
}

class _CommunityPageState extends State<CommunityPage> {
  int _currentPage = 0;
  late VideoPlayerController _videoPlayerController;
  late ChewieController _chewieController;
  _CommunityPageState() {
    _videoPlayerController = VideoPlayerController.asset(
      'assets/video/JilGyungYiFactory.mp4',
    );
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      aspectRatio: 16 / 9,
      autoPlay: true,
      looping: true,
    );
  }

  void initState() {
    super.initState();
    // Set up a timer to change the page every 5 seconds
    Timer.periodic(const Duration(seconds: 5), (Timer timer) {
      if (_currentPage < _numPages - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        appBar: AppBar(
          title: const Text('Giới Thiệu'),
          backgroundColor: const Color(0xffc89595),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 150, // Adjust the height as needed
                child: PageView.builder(
                  controller: _pageController,
                  scrollDirection: Axis.horizontal,
                  itemCount: _numPages,
                  onPageChanged: (int page) {
                    setState(() {
                      _currentPage = page;
                    });
                  },
                  itemBuilder: (context, index) {
                    return Image.asset('assets/image/baner${index + 1}.jpg');
                  },
                ),
              ),
              // Image of perfume bottle

              Padding(
                padding: const EdgeInsets.all(10),
                child: Column(children: [
                  const Text(
                    'JilGyungYi',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    ' JilGyungYi - Mỗi ngày, một thói quen \n         trong cuộc sống của bạn.',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Image.asset(
                    'assets/image/img1.png',
                    width: 100,
                    height: 100,
                  ),
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
                  Image.asset(
                    'assets/image/img2.png',
                    width: 100,
                    height: 100,
                  ),
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
                  Container(
                    width: 200.0,
                    height: 200.0,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(25.0)),
                    ),
                    child: Image.asset(
                      'assets/image/gif1.gif',
                      width: 500,
                      height: 500,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Image.asset(
                    'assets/image/img3.png',
                    width: 100,
                    height: 100,
                  ),
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
                  Image.asset(
                    'assets/image/img4.png',
                    width: 100,
                    height: 100,
                  ),
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
                    'JilGungyi trở thành một thói quen mỗi ngày của bạn.Chúng tôi tự tin sẽ mang đến những sản phẩm chất lượng nhất và nâng cao sức khỏe vùng kín của tất cả phụ nữ hiện đại.',
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  Chewie(controller: _chewieController),
                  const SizedBox(height: 10),
                  const Text(
                    ' Chất tẩy rửa đã và đang cống hiến niềm đam mê của mình để đạt được mục tiêu bằng việc cung cấp Jilgyngyi.Công ty đã và đang nỗ lực trở thành người bạn của phụ nữ trên toàn thế giới dựa trên công nghệ nổi bật của chúng tôi đã được công nhận trong và ngoài nước.',
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Image.asset('assets/image/gif2.gif'),
                  const SizedBox(height: 20),
                ]),
              ),
              Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Liên hệ với chúng tôi',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xffc89595)),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Vùng kín là bộ phận nhạy cảm nhất trên cơ thể và không nên cảm thấy xấu hổ hay giấu giếm khi sử dụng các sản phẩm chăm sóc cô bé. JilGungyi sẽ liên tục dẫn đầu chiến dịch thay đổi nhận thức về việc chăm sóc vùng kín. Chúng tôi luôn nỗ lực để trở thành bạn của của các bạn',
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 30),
                    const Text(
                      'Chúng tôi đồng hành cùng bạn!',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      alignment: Alignment.bottomLeft,
                      height: 10,
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: const Color(0xffc89597),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(10),
                      child: Column(children: [
                        Row(
                          children: [
                            Icon(Icons.map),
                            SizedBox(width: 10),
                            Text(
                                'Số 37 ngõ 20 Nguyễn Chánh, Trung Hòa,\nCầu Giấy, Hà Nội')
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Icon(Icons.phone),
                            SizedBox(width: 10),
                            Text('Hotline: 1900 636 099'),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Icon(Icons.email),
                            SizedBox(width: 10),
                            Text('s.healthyvn@gmail.com')
                          ],
                        ),
                      ]),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
