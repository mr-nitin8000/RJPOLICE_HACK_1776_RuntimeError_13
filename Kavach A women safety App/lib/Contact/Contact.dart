import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:fluttercontactpicker/fluttercontactpicker.dart';
import 'package:proui/ColorApp.dart';

class Contact {
  final String name;
  final String phoneNumber;

  Contact({required this.name, required this.phoneNumber});

  factory Contact.fromJson(Map<String, dynamic> json) {
    return Contact(name: json['name'], phoneNumber: json['phoneNumber']);
  }

  Map<String, dynamic> toJson() {
    return {'name': name, 'phoneNumber': phoneNumber};
  }
}

class ContactListScreen extends StatefulWidget {
  @override
  _ContactListScreenState createState() => _ContactListScreenState();
}

class _ContactListScreenState extends State<ContactListScreen> {
  final List<Contact> contacts = [];

  @override
  void initState() {
    super.initState();
    loadContacts();
  }

  void loadContacts() {
    final box = GetStorage();
    final contactsJsonList = box.read<List>('contacts');

    if (contactsJsonList != null) {
      setState(() {
        contacts.addAll(contactsJsonList.map((contactJson) => Contact.fromJson(contactJson)));
      });
    }
  }

  void saveContacts() {
    final box = GetStorage();
    final contactsJsonList = contacts.map((contact) => contact.toJson()).toList();
    box.write('contacts', contactsJsonList);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List Contact'),
        backgroundColor: canvasColor,
        actions: [
          // IconButton(
          //   onPressed: () async {
          //     setState(() {
          //       contacts.clear();
          //     });
          //     saveContacts();
          //   },
          //     icon: Icon(Icons.delete),)
        ],
      ),
      body: ListView.builder(
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          final contact = contacts[index];
          return Padding(
            padding:EdgeInsets.all(8.0),
            child: Container(
              height: MediaQuery.of(context).size.height*0.1,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
                color: Colors.black,
              ),
              child: Padding(
                padding:EdgeInsets.only(left: 10),
                child: Center(
                  child: ListTile(
                    title: Text(contact.name,style: TextStyle(
                      color: Color(0xFFC59DF5),
                      fontSize: MediaQuery.of(context).size.height*0.025,
                    ),
                    ),
                    subtitle: Padding(
                      padding:EdgeInsets.only(top: 5),
                      child: Text(contact.phoneNumber
                          ,style: TextStyle(
                          color: Color(0xFFC59DF5),
                      fontSize: MediaQuery.of(context).size.height*0.02,
                  ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            tooltip: "Clear List",
            backgroundColor: canvasColor,
            onPressed: () async {
            setState(() {
              contacts.clear();
            });
            saveContacts();
          },
            child: Icon(Icons.delete),

          ),
          SizedBox(height: MediaQuery.of(context).size.height*0.02 ,),
          FloatingActionButton(
            tooltip: "Add Contact",
            backgroundColor: canvasColor,
            onPressed: () async {
              final PhoneContact contact =
              await FlutterContactPicker.pickPhoneContact();
              print(contact);
              final newContact = Contact(name: '${contact!.fullName}', phoneNumber: '${contact!.phoneNumber!.number}');
              setState(() {
                contacts.add(newContact);
              });

              // Save the updated contact list
              saveContacts();
            },
            child: Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
