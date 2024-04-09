import 'dart:io';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
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
  TextEditingController location = TextEditingController();
  Position? _currentPosition;
  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
    // _requestCameraPermission();
  }

  Future<void> _getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Check if location services are enabled
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      print('Location services are disabled.');
      return;
    }

    // Request location permission
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        print('Location permissions are denied.');
        return;
      }
    }

    // Get the user's current location
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    setState(() {
      _currentPosition = position;
      location.text =
          "${_currentPosition!.latitude} , ${_currentPosition!.longitude}";
      print(
        'object ___________ ${_currentPosition!.latitude} + ${_currentPosition!.longitude}',
      );
    });
  }

  Future<void> _requestCameraPermission() async {
    final status = await Permission.camera.request();
    setState(() {
      _cameraPermissionStatus = status;
      if (_cameraPermissionStatus.isGranted) {
        getImageFromCamera();
      }
    });
  }

  File? _image1, _image2;
  Future<void> getImageFromCamera() async {
    // _requestCameraPermission();
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.camera);
    setState(() {
      if (pickedImage != null) {
        if (_image1 != null) {
          _image2 = File(pickedImage.path);
        }
        _image1 = File(pickedImage.path);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellowAccent,
        title: const Text('Traffic accidents'),
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: () {
              //! here to save data
            },
          ),
        ],
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
              keyboardType: TextInputType.number,
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
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "رقم المركبة السائق الثاني",
                  hintStyle: TextStyle(color: Colors.red)),
            ),
            TextField(
              controller: location,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "لوكيشن الحادث",
                  hintStyle: TextStyle(color: Colors.black),
                  icon: Icon(
                    Icons.location_on,
                  ),
                  iconColor: Colors.black),
            ),
            const SizedBox(
              height: 12.0,
            ),
            _image1 == null
                ? const Text('No image selected.')
                : Image.file(
                    _image1!,
                    width: MediaQuery.sizeOf(context).width - 50,
                    height: MediaQuery.sizeOf(context).height - 200,
                  ),
            const SizedBox(
              height: 20,
              child: Text('ImageTwo '),
            ),
            _image2 == null
                ? const Text('No image selected.')
                : Image.file(
                    _image2!,
                    width: MediaQuery.sizeOf(context).width - 50,
                    height: MediaQuery.sizeOf(context).height - 200,
                  ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _requestCameraPermission,
        backgroundColor: Colors.yellowAccent,
        child: const Icon(
          Icons.camera,
          color: Colors.black,
        ),
      ),
    );
  }
}
