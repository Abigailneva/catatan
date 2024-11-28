import 'package:catatan/screen/Tambah_Catatan.dart';
import 'package:flutter/material.dart';

class AddCatatan extends StatelessWidget {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
       title: const Text(
        "Isi Catatan",
        style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          color: Colors.white, 
        ),
      ),
      backgroundColor: const Color(0xFF6E62E5), 
      elevation: 0,
     leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white), // Tanda panah
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => TambahCatatan()),
            );
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.check,
              color: Colors.white, // Warna ikon
            ),
          onPressed: () {
            String title = titleController.text;
            String content = contentController.text;

            print("Judul: $title");
            print("Isi: $content");

            titleController.clear();
            contentController.clear();

             Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TambahCatatan()),
              );
          },
        ),
      ],
      iconTheme: const IconThemeData(
        color: Colors.white, 
      ),
    ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Judul",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: titleController,
              decoration: InputDecoration(
                hintText: "Masukkan judul catatan...",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              "Isi Catatan",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: TextField(
                controller: contentController,
                maxLines: null,
                expands: true,
                keyboardType: TextInputType.multiline,
                textAlignVertical: TextAlignVertical.top, 
                decoration: InputDecoration(
                  hintText: "Tulis isi catatan di sini...",
                  alignLabelWithHint: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
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
