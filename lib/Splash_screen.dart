import 'dart:async';
import 'package:flutter/material.dart';
import 'package:card_payment_app/Login_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )..repeat(reverse: true);

    // ✅ 10 seconds later move to LoginScreen
    Timer(const Duration(seconds: 10), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => LoginScreen(),
        ),
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff060B16),
      body: Stack(
        children: [
          // Top Glow
          Positioned(
            top: -120,
            left: -80,
            child: Container(
              height: 260,
              width: 260,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blue.withOpacity(0.18),
              ),
            ),
          ),

          // Bottom Glow
          Positioned(
            bottom: -120,
            right: -80,
            child: Container(
              height: 260,
              width: 260,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.purple.withOpacity(0.18),
              ),
            ),
          ),

          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedBuilder(
                  animation: _controller,
                  builder: (context, child) {
                    return Transform.scale(
                      scale: 1 + (_controller.value * 0.1),
                      child: child,
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: const LinearGradient(
                        colors: [
                          Color(0xff00D4FF),
                          Color(0xff7F00FF),
                        ],
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.blue.withOpacity(0.5),
                          blurRadius: 25,
                          spreadRadius: 5,
                        ),
                      ],
                    ),
                    child: const Icon(
                      Icons.account_balance_wallet_rounded,
                      size: 65,
                      color: Colors.white,
                    ),
                  ),
                ),

                const SizedBox(height: 30),

                const Text(
                  "VAULTIQ",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 34,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 5,
                  ),
                ),

                const SizedBox(height: 10),

                const Text(
                  "Next Generation Fintech Banking",
                  style: TextStyle(
                    color: Colors.white60,
                    fontSize: 14,
                    letterSpacing: 1.2,
                  ),
                ),

                const SizedBox(height: 60),

                const SizedBox(
                  width: 40,
                  height: 40,
                  child: CircularProgressIndicator(
                    strokeWidth: 3,
                    color: Color(0xff00D4FF),
                  ),
                ),
              ],
            ),
          ),

          const Positioned(
            bottom: 35,
            left: 0,
            right: 0,
            child: Text(
              "Secure • Fast • Smart",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white38,
                fontSize: 12,
                letterSpacing: 2,
              ),
            ),
          ),
        ],
      ),
    );
  }
}