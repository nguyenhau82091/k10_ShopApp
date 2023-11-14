import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:k10_shopapp/widget/edit_item.dart';

class EditAccountScreen extends StatefulWidget {
  const EditAccountScreen({super.key});

  @override
  State<EditAccountScreen> createState() => _EditAccountScreenState();
}

class _EditAccountScreenState extends State<EditAccountScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  String _gender = 'Nam'; // Giới tính mặc định
  DateTime _dob = DateTime(1990, 1, 1); // Ngày tháng năm sinh mặc định

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _dob,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (picked != null && picked != _dob) {
      setState(() {
        _dob = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chỉnh sửa thông tin cá nhân'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Container(
                alignment: Alignment.centerRight,
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(50),
                  image: const DecorationImage(
                    image: AssetImage('assets/logo/avatar.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  // Thực hiện chức năng thay đổi avatar
                  changeAvatar();
                },
                child: const Text('Thay đổi avatar'),
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Họ và tên'),
              ),
              const SizedBox(height: 16.0),
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Ngày tháng năm sinh',
                  textAlign: TextAlign.start,
                ),
              ),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () => _selectDate(context),
                    child: Text('Chọn ngày'),
                  ),
                  SizedBox(width: 16.0),
                  Text('${_dob.day}/${_dob.month}/${_dob.year}'),
                ],
              ),
              SizedBox(height: 16.0),
              Container(
                  alignment: Alignment.centerLeft,
                  child: const Text('Giới tính')),
              Row(
                children: [
                  Radio(
                    value: 'Nam',
                    groupValue: _gender,
                    onChanged: (value) {
                      setState(() {
                        _gender = value as String;
                      });
                    },
                  ),
                  const Text('Nam'),
                  Radio(
                    value: 'Nữ',
                    groupValue: _gender,
                    onChanged: (value) {
                      setState(() {
                        _gender = value as String;
                      });
                    },
                  ),
                  const Text('Nữ'),
                ],
              ),
              const SizedBox(height: 12.0),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(labelText: 'Email'),
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: _phoneController,
                decoration: const InputDecoration(labelText: 'Số điện thoại'),
              ),
              const SizedBox(height: 16.0),
              const SizedBox(height: 32.0),
              ElevatedButton(
                onPressed: () {
                  // Xử lý logic khi người dùng nhấn nút lưu
                  saveProfile();
                },
                child: const Text('Lưu thông tin'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void changeAvatar() {}

  void saveProfile() {
    // Thực hiện lưu thông tin cá nhân vào cơ sở dữ liệu hoặc API
    String name = _nameController.text;
    String email = _emailController.text;
    String phone = _phoneController.text;

    // Hiển thị thông báo thành công
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Tính năng đang phát triển !'),
      ),
    );
  }
}
