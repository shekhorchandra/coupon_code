import 'package:flutter/material.dart';

import '../values/app_colors.dart';


class AuthToggle extends StatelessWidget {
  final bool isLogin;
  final VoidCallback onLoginTap;
  final VoidCallback onSignupTap;

  const AuthToggle({
    super.key,
    required this.isLogin,
    required this.onLoginTap,
    required this.onSignupTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 52),
      height: 44,
      decoration: BoxDecoration(
        color: AppColors.togglebackground,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [
          _button("Log In", isLogin, onLoginTap),
          _button("Sign up", !isLogin, onSignupTap),
        ],
      ),
    );


  }

  Widget _button(String text, bool active, VoidCallback onTap) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 2), // space between buttons
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: active ? AppColors.secondary : Colors.transparent,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Text(
            text,
            style: TextStyle(
              color: active ? Colors.white : Colors.black,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
