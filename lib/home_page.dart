import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Contact> contacts = [
    Contact("Limon", "12345"),
    Contact("Sohag", "1234"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        centerTitle: false,
        actions: const [
          Icon(Icons.search),
          SizedBox(
            width: 10,
          ),
          Icon(Icons.settings),
          SizedBox(
            width: 10,
          ),
        ],
      ),
      body: ListView(
        children: [
          for (int i = 0; i < contacts.length; i++) ...[
            ContactTile(name: contacts[i].name, phone: contacts[i].phone),
          ]
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            contacts.add(Contact("new", "2245"));
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class ContactTile extends StatelessWidget {
  const ContactTile({super.key, required this.name, required this.phone});
  final String name;
  final String phone;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(name),
        subtitle: Text(phone),
        leading: const Icon(Icons.account_circle_rounded),
        trailing: const Icon(Icons.call),
      ),
    );
  }
}

class Contact {
  const Contact(this.name, this.phone);
  final String name;
  final String phone;
}
