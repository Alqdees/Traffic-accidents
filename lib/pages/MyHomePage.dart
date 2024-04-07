import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
    
class MyHomePage extends StatelessWidget {

  const MyHomePage({ Key? key }) : super(key: key);
  
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
                const TextField(
                  decoration: InputDecoration(
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
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "رقم المركبة السائق الاول",
                    hintStyle: TextStyle(color: Colors.black),
                  ),
                ),
                TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "اسم السائق الثاني ",
                      hintStyle: TextStyle(color: Colors.red),
                      icon: Icon(Icons.person),
                      iconColor: Colors.red),
                ),
                TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "رقم المركبة السائق الثاني",
                      hintStyle: TextStyle(color: Colors.red)),
                ),
                const SizedBox(
                  height: 12.0,
                ),
                OutlinedButton(
                    onPressed: () async {
                      final ImagePicker picker = ImagePicker();
                      final LostDataResponse response =
                          await picker.retrieveLostData();
                      if (response.isEmpty) {
                        return;
                      }
                      final List<XFile>? files = response.files;
                      if (files != null) {
                        // _handleLostFiles(files);
                      } else {
                        // _handleError(response.exception);
                      }
                    },
                    child: const Text('Open Camera')),
              ],
        ),
      ),
      floatingActionButton :FloatingActionButton(onPressed: ()async {
        
      }),
    );
  }
}