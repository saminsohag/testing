import 'package:flutter/material.dart';
import 'package:testing/settings_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Contact> contacts = [
    const Contact("Limon", "12345"),
    const Contact("Sohag", "1234"),
  ];
  int _index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        centerTitle: false,
        actions: [
          const Icon(Icons.search),
          const SizedBox(
            width: 10,
          ),
          FilledButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const SettingsPage(),
                ),
              );
            },
            child: const Icon(Icons.settings),
          ),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
      body: [
        HomeBody(contacts: contacts),
        const ContactsBody(),
        const MessagesBody(),
      ][_index],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            contacts.add(const Contact("new", "2245"));
          });
        },
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (newIndex) {
          setState(() {
            _index = newIndex;
          });
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          NavigationDestination(
            icon: Icon(Icons.contacts),
            label: "Contacts",
          ),
          NavigationDestination(
            icon: Icon(Icons.message),
            label: "Messeges",
          ),
        ],
      ),
    );
  }
}

class HomeBody extends StatefulWidget {
  const HomeBody({super.key, required this.contacts});
  final List<Contact> contacts;

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.contacts.length,
      itemBuilder: (context, i) => ContactTile(
          name: widget.contacts[i].name, phone: widget.contacts[i].phone),
    );
  }
}

class ContactsBody extends StatelessWidget {
  const ContactsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text("Contacts");
  }
}

class MessagesBody extends StatelessWidget {
  const MessagesBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text("Messages");
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
