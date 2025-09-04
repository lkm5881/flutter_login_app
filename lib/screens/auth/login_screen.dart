import 'package:flutter/material.dart';
import 'package:login_app/widgets/common_bottom_navigation_bar.dart';
import 'package:login_app/widgets/custom_drawer.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("로그인"),
      ),
      body: Center(
        child: const Text("로그인 화면"),
      ),
      endDrawer: CustomDrawer(),
      bottomNavigationBar: CommonBottomNavigationBar(
        currentIndex: 0
      ),
    );
  }
}