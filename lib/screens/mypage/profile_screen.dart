import 'package:flutter/material.dart';
import 'package:login_app/provider/user_provider.dart';
import 'package:login_app/screens/home_screen.dart';
import 'package:login_app/widgets/common_bottom_navigation_bar.dart';
import 'package:login_app/widgets/custom_button.dart';
import 'package:login_app/widgets/custom_drawer.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  final _formKey = GlobalKey<FormState>();

  TextEditingController _usernameController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();

  String? _username;            // 아이디
  String? _name;                // 이름
  String? _email;              // 이메일

  @override
  Widget build(BuildContext context) {

    UserProvider userProvider = Provider.of<UserProvider>(context, listen: true);

    // 로그인 상태 확인
    // - 로그인이 안되어 있으면,
    if(!userProvider.isLogIn) {
      // 로그인 페이지로 리다이렉트
      WidgetsBinding.instance.addPostFrameCallback((_) {
        // 남아있는 스택이 있는지 확인
        if(Navigator.canPop(context)) {
          Navigator.pop(context);
        }
        Navigator.pushNamed(context, '/auth/login');
      });

      return const HomeScreen();
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("마이"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Center(
                child: Text("프로필 수정",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
              SizedBox(height: 20),
              // 아이디
              TextFormField(
                controller: _usernameController,
                validator: (value) {},
                decoration: const InputDecoration(
                  labelText: "아이디",
                  hintText: "아이디를 입력하세요",
                  prefixIcon: Icon(Icons.person_outline),
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  setState(() {
                    _username = value;
                  });
                },
              ),
              SizedBox(height: 16),
              // 이름
              TextFormField(
                controller: _nameController,
                validator: (value) {},
                decoration: const InputDecoration(
                  labelText: "이름",
                  hintText: "이름을 입력하세요",
                  prefixIcon: Icon(Icons.person_outline),
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  setState(() {
                    _username = value;
                  });
                },
              ),
              SizedBox(height: 16),
              // 이메일
              TextFormField(
                controller: _emailController,
                validator: (value) {},
                decoration: const InputDecoration(
                  labelText: "이메일",
                  hintText: "이메일을 입력하세요",
                  prefixIcon: Icon(Icons.email_outlined),
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  setState(() {
                    _email = value;
                  });
                },
              ),
              SizedBox(height: 20),
              CustomButton(
                text: "회원 탈퇴", 
                isFullWidth: true,
                backgroundColor: Colors.red,
                onPressed: () {
                  // TODO: 회원 탈퇴 처리
                },
              ),
            ],
          ),
        ),
      ),
      bottomSheet: CustomButton(
        text: "회원 정보 수정",
        isFullWidth: true,
        onPressed: () {}
      ),  
      endDrawer: CustomDrawer(),
      bottomNavigationBar: CommonBottomNavigationBar(
        currentIndex: 4
      ),
    );
  }
}