import 'package:flutter/material.dart';
import 'package:login_app/provider/user_provider.dart';
import 'package:login_app/screens/auth/join_screen.dart';
import 'package:login_app/screens/auth/login_screen.dart';
import 'package:login_app/screens/home_screen.dart';
import 'package:login_app/screens/mypage/profile_screen.dart';
import 'package:login_app/screens/user/cart_screen.dart';
import 'package:login_app/screens/user/product_screen.dart';
import 'package:login_app/screens/user/search_screen.dart';
import 'package:provider/provider.dart';

void main() {
  // runApp() : Flutter 앱의 시작점을 지정하는 함수
  // - Provider(MyApp) 을 루트 위젯으로 설정하여 앱을 실행
  runApp(
    // Provider
    // - ChangeNotifierProvider 를 사용하여 UserProvider를 전역으로 사용할 수 있도록 지정
    ChangeNotifierProvider(
      create: (context) => UserProvider(),
      child: const MyApp(),
    ),
  );

  // runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    // 앱 실행 시, 자동로그인
    Provider.of<UserProvider>(context, listen: false).autoLogin();

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      debugShowCheckedModeBanner: false,
      // home: const SearchScreen(),
      initialRoute: "/",
      // routes: {
      //   "/" : (context) => const HomeScreen(),
      //   "/auth/join": (context) => const JoinScreen(),
      //   "/auth/login": (context) => const LoginScreen(),
      //   "/user/search": (context) => const SearchScreen(),
      //   "/user/product": (context) => const ProductScreen(),
      //   "/user/cart": (context) => const CartScreen(),
      //   "/mypage/profile": (context) => const ProfileScreen(),
      // },
      onGenerateRoute: (RouteSettings settings) {
        // settings.name : 라우팅 경로 ('', '/mypage/profile')
        switch (settings.name) {
          // 홈
          case "/":
            return PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) => const HomeScreen(),
              transitionDuration: Duration(seconds: 0), // 애니메이션 효과 없음
            );
            // 회원가입
          case "/auth/join":
            return PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) => const JoinScreen(),
              transitionDuration: Duration(seconds: 0), // 애니메이션 효과 없음
            );
            // 로그인
          case "/auth/login":
            return PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) => const LoginScreen(),
              transitionDuration: Duration(seconds: 0), // 애니메이션 효과 없음
            );
            // 검색
          case "/user/search":
            return PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) => const SearchScreen(),
              transitionDuration: Duration(seconds: 0), // 애니메이션 효과 없음
            );
            // 상품
          case "/user/product":
            return PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) => const ProductScreen(),
              transitionDuration: Duration(seconds: 0), // 애니메이션 효과 없음
            );
            // 장바구니
          case "/user/cart":
            return PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) => const CartScreen(),
              transitionDuration: Duration(seconds: 0), // 애니메이션 효과 없음
            );
            // 마이페이지
          case "/mypage/profile":
            return PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) => const ProfileScreen(),
              transitionDuration: Duration(seconds: 0), // 애니메이션 효과 없음
            );
          default:
            return null;
        }
      },
    );
  }
}