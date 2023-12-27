import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud/firestore.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FireStoreService fireStoreService = FireStoreService();
  final TextEditingController textController = TextEditingController();

  void openNoteBox(String? docID) {
    showDialog(
      context: context,
      builder: (context) =>
          AlertDialog(
            title: Text('Your Notes'),
            content: TextField(
              decoration: InputDecoration(hintText: "write / update your notes"),
              controller: textController,
            ),
            actions: [
              ElevatedButton(
                onPressed: () {
                  if (docID == null) {
                    fireStoreService.addNote(textController.text);
                  } else {
                    fireStoreService.updateNote(docID, textController.text);
                  }
                  textController.clear();
                  Navigator.pop(context);
                },
                child: Text("Add"),
              ),
            ],
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.only(top: 15.0),
          child: Text(
            "Notes",
            style: TextStyle(color: Colors.white),
          ),
        ),
        backgroundColor: Colors.indigoAccent.shade200,
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 25, 120),
        child: SizedBox(
          width: 70,
          height: 70,
          child: FloatingActionButton(
            onPressed: () => openNoteBox(null),
            child: const Icon(Icons.add),
          ),
        ),
      ),
      backgroundColor: Colors.blue.shade50,
      body: StreamBuilder<QuerySnapshot>(
        stream: fireStoreService.getNotesStream(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List notesList = snapshot.data!.docs;

            if (notesList.isEmpty) {
              // Display a message with a picture when there are no notes
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/empty.png',
                      // Replace with the actual image path
                      width: 150,
                      height: 150,
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      "No notes available",
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              );
            }

            return ListView.builder(
              itemCount: notesList.length,
              itemBuilder: (context, index) {
                DocumentSnapshot doc = notesList[index];
                String docID = doc.id;
                Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
                String noteText = data['note'];

                return ListTile(
                  title: Text(noteText),
                  trailing: SizedBox(
                    width: 100, // Adjust the width as needed
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () => openNoteBox(docID),
                          icon: const Icon(Icons.settings),
                        ),
                        IconButton(
                          onPressed: () => fireStoreService.deleteNote(docID),
                          icon: const Icon(Icons.delete),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}