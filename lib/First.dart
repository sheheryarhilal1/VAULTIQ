import 'package:card_payment_app/Home_screen.dart';
import 'package:card_payment_app/send_money.dart';
import 'package:flutter/material.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff060B16),

      body: Stack(
        children: [

          // 🌌 TOP GLOW
          Positioned(
            top: -120,
            left: -80,
            child: Container(
              height: 250,
              width: 250,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blue.withOpacity(0.15),
              ),
            ),
          ),

          // 🌌 BOTTOM GLOW
          Positioned(
            bottom: -120,
            right: -80,
            child: Container(
              height: 250,
              width: 250,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.purple.withOpacity(0.15),
              ),
            ),
          ),

          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [

                  // TOP BAR
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Welcome Back",
                              style: TextStyle(color: Colors.white54),
                            ),
                            SizedBox(height: 4),
                            Text(
                              "VAULTIQ",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                                letterSpacing: 2,
                              ),
                            ),
                          ],
                        ),

                        Row(
                          children: [
                            Icon(Icons.notifications_none,
                                color: Color(0xff00D4FF)),
                            SizedBox(width: 10),
                            Icon(Icons.person_outline,
                                color: Color(0xff00D4FF)),
                          ],
                        ),
                      ],
                    ),
                  ),

                  // 💳 BALANCE CARD
                  Container(
                    margin: const EdgeInsets.all(16),
                    padding: const EdgeInsets.all(22),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      gradient: const LinearGradient(
                        colors: [
                          Color(0xff00D4FF),
                          Color(0xff7F00FF),
                        ],
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.blue.withOpacity(0.3),
                          blurRadius: 25,
                        ),
                      ],
                    ),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Text(
                          "Available Balance",
                          style: TextStyle(color: Colors.white70),
                        ),

                        SizedBox(height: 10),

                        Text(
                          "PKR 250,000",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        SizedBox(height: 20),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Account No",
                                style: TextStyle(color: Colors.white70)),
                            Text("**** 5678",
                                style: TextStyle(color: Colors.white)),
                          ],
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 10),

                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 18),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Quick Services",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 60),

                  // GRID
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: GridView.count(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisCount: 3,
                      mainAxisSpacing: 18,
                      crossAxisSpacing: 15,
                      childAspectRatio: .9,
                      children: [

                        ServiceTile(
  icon: Icons.send,
  title: "Send Money",
  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const SendMoneyScreen(),
      ),
    );
  },
),

                        ServiceTile(
                          icon: Icons.receipt_long,
                          title: "Bills",
                          onTap: () {},
                        ),

                        // ⭐ CARD BUTTON (MAIN NAVIGATION)
                        ServiceTile(
                          icon: Icons.credit_card,
                          title: "Cards",
                          onTap: () {
                            Navigator.push(
                              context,
                              PageRouteBuilder(
                                transitionDuration:
                                    const Duration(milliseconds: 400),
                                pageBuilder: (_, animation, __) =>
                                    ProCardPaymentScreen(),
                                transitionsBuilder:
                                    (_, animation, __, child) {
                                  return FadeTransition(
                                    opacity: animation,
                                    child: SlideTransition(
                                      position: Tween<Offset>(
                                        begin: const Offset(0, 0.2),
                                        end: Offset.zero,
                                      ).animate(animation),
                                      child: child,
                                    ),
                                  );
                                },
                              ),
                            );
                          },
                        ),

                        ServiceTile(icon: Icons.savings, title: "Savings"),
                        ServiceTile(icon: Icons.payments, title: "Payments"),
                        ServiceTile(icon: Icons.security, title: "Security"),
                        ServiceTile(icon: Icons.settings, title: "Settings"),
                        ServiceTile(icon: Icons.feedback, title: "Feedback"),
                        ServiceTile(icon: Icons.account_balance, title: "Banking"),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),

      bottomNavigationBar: Container(
  color: const Color(0xff0B132B),
  child: BottomNavigationBar(
    backgroundColor: const Color(0xff0B132B),
    selectedItemColor: const Color(0xff00D4FF),
    unselectedItemColor: Colors.white54,
    type: BottomNavigationBarType.fixed,
    elevation: 0,
    items: const [
      BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
      BottomNavigationBarItem(icon: Icon(Icons.wallet), label: "Wallet"),
      BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: "Stats"),
      BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
    ],
  ),
),
    );
  }
}

class ServiceTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback? onTap;

  const ServiceTile({
    super.key,
    required this.icon,
    required this.title,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [

          Container(
            height: 65,
            width: 65,
            decoration: BoxDecoration(
              color: const Color(0xff121A2D),
              borderRadius: BorderRadius.circular(18),
              border: Border.all(color: Colors.white10),
            ),
            child: Icon(
              icon,
              color: const Color(0xff00D4FF),
              size: 30,
            ),
          ),

          const SizedBox(height: 8),

          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}