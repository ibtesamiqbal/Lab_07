import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: DatabasePage(),
    );
  }
}

class DatabasePage extends StatefulWidget {
  const DatabasePage({super.key});

  @override
  _DatabasePageState createState() => _DatabasePageState();
}

class _DatabasePageState extends State<DatabasePage> {
  List<String> _data = [];
  bool _isLoading = false;

  Future<void> _fetchDataFromDatabase() async {
    setState(() {
      _isLoading = true;
    });

    await Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _data = [
          'Item 1 from Database',
          'Item 2 from Database',
          'Item 3 from Database',
          'Item 4 from Database',
          'Item 5 from Database',
        ];
        _isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Database Query'),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child: _isLoading
            ? const CircularProgressIndicator(
                color: Colors.deepPurple,
              )
            : _data.isEmpty
                ? ElevatedButton(
                    onPressed: _fetchDataFromDatabase,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 15,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      'Fetch Data',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                : Container(
                    padding: const EdgeInsets.all(10.0),
                    margin: const EdgeInsets.symmetric(horizontal: 20.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: _data.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(
                            _data[index],
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.black87,
                            ),
                          ),
                          leading: const Icon(
                            Icons.storage,
                            color: Colors.deepPurple,
                          ),
                          tileColor: Colors.grey[200],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 15,
                            vertical: 10,
                          ),
                        );
                      },
                    ),
                  ),
      ),
    );
  }
}
