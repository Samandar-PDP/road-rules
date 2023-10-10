import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:road_rules/db/sql_helper.dart';
import 'package:road_rules/rule.dart';

class AddUpdateScreen extends StatefulWidget {
  const AddUpdateScreen({super.key});

  @override
  State<AddUpdateScreen> createState() => _AddUpdateScreenState();
}

class _AddUpdateScreenState extends State<AddUpdateScreen> {
  final _picker = ImagePicker();
  File? _file;
  final _nameController = TextEditingController();
  final _descController = TextEditingController();
  final _typeController = TextEditingController();

  void _saveRule() async {
    await SqlHelper.saveRule(Rule(null,
        title: _nameController.text,
        path: _file?.path ?? "",
        desc: _descController.text,
        type: _typeController.text));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Yo'l belgisini qo'shish"),
      ),
      body: SingleChildScrollView(
        child: Padding(
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
                        border: Border.all(width: 2, color: Colors.grey),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(6))),
                    child: Center(
                      child: _file == null
                          ? const Icon(Icons.image)
                          : Image.file(
                              _file!,
                              fit: BoxFit.cover,
                            ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                    "Yo’l belgisining rasmini qo’shish uchun rasm ustiga bosing"),
                const SizedBox(height: 20),
                SizedBox(
                  height: 60,
                  child: TextField(
                    controller: _nameController,
                    onChanged: (value) {
                      ScaffoldMessenger.of(context).clearMaterialBanners();
                    },
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.black12,
                      hintText: 'Nomi',
                    ),
                  ),
                ),
                SizedBox(
                  height: 300,
                  child: TextField(
                    controller: _descController,
                    decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 100, horizontal: 12),
                        fillColor: Colors.black12,
                        filled: true,
                        hintText: "Ta'rifi"),
                  ),
                ),
                SizedBox(
                  height: 60,
                  child: TextField(
                    controller: _typeController,
                    decoration: InputDecoration(
                        fillColor: Colors.black12,
                        filled: true,
                        hintText: "Qaysi turga kirishi"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: ElevatedButton(
        onPressed: () {
          if (_file != null && _nameController.text.isNotEmpty) {
            _saveRule();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Saqlandi"))
            );
            Navigator.of(context).pop();
          } else {
            ScaffoldMessenger.of(context).showMaterialBanner(MaterialBanner(
                content: Text("Ma'lumotlarni to'ldiring!"),
                backgroundColor: Colors.red,
                actions: [
                  TextButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).clearMaterialBanners();
                      },
                      child: Text("Ok"))
                ]));
          }
        },
        child: const Text("Saqlash"),
      ),
    );
  }

  void _getImageFromGallery() async {
    final image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _file = File(image.path);
      });
    }
  }
}
