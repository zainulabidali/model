import 'package:flutter/material.dart';

class AddItems extends StatefulWidget {
  const AddItems({super.key});

  @override
  State<AddItems> createState() => _AddItemsState();
}

class _AddItemsState extends State<AddItems> {
  final TextEditingController _namecontroller = TextEditingController();
  final TextEditingController _subnamecontroller = TextEditingController();

  @override
  void dispose() {
    _namecontroller.dispose();
    _subnamecontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            "assets/bg imsg.jpg",
            fit: BoxFit.fill,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                const Text(
                  "Add items",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                TextField(
                  controller: _namecontroller,
                  decoration: InputDecoration(
                    labelText: "Enter Item Name",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: _subnamecontroller,
                  decoration: InputDecoration(
                    labelText: "Enter Item SubName",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                ElevatedButton(
                  onPressed: () {
                    if (_namecontroller.text.isNotEmpty &&
                        _subnamecontroller.text.isNotEmpty) {
                      final newItem = {
                        "name": _namecontroller.text,
                        "subname": _subnamecontroller.text,
                      };
                      Navigator.pop(context, newItem); // Pass data back
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Please fill in both fields."),
                          backgroundColor: Colors.red,
                        ),
                      );
                    }
                  },
                  child: const Text(
                    "Save",
                    style: TextStyle(color: Colors.pink),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
