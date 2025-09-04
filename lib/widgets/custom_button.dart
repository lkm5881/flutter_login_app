import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;                // 버튼 텍스트
  final VoidCallback onPressed;     // 버튼 클릭 콜백
  final bool isFullWidth;           // 가로 너비 여부
  final Color color;                // 글씨 색상
  final Color backgroundColor;      // 배경 색상

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isFullWidth = false,
    this.color = Colors.white,
    this.backgroundColor = Colors.blueAccent,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: isFullWidth == true ? double.infinity : null,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          foregroundColor: color,
          backgroundColor: backgroundColor,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4),),
          textStyle: const TextStyle(fontSize: 16),
        ),
        child: Text(text),
      ),
    );
  }
}