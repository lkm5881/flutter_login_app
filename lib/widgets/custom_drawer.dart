import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Scaffold(
        body: ListView(
          padding: EdgeInsets.zero,
          children: [
            // Drawer 헤더
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: SizedBox.expand(),
            ),

            _DrawerItem(
              icon: Icons.home,
              text: "홈",
              onTap: () {},
              // color: Colors.white,
              // backgroundColor: Colors.blue,
            ),
            _DrawerItem(
              icon: Icons.person,
              text: "마이",
              onTap: () {},
            ),
            _DrawerItem(
              icon: Icons.category,
              text: "상품",
              onTap: () {},
            ),
            _DrawerItem(
              icon: Icons.shopping_bag,
              text: "장바구니",
              onTap: () {},
            ),
          ],
        ),
        bottomSheet: Container(
          color: Colors.blueAccent,
          child:
          // 로그아웃 
          _DrawerItem(
            icon: Icons.logout, 
            text: "로그아웃",
            color: Colors.white, 
            onTap: () {},
          ),
          
          // 로그인, 회원가입
          // Row(
          //   children: [
          //     // 로그인
          //     Expanded(
          //       child: TextButton(
          //         onPressed: () {}, 
          //         child: Text("로그인", style: TextStyle(color: Colors.white),),
          //       ),
          //     ),
          //     // 회원가입
          //     Expanded(
          //       child: TextButton(
          //         onPressed: () {}, 
          //         child: Text("회원가입", style: TextStyle(color: Colors.white),),
          //       ),
          //     ),
          //   ],
          // ),
        ),
      ),
    );
  }

  // DrawerItem
  Widget _DrawerItem({
    required IconData icon,
    required String text,
    required VoidCallback onTap,
    Color? color,
    MaterialColor? backgroundColor,
  }) {
    return ListTile(
      leading: Icon(icon, color: color,),
      title: Text(text),
      tileColor: backgroundColor,
      textColor: color,
    );
  }
}