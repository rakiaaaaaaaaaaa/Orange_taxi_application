import 'package:flutter/material.dart';

class CarInfoScreen extends StatefulWidget {
  const CarInfoScreen({super.key});

  @override
  State<CarInfoScreen> createState() => _CarInfoScreenState();
}

class _CarInfoScreenState extends State<CarInfoScreen> {
  final TextEditingController modelController = TextEditingController();
  final TextEditingController matriculeController = TextEditingController();
  final TextEditingController colorController = TextEditingController();

  @override
  void dispose() {
    modelController.dispose();
    matriculeController.dispose();
    colorController.dispose();
    super.dispose();
  }

  void _submitCarInfo() {
    final model = modelController.text.trim();
    final matricule = matriculeController.text.trim();
    final color = colorController.text.trim();

    if (model.isEmpty || matricule.isEmpty || color.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please fill in all fields.")),
      );
      return;
    }

    // Submit logic here
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Submitted: $model, $matricule, $color")),
    );

    // Optionally navigate or save the data
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Car Information"),
        backgroundColor: Colors.grey[900],
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Enter Car Details",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30),

            // Car Model
            TextField(
              controller: modelController,
              style: const TextStyle(color: Colors.grey),
              decoration: const InputDecoration(
                labelText: "Car Model",
                labelStyle: TextStyle(color: Colors.grey),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Matricule
            TextField(
              controller: matriculeController,
              style: const TextStyle(color: Colors.grey),
              decoration: const InputDecoration(
                labelText: "Matricule",
                labelStyle: TextStyle(color: Colors.grey),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Color
            TextField(
              controller: colorController,
              style: const TextStyle(color: Colors.grey),
              decoration: const InputDecoration(
                labelText: "Color",
                labelStyle: TextStyle(color: Colors.grey),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
              ),
            ),
            const SizedBox(height: 30),

            Center(
              child: ElevatedButton(
                onPressed: _submitCarInfo,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  "Submit",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
