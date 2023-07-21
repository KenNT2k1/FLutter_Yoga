import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_yoga_app/auth/auth_provider.dart';
import 'package:flutter_yoga_app/screens/home.dart';
import 'package:provider/provider.dart';

enum FormType { login, register }

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  FormType _formType = FormType.login;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Yoga App'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Image.asset('login_img.jpg'), // Thay đổi đường dẫn tới hình ảnh đăng nhập
              ),
              const Text('YOGA SE HI HOGA!'),
              const SizedBox(height: 16.0),
              TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: 'Tên đăng nhập',
                  hintText: 'Nhập tên đăng nhập',
                ),
              ),
              const SizedBox(height: 16.0),
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Mật khẩu',
                  hintText: 'Nhập mật khẩu',
                ),
              ),
              const SizedBox(height: 24.0),
              ElevatedButton(
                onPressed: () {
                  _handleAuthentication(context);
                },
                child: Text(_formType == FormType.login ? 'Đăng nhập' : 'Đăng ký'),
              ),
              const SizedBox(height: 8.0),
              TextButton(
                onPressed: () {
                  _toggleFormType();
                },
                child: Text(
                  _formType == FormType.login ? 'Đăng ký' : 'Đăng nhập',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _toggleFormType() {
    setState(() {
      _formType = _formType == FormType.login ? FormType.register : FormType.login;
    });
  }

 void _handleAuthentication(BuildContext context) {
  final authProvider = context.read<AuthProvider>();
  final email = emailController.text;
  final password = passwordController.text;

  Future<void>? auth;

  if (_formType == FormType.register) {
    auth = authProvider.register(userName: email, password: password);
  } else {
    auth = authProvider.login(userName: email, password: password);
  }

  auth.then((value) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => Home()),
    );
  }).catchError((e) {
    var message = 'Có lỗi xảy ra, vui lòng thử lại sau.';
    if (e is DioError) {
      final code = e.response?.data?['error']['message'];
      if (code == 'EMAIL_NOT_FOUND' ||
          code == 'INVALID_EMAIL' ||
          code == 'INVALID_PASSWORD') {
        message = 'Tên đăng nhập hoặc mật khẩu không hợp lệ, vui lòng thử lại sau';
      } else if (code == 'USER_DISABLED') {
        message = 'Người dùng của bạn đã bị khóa, vui lòng liên hệ với quản trị viên';
      } else if (code == 'EMAIL_EXISTS') {
        message = 'Địa chỉ email của bạn đã được sử dụng. Vui lòng thử lại sau';
      }
    }
    ScaffoldMessenger.maybeOf(context)?.showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
        padding: const EdgeInsets.all(10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
    );
  });
 }
}
