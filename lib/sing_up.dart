import 'package:card_payment_app/Login_screen.dart';
import 'package:flutter/material.dart';
class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [

          /// BACKGROUND
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xff020817),
                  Color(0xff050B1F),
                  Color(0xff090F2B),
                ],
              ),
            ),
          ),

          /// TOP LEFT CIRCLE
          Positioned(
            top: -120,
            left: -80,
            child: Container(
              height: 260,
              width: 260,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blue.withOpacity(0.15),
              ),
            ),
          ),

          /// BOTTOM RIGHT PURPLE CIRCLE
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

          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(
                horizontal: 22,
                vertical: 20,
              ),
              child: Column(
                children: [

                  const SizedBox(height: 25),

                  /// LOGO
                  Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: const LinearGradient(
                        colors: [
                          Color(0xff00D2FF),
                          Color(0xff7B2DFF),
                        ],
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.blue.withOpacity(0.4),
                          blurRadius: 20,
                        ),
                      ],
                    ),
                    child: const Icon(
                      Icons.account_balance_wallet_rounded,
                      color: Colors.white,
                      size: 38,
                    ),
                  ),

                  const SizedBox(height: 25),

                  /// TITLE
                  const Text(
                    "VAULTIQ",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 4,
                    ),
                  ),

                  const SizedBox(height: 8),

                  Text(
                    "Create Your Fintech Account",
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.6),
                      fontSize: 14,
                    ),
                  ),

                  const SizedBox(height: 45),

                  /// FULL NAME
                 
                  const SizedBox(height: 18),

                  /// EMAIL
                  customField(
                    hint: "Email Address",
                    icon: Icons.email_outlined,
                  ),

                  const SizedBox(height: 18),

                  /// PHONE
                  // customField(
                  //   hint: "Phone Number",
                  //   icon: Icons.phone_outlined,
                  // ),

                  // const SizedBox(height: 18),

                  /// PASSWORD
                  customField(
                    hint: "Password",
                    icon: Icons.lock_outline,
                    isPassword: true,
                  ),

                  const SizedBox(height: 18),

                  /// CONFIRM PASSWORD
                  customField(
                    hint: "Confirm Password",
                    icon: Icons.lock_outline,
                    isPassword: true,
                  ),

                  const SizedBox(height: 18),

                  /// TERMS
                  Row(
                    children: [
                      Transform.scale(
                        scale: 0.9,
                        child: Checkbox(
                          value: true,
                          onChanged: (value) {},
                          activeColor: Colors.cyan,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          "I agree to Terms & Conditions",
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.7),
                            fontSize: 13,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 25),

                  /// SIGNUP BUTTON
                  Container(
                    width: double.infinity,
                    height: 58,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      gradient: const LinearGradient(
                        colors: [
                          Color(0xff00D2FF),
                          Color(0xff7B2DFF),
                        ],
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.purple.withOpacity(0.35),
                          blurRadius: 20,
                          offset: const Offset(0, 8),
                        ),
                      ],
                    ),
                    child: ElevatedButton(
  onPressed: () {
    Navigator.pop(context); // 👈 goes back to Login screen
  },
  style: ElevatedButton.styleFrom(
    backgroundColor: Colors.transparent,
    shadowColor: Colors.transparent,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(18),
    ),
  ),
  child: const Text(
    "SIGN UP",
    style: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      letterSpacing: 1.5,
      color: Colors.white,
    ),
  ),
),
                  ),

                  const SizedBox(height: 30),

                  /// BIOMETRIC
                 

                  const SizedBox(height: 28),

                  /// LOGIN TEXT
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: [
                  //     Text(
                  //       "Already have an account? ",
                  //       style: TextStyle(
                  //         color: Colors.white.withOpacity(0.6),
                  //       ),
                  //     ),
                  //     const Text(
                  //       "Login",
                  //       style: TextStyle(
                  //         color: Color(0xff00D2FF),
                  //         fontWeight: FontWeight.bold,
                  //       ),
                  //     ),
                  //   ],
                  // ),
Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    Text(
      "Already have an account? ",
      style: TextStyle(
        color: Colors.white.withOpacity(0.6),
      ),
    ),

    GestureDetector(
      onTap: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => LoginScreen(),
          ),
        );
      },
      child: const Text(
        "Login",
        style: TextStyle(
          color: Color(0xff00D2FF),
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  ],
),

                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget customField({
    required String hint,
    required IconData icon,
    bool isPassword = false,
  }) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: Colors.white.withOpacity(0.05),
        border: Border.all(
          color: Colors.white.withOpacity(0.08),
        ),
      ),
      child: TextField(
        obscureText: isPassword,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          prefixIcon: Icon(
            icon,
            color: Colors.white70,
          ),
          suffixIcon: isPassword
              ? const Icon(
                  Icons.visibility_outlined,
                  color: Colors.white54,
                )
              : null,
          hintText: hint,
          hintStyle: TextStyle(
            color: Colors.white.withOpacity(0.35),
          ),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            vertical: 20,
          ),
        ),
      ),
    );
  }
}