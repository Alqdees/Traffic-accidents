import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late PermissionStatus _cameraPermissionStatus;
  TextEditingController date = TextEditingController(
    text: '${DateTime.now().year}'
        ' - '
        '${DateTime.now().month}'
        ' - '
        '${DateTime.now().day}',
  );
  TextEditingController name1 = TextEditingController();
  TextEditingController number1 = TextEditingController();
  TextEditingController name2 = TextEditingController();
  TextEditingController number = TextEditingController();

  @override
  void initState() {
    super.initState();

    _requestCameraPermission();
  }

  Future<void> _requestCameraPermission() async {
    final status = await Permission.camera.request();
    setState(() {
      _cameraPermissionStatus = status;
    });
  }

  File? _image;

  // final picker = ImagePicker();
  // final pickedImage = await picker.pickImage(source: ImageSource.camera);
  Future<void> getImageFromCamera() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.camera);
    setState(() {
      if (pickedImage != null) {
        _image = File(pickedImage.path);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Traffic accidents'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Text("صمم بواسطة حيدر صادق و زينه لؤي و علي صبحي "),
            const SizedBox(
              height: 8,
            ),
            TextField(
              controller: date,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "تاريخ الحادث ",
                  hintStyle: TextStyle(color: Colors.blue)),
            ),
            const TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "اسم السائق الاول",
                  hintStyle: TextStyle(color: Colors.black),
                  icon: Icon(Icons.person),
                  iconColor: Colors.black),
            ),
            const TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "رقم المركبة السائق الاول",
                hintStyle: TextStyle(color: Colors.black),
              ),
            ),
            const TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "اسم السائق الثاني ",
                  hintStyle: TextStyle(color: Colors.red),
                  icon: Icon(Icons.person),
                  iconColor: Colors.red),
            ),
            const TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "رقم المركبة السائق الثاني",
                  hintStyle: TextStyle(color: Colors.red)),
            ),
            const SizedBox(
              height: 12.0,
            ),
            _image == null
                ? const Text('No image selected.')
                : Image.file(_image!),
            OutlinedButton(
              onPressed: getImageFromCamera,
              child: const Text('Open Camera'),
            ),
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(onPressed: ),
    );
  }
}
