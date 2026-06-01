import 'dart:ui';
import 'package:flutter/material.dart';

class ProCardPaymentScreen extends StatefulWidget {
  @override
  State<ProCardPaymentScreen> createState() =>
      _ProCardPaymentScreenState();
}

class _ProCardPaymentScreenState
    extends State<ProCardPaymentScreen>
    with SingleTickerProviderStateMixin {

  final cardNumber =
      TextEditingController(text: "4242 4242 4242 4242");

  final name =
      TextEditingController(text: "SHEHERYAR HILAL");

  final expiry =
      TextEditingController(text: "12/28");

  final cvv =
      TextEditingController(text: "456");

  bool isLoading = false;

  AnimationController? _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1400),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller?.dispose();
    cardNumber.dispose();
    name.dispose();
    expiry.dispose();
    cvv.dispose();
    super.dispose();
  }

  // TOP SNACKBAR
  void showTopSnackBar(String message) {
    final overlay = Overlay.of(context);

    final overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: 55,
        left: 20,
        right: 20,
        child: Material(
          color: Colors.transparent,
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 18,
              vertical: 16,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              gradient: const LinearGradient(
                colors: [
                  Color(0xff00D4FF),
                  Color(0xff7F00FF),
                ],
              ),
            ),
            child: Row(
              children: [
                const Icon(Icons.verified, color: Colors.white),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    message,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );

    overlay.insert(overlayEntry);

    Future.delayed(const Duration(seconds: 2), () {
      overlayEntry.remove();
    });
  }

  void makePayment() async {
    setState(() => isLoading = true);
    await Future.delayed(const Duration(seconds: 2));
    setState(() => isLoading = false);
    showTopSnackBar("Payment Successful");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff060B16),

      body: Stack(
        children: [

          // 🌌 SPLASH STYLE TOP GLOW (RESTORED)
          Positioned(
            top: -120,
            left: -80,
            child: Container(
              height: 250,
              width: 250,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xff00D4FF).withOpacity(0.15),
              ),
            ),
          ),

          // 🌌 SPLASH STYLE BOTTOM GLOW (RESTORED)
          Positioned(
            bottom: -120,
            right: -80,
            child: Container(
              height: 250,
              width: 250,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xff7F00FF).withOpacity(0.15),
              ),
            ),
          ),

          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  const SizedBox(height: 20),

                  FadeTransition(
                    opacity: Tween(begin: 0.7, end: 1.0)
                        .animate(_controller!),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Payment Details",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 120),
                        Text(
                          "Secure fintech payment experience",
                          style: TextStyle(
                            color: Colors.white54,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 25),

                  premiumCard(),

                  const SizedBox(height: 30),

                  buildField("Card Number", cardNumber, Icons.credit_card),
                  const SizedBox(height: 15),
                  buildField("Card Holder Name", name, Icons.person),
                  const SizedBox(height: 15),

                  Row(
                    children: [
                      Expanded(
                        child: buildField(
                          "Expiry",
                          expiry,
                          Icons.date_range,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: buildField(
                          "CVV",
                          cvv,
                          Icons.lock,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 25),

                  SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        gradient: const LinearGradient(
                          colors: [
                            Color(0xff00D4FF),
                            Color(0xff7F00FF),
                          ],
                        ),
                      ),
                      child: ElevatedButton(
                        onPressed: isLoading ? null : makePayment,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                        ),
                        child: isLoading
                            ? const CircularProgressIndicator(
                                color: Colors.white,
                              )
                            : const Text(
                                "CONFIRM PAYMENT",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // CARD UI
  Widget premiumCard() {
  return Container(
    height: 230,
    width: double.infinity,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(28),
      gradient: const LinearGradient(
        colors: [
          Color(0xff121A2D),
          Color(0xff0B132B),
        ],
      ),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.4),
          blurRadius: 20,
          offset: const Offset(0, 10),
        ),
      ],
    ),
    child: Stack(
      children: [

        // 🌌 glow inside card (same splash feel)
        Positioned(
          top: -40,
          right: -30,
          child: Container(
            height: 120,
            width: 120,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: const Color(0xff00D4FF).withOpacity(0.12),
            ),
          ),
        ),

        Positioned(
          bottom: -40,
          left: -30,
          child: Container(
            height: 120,
            width: 120,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: const Color(0xff7F00FF).withOpacity(0.12),
            ),
          ),
        ),

        Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // TOP ROW
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "VAULTIQ",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                    ),
                  ),
                  Icon(Icons.wifi, color: Colors.white70),
                ],
              ),

              const SizedBox(height: 25),

              // CARD NUMBER (FULL WIDTH CENTER LOOK)
              Text(
                cardNumber.text,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  letterSpacing: 3,
                  fontWeight: FontWeight.w500,
                ),
              ),

              const Spacer(),

              // DETAILS ROW (CLEAN LIKE OLD DESIGN)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "CARD HOLDER",
                        style: TextStyle(
                          color: Colors.white38,
                          fontSize: 10,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        name.text,
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "EXPIRES",
                        style: TextStyle(
                          color: Colors.white38,
                          fontSize: 10,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        expiry.text,
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

  Widget buildField(
      String hint,
      TextEditingController controller,
      IconData icon,
      ) {
    return TextField(
      controller: controller,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.white38),
        prefixIcon: Icon(icon, color: Colors.white70),
        filled: true,
        fillColor: const Color(0xff121A2D),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: BorderSide.none,
        ),
      ),
      onChanged: (_) => setState(() {}),
    );
  }
}