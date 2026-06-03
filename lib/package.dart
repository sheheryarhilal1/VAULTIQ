import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SimPackagesScreen(),
    );
  }
}

class SimPackagesScreen extends StatefulWidget {
  @override
  State<SimPackagesScreen> createState() => _SimPackagesScreenState();
}

class _SimPackagesScreenState extends State<SimPackagesScreen> {
  String? selectedSim;

  final Map<String, List<Map<String, String>>> packages = {
    "Jazz": [
      {
        "name": "Monthly Mega",
        "price": "Rs. 1000",
        "validity": "30 Days",
        "details": "100 GB Internet + 5000 Minutes"
      },
      {
        "name": "Monthly Supreme",
        "price": "Rs. 1500",
        "validity": "30 Days",
        "details": "200 GB Internet + Unlimited Calls"
      },
    ],
    "Zong": [
      {
        "name": "Monthly Pro",
        "price": "Rs. 1200",
        "validity": "30 Days",
        "details": "120 GB Internet + 5000 SMS"
      },
    ],
    "Telenor": [
      {
        "name": "Easy Card",
        "price": "Rs. 750",
        "validity": "30 Days",
        "details": "50 GB Internet + Calls"
      },
    ],
    "Ufone": [
      {
        "name": "Super Card",
        "price": "Rs. 999",
        "validity": "30 Days",
        "details": "100 GB Internet + All Network Minutes"
      },
    ],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SIM Packages"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                labelText: "Select SIM",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              value: selectedSim,
              items: packages.keys.map((sim) {
                return DropdownMenuItem(
                  value: sim,
                  child: Text(sim),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedSim = value;
                });
              },
            ),

            const SizedBox(height: 20),

            if (selectedSim != null)
              Expanded(
                child: ListView.builder(
                  itemCount: packages[selectedSim]!.length,
                  itemBuilder: (context, index) {
                    final package = packages[selectedSim]![index];

                    return Card(
                      elevation: 4,
                      margin: const EdgeInsets.only(bottom: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: ListTile(
                        contentPadding: const EdgeInsets.all(15),
                        title: Text(
                          package["name"]!,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 8),
                            Text("Price: ${package["price"]}"),
                            Text("Validity: ${package["validity"]}"),
                            Text("Details: ${package["details"]}"),
                          ],
                        ),
                        trailing: ElevatedButton(
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  "${package["name"]} Selected",
                                ),
                              ),
                            );
                          },
                          child: const Text("Buy"),
                        ),
                      ),
                    );
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}