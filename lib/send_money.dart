import 'dart:ui';
import 'package:flutter/material.dart';

class SendMoneyScreen extends StatefulWidget {
  const SendMoneyScreen({super.key});

  @override
  State<SendMoneyScreen> createState() => _SendMoneyScreenState();
}

class _SendMoneyScreenState extends State<SendMoneyScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  final TextEditingController accountController = TextEditingController();
  final TextEditingController amountController = TextEditingController();

  String accountName = "";
  bool detailsFetched = false;

  final Map<String, String> accounts = {
    "12345678901234": "Muhammad Ali",
    "11112222333344": "Ahmed Khan",
    "99998888777766": "Sheheryar Hilal",
    "55556666777788": "Usman Tariq",
  };

  void fetchAccountDetails() {
    String acc = accountController.text.trim();

    if (acc.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Enter 14-digit account number")),
      );
      return;
    }

    if (acc.length != 14) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Account number must be 14 digits")),
      );
      return;
    }

    setState(() {
      accountName = accounts[acc] ?? "Account Not Found";
      detailsFetched = true;
    });
  }

  void sendMoney() {
    if (!detailsFetched ||
        accountController.text.isEmpty ||
        amountController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Fill all fields first")),
      );
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          "Rs ${amountController.text} sent to $accountName",
        ),
      ),
    );

    accountController.clear();
    amountController.clear();

    setState(() {
      detailsFetched = false;
      accountName = "";
    });
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    accountController.dispose();
    amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: const Color(0xff060B16),

      body: Stack(
        children: [
          // Background glow
          Positioned(
            top: -120,
            left: -80,
            child: _glow(Colors.blue),
          ),
          Positioned(
            bottom: -120,
            right: -80,
            child: _glow(Colors.purple),
          ),

          SafeArea(
            child: LayoutBuilder(
              builder: (context, constraints) {
                return SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: constraints.maxHeight,
                    ),
                    child: IntrinsicHeight(
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          children: [
                            const SizedBox(height: 10),

                            // ICON
                            AnimatedBuilder(
                              animation: _controller,
                              builder: (context, child) {
                                return Transform.scale(
                                  scale: 1 + (_controller.value * 0.1),
                                  child: child,
                                );
                              },
                              child: Container(
                                padding: const EdgeInsets.all(22),
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  gradient: LinearGradient(
                                    colors: [
                                      Color(0xff00D4FF),
                                      Color(0xff7F00FF)
                                    ],
                                  ),
                                ),
                                child: const Icon(
                                  Icons.send_rounded,
                                  color: Colors.white,
                                  size: 55,
                                ),
                              ),
                            ),

                            const SizedBox(height: 20),

                            const Text(
                              "SEND MONEY",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 2,
                              ),
                            ),

                            const SizedBox(height: 25),

                            // ACCOUNT FIELD
                            _inputField(
                              controller: accountController,
                              hint:
                                  "Enter 14-digit Account Number",
                              maxLength: 14,
                            ),

                            const SizedBox(height: 12),

                            _button(
                              text: "FETCH ACCOUNT",
                              color: const Color(0xff00D4FF),
                              onTap: fetchAccountDetails,
                            ),

                            const SizedBox(height: 15),

                            // ACCOUNT INFO
                            if (detailsFetched)
                              _card(),

                            const SizedBox(height: 15),

                            // AMOUNT FIELD
                            if (detailsFetched)
                              _inputField(
                                controller: amountController,
                                hint: "Enter Amount",
                              ),

                            const SizedBox(height: 15),

                            if (detailsFetched)
                              _button(
                                text: "SEND MONEY",
                                color: const Color(0xff7F00FF),
                                onTap: sendMoney,
                              ),

                            const Spacer(),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  // -------- UI COMPONENTS --------

  Widget _glow(Color color) {
    return Container(
      height: 260,
      width: 260,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color.withOpacity(0.18),
      ),
    );
  }

  Widget _inputField({
    required TextEditingController controller,
    required String hint,
    int? maxLength,
  }) {
    return TextField(
      controller: controller,
      maxLength: maxLength,
      keyboardType: TextInputType.number,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        counterText: "",
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.white54),
        filled: true,
        fillColor: Colors.white.withOpacity(0.08),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  Widget _button({
    required String text,
    required Color color,
    required VoidCallback onTap,
  }) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
        ),
        child: Text(text),
      ),
    );
  }

  Widget _card() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.08),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        children: [
          const Icon(Icons.person,
              color: Colors.white, size: 45),
          const SizedBox(height: 10),
          Text(
            accountName,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}