import 'package:flutter/material.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff060B16),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [

              // TOP BAR
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 15,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Welcome Back",
                          style: TextStyle(
                            color: Colors.white54,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "VAULTIQ",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.notifications_none,
                            color: Color(0xff00D4FF),
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.person_outline,
                            color: Color(0xff00D4FF),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // BALANCE CARD
              Container(
                margin: const EdgeInsets.all(16),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xff00D4FF),
                      Color(0xff7F00FF),
                    ],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blue.withOpacity(.3),
                      blurRadius: 20,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Text(
                      "Available Balance",
                      style: TextStyle(
                        color: Colors.white70,
                      ),
                    ),

                    SizedBox(height: 12),

                    Text(
                      "PKR 250,000",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(height: 25),

                    Row(
                      mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Account No",
                          style: TextStyle(
                            color: Colors.white70,
                          ),
                        ),
                        Text(
                          "**** 5678",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 10),

              // QUICK ACTIONS
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

              const SizedBox(height: 20),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: GridView.count(
                  shrinkWrap: true,
                  physics:
                      const NeverScrollableScrollPhysics(),
                  crossAxisCount: 3,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 15,
                  childAspectRatio: .9,
                  children: const [

                    ServiceTile(
                      icon: Icons.send,
                      title: "Send Money",
                    ),

                    ServiceTile(
                      icon: Icons.receipt_long,
                      title: "Bills & Topup",
                    ),

                    ServiceTile(
                      icon: Icons.credit_card,
                      title: "Cards",
                    ),

                    ServiceTile(
                      icon: Icons.savings,
                      title: "Savings",
                    ),

                    ServiceTile(
                      icon: Icons.payments,
                      title: "Payments",
                    ),

                    ServiceTile(
                      icon: Icons.account_balance,
                      title: "Banking",
                    ),

                    ServiceTile(
                      icon: Icons.security,
                      title: "Security",
                    ),

                    ServiceTile(
                      icon: Icons.feedback_outlined,
                      title: "Feedback",
                    ),

                    ServiceTile(
                      icon: Icons.settings,
                      title: "Settings",
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 25),

              // RECENT TRANSACTION
              Container(
                margin: const EdgeInsets.all(16),
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: const Color(0xff121A2D),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [

                    const Row(
                      mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Recent Transactions",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "View All",
                          style: TextStyle(
                            color: Color(0xff00D4FF),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 15),

                    transactionTile(
                      Icons.arrow_upward,
                      "Transfer Sent",
                      "- PKR 10,000",
                    ),

                    transactionTile(
                      Icons.arrow_downward,
                      "Salary Received",
                      "+ PKR 80,000",
                    ),

                    transactionTile(
                      Icons.shopping_bag,
                      "Online Shopping",
                      "- PKR 2,500",
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

      // BOTTOM NAVIGATION
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xff0B132B),
        selectedItemColor: const Color(0xff00D4FF),
        unselectedItemColor: Colors.white54,
        type: BottomNavigationBarType.fixed,
        items: const [

          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet),
            label: "Wallet",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: "Stats",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
      ),
    );
  }

  static Widget transactionTile(
    IconData icon,
    String title,
    String amount,
  ) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: CircleAvatar(
        backgroundColor: const Color(0xff1C2541),
        child: Icon(
          icon,
          color: const Color(0xff00D4FF),
        ),
      ),
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
      trailing: Text(
        amount,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class ServiceTile extends StatelessWidget {
  final IconData icon;
  final String title;

  const ServiceTile({
    super.key,
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        Container(
          height: 65,
          width: 65,
          decoration: BoxDecoration(
            color: const Color(0xff121A2D),
            borderRadius: BorderRadius.circular(18),
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
            color: Colors.white,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}