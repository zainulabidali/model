import 'package:flutter/material.dart';
import 'package:todo/add_items.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final List<Map<String, String>> _items = []; // Store items dynamically

  void _addItem(Map<String, String> newItem) {
    setState(() {
      _items.add(newItem);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              "assets/bg imsg.jpg",
              fit: BoxFit.fill,
            ),
            ListView(
              children: [
                Column(
                  children: [
                    const SizedBox(height: 20),
                    const Text(
                      "Welcome to our app",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 20),
                    _items.isEmpty
                        ? const Center(
                            child: Text(
                              "No items added yet!",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w400),
                            ),
                          )
                        : ListView.builder(
                            shrinkWrap: true,
                            itemCount: _items.length,
                            physics: const BouncingScrollPhysics(),
                            itemBuilder: (BuildContext context, int index) {
                              return ListTile(
                                leading: const Icon(Icons.star),
                                title: Text(
                                  _items[index]['name']!,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                                subtitle: Text(_items[index]['subname']!),
                                trailing: Row(
                                  children: [
                                    IconButton(
                                        onPressed: () {
                                          setState(() {
                                            
                                          
                                          });
                                        },
                                        icon: Icon(Icons.edit_document)),
                                    IconButton(
                                        onPressed: () {
                                          _items.removeAt(index);
                                        },
                                        icon: Icon(Icons.delete_sweep)),
                                  ],
                                ),
                              );
                            },
                          ),
                  ],
                ),
              ],
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            final result = await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const AddItems(),
              ),
            );

            if (result != null && result is Map<String, String>) {
              _addItem(result); // Add the new item to the list
            }
          },
          backgroundColor: Colors.pink, // Custom background color
          child: const Icon(
            Icons.add,
            color: Colors.white, // Icon color
          ),
          tooltip: "Add Item", // Tooltip text when hovered or long-pressed
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      ),
    );
  }
}
