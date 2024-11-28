import 'package:catatan/screen/Add_Catatan.dart';
import 'package:flutter/material.dart';
import 'package:catatan/screen/Isi_Catatan.dart';

class TambahCatatan extends StatefulWidget {
  @override
  _TambahCatatanState createState() => _TambahCatatanState();
}

class _TambahCatatanState extends State<TambahCatatan> {
  // List of notes
  List<Map<String, String>> notes = [
    {"title": "Jurnal Perasaan", "description": "Hari ini cukup berat, tapi aku belajar hal baru", "date": "13 Desember 2024"},
    {"title": "Tujuan Jangka Pendek", "description": "Selesaikan tugas matematika hari ini.", "date": "7 Juli 2024"},
    {"title": "Daftar Buku yang Ingin Kubaca", "description": "Buku ‘Sapiens’ di daftar bacaan bulan ini.", "date": "13 Desember 2024"},
    {"title": "Rencana Mingguan", "description": "Senin: Belajar bahasa Inggris 1 jam.", "date": "13 Desember 2024"},
  ];

  void _deleteNote(int index) {
    setState(() {
      notes.removeAt(index); 
    });
  }
Widget _buildNote({
  required String title,
  required String description,
  required String date,
  required Function() onDelete,
}) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => IsiCatatan(
            title: title,
            description: description,
            date: date,
          ),
        ),
      );
    },
    child: Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: Color(0xff6E62E5),
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0xff4a4a4a),
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  date,
                  style: TextStyle(
                    fontSize: 10,
                    color: Color(0xff6E62E5),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              _showDeleteConfirmationDialog(context, onDelete);
            },
            child: Icon(Icons.delete, color: Color(0xff6E62E5)),
          ),
        ],
      ),
    ),
  );
}

  void _showDeleteConfirmationDialog(BuildContext context, Function() onDelete) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Konfirmasi Penghapusan"),
          content: Text("Apakah Anda yakin ingin menghapus catatan ini?"),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); 
              },
              child: Text("Batal"),
            ),
            TextButton(
              onPressed: () {
                onDelete(); 
                Navigator.of(context).pop();
              },
              child: Text("Yakin"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff3f3f3),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 35, 0, 0),
              child: Text(
                "Catatan",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 30,
                  color: Color(0xff000000),
                ),
              ),
            ),
            SizedBox(height: 0),

          
            Expanded(
              child: ListView.builder(
                itemCount: notes.length,
                itemBuilder: (context, index) {
                  return _buildNote(
                    title: notes[index]['title']!,
                    description: notes[index]['description']!,
                    date: notes[index]['date']!,
                    onDelete: () => _deleteNote(index),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 50.0),
        child: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AddCatatan()),
            );
          },
          backgroundColor: Color(0xff6E62E5),
          child: Icon(Icons.add, color: Colors.white),
          shape: CircleBorder(),
        ),
      ),
    );
  }
}
