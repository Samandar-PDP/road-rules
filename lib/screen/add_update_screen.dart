import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddUpdateScreen extends StatefulWidget {
  const AddUpdateScreen({super.key});

  @override
  State<AddUpdateScreen> createState() => _AddUpdateScreenState();
}

class _AddUpdateScreenState extends State<AddUpdateScreen> {

  final _picker = ImagePicker();
  File? _file;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Yo'l belgisini qo'shish"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  _getImageFromGallery();
                },
                child: Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                    border: Border.all(width: 2,color: Colors.grey),
                    borderRadius: const BorderRadius.all(Radius.circular(6))
                  ),
                  child: Center(
                    child: _file == null ? const Icon(Icons.image) : Image.file(_file!,fit: BoxFit.cover,),
                  ),
                ),
              ),
              const  SizedBox(height: 10),
              Text(
                "Yo’l belgisining rasmini qo’shish uchun rasm ustiga bosing"
              ),
              const SizedBox(height: 20),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.black12,
                    hintText: 'Nomi',
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: TextField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 100,horizontal: 12),
                    fillColor: Colors.black12,
                      filled: true,
                      hintText: "Ta'rifi"
                  ),
                ),
              ),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                      fillColor: Colors.black12,
                      filled: true,
                      hintText: "Qaysi turga kirishi"
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: ElevatedButton(
        onPressed: ()  {},
        child: const Text("Saqlash"),
      ),
    );
  }
  void _getImageFromGallery() async {
    final image = await _picker.pickImage(source: ImageSource.gallery);
    if(image != null) {
      setState(() {
        _file = File(image.path);
      });
    }
  }
}
