import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
  TimeOfDay _selectedTime = TimeOfDay.now(); 
  // Default selected time
  // Show a time picker dialog
  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
    );
    if (picked != null && picked != _selectedTime) {
      setState(() {
        _selectedTime = picked;
      });
    }
  }

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
      // print(
      //   'object ___________ ${_currentPosition!.latitude} + ${_currentPosition!.longitude}',
      // );
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

  List<String> itemsList = ['Item1', 'Item2', 'Item3', 'Item4'];
  var v1, v2, v3, v4, v5, v6 ,v7,v8,v9,v10,v11;
bool? hasDriverLicense1,hasDriverLicense2;
  final List<int> numbers = List.generate(86, (index) => index + 14);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellowAccent,
        title: const Text('E_ Accident Report'),
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
            const Text("صمم بواسطة حيدر صادق و زينه لؤي "),
            const SizedBox(
              height:10 ,
            ),
            TextField(
              controller: date,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "تاريخ الحادث ",
                  hintStyle: TextStyle(color: Colors.blue)),
            ),
             Text(
              'Selected Time: ${_selectedTime.format(context)}', // Display the selected time
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _selectTime(context); // Show a time picker dialog
              },
              child: Text('Select Time'),
            ),
            const TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "اسم السائق الاول",
                  hintStyle: TextStyle(color: Colors.black),
                  icon: Icon(Icons.person),
                  iconColor: Colors.black),
            ),
            
            Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'هل السائق لديه رخصة قيادة(اجازة سوق)؟',
                style: TextStyle(fontSize: 18.0),
              ),
              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        hasDriverLicense1 = true;
                      });
                    },
                    child: Text('نعم امتلك رخصة قيادة'),
                  ),
                  SizedBox(width: 20.0),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        hasDriverLicense1 = false;
                      });
                    },
                    child: Text('كلا لا امتلك رخصة قيادة'),
                    
                  ),
                ],
              ),
              SizedBox(height: 20.0),
              if (hasDriverLicense1 != null)
                Text(
                  'السائق لديه رخصة: ${hasDriverLicense1 == true ? "السائق يمتلك رخصة قيادة" : "كلا لايمتلك رخصة قيادة"}',
                  style: TextStyle(fontSize: 18.0),
                ),
            ],
          ),
        ),
        SizedBox(
              width: MediaQuery.sizeOf(context).width - 30,
              child: DropdownButton(
                hint: const Text("عمر السائق"),
                items: ["12",
"13",
"14",
"15",
"16",
"17",
"18",
"19",
"20",
"21",
"22",
"23",
"24",
"25",
"26",
"27",
"28",
"29",
"30",
"31",
"32",
"33",
"34",
"35",
"36",
"37",
"38",
"39",
"40",
"41",
"42",
"43",
"44",
"45",
"46",
"47",
"48",
"49",
"50",
"51",
"52",
"53",
"54",
"55",
"56",
"57",
"58",
"59",
"60",
"61",
"62",
"63",
"64",
"65",
"66",
"67",
"68",
"69",
"70",
"71",
"72",
"73",
"74",
"75",
"76",
"77",
"78",
"79",
"80",
"81",
"82",
"83",
"84",
"85",
"86",
"87",
"88",
]
                    .map((e) => DropdownMenuItem(
                          value: e,
                          child: Text(e),
                        ))
                    .toList(),
                onChanged: (val) {
                  setState(() {
                    v8 = val;
                  });
                },
                value: v8,
              ),
            ),
        
            Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:  [
                    Flexible(
                child: TextField(
                  keyboardType: TextInputType.number, // Specify numeric keyboard
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly // Allow only digits
                  ],
                  decoration: InputDecoration(
                    hintText: 'رقم مركبة السائق الاول ',
                    border: OutlineInputBorder(),
                     icon: Icon(Icons.numbers),
                  ),
                ),
              ), // Text input field
               const SizedBox(width: 10), // Text input field
                      DropdownButton(
              hint: const Text("حرف"),
              items: [
    'ا', 'ب', 'ت', 'ث', 'ج', 'ح', 'خ', 'د', 'ذ', 'ر', 'ز', 'س', 'ش', 'ص', 'ض', 'ط', 'ظ', 'ع', 'غ', 'ف', 'ق', 'ك', 'ل', 'م', 'ن', 'ه', 'و', 'ي'
  ]
                  .map((e) => DropdownMenuItem(
                        value: e,
                        child: Text(e),
                      ))
                  .toList(),
              onChanged: (val) {
                setState(() {
                  v10 = val;
                });
              },

              value: v10,
            ),
            const SizedBox(width: 10), // Text input field
                      DropdownButton(
              hint: const Text("محافظة"),
              items: [
                 '11 بغداد',
                 '12 نينوى',
                 '13 ميسان',
                 '14 البصرة',
                 '15 الأنبار',
                 '16 القادسية',
                 '17 المثنى',
                 '18 بابل',
                 '19 كربلاء',
                 '20 ديالى',
                 '21 السليمانية',
                 '22 أربيل',
                 'حلبجة 23 ',
                 '24 دهوك',
                 '25 كركوك',
                 '26 صلاح الدين',
                 '27 ذي قار',
                 ' 30 النجف',
                 '31 واسط',
              ]
                  .map((e) => DropdownMenuItem(
                        value: e,
                        child: Text(e),
                      ))
                  .toList(),
              onChanged: (val) {
                setState(() {
                  v9 = val;
                });
              },

              value: v9,
            ),
            
                  ],
                ),
            const TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "اسم السائق الثاني ",
                  hintStyle: TextStyle(color: Colors.red),
                  icon: Icon(Icons.person),
                  iconColor: Colors.red),
            ),
            Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'هل السائق لديه رخصة قيادة(اجازة سوق)؟',
                style: TextStyle(fontSize: 18.0),
              ),
              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        hasDriverLicense2 = true;
                      });
                    },
                    child: Text('نعم امتلك رخصة قيادة'),
                  ),
                  SizedBox(width: 20.0),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        hasDriverLicense2 = false;
                      });
                    },
                    child: Text('كلا لا امتلك رخصة قيادة'),
                    
                  ),
                ],
              ),
              SizedBox(height: 20.0),
              if (hasDriverLicense2 != null)
                Text(
                  'السائق لديه رخصة: ${hasDriverLicense2 == true ? "السائق يمتلك رخصة قيادة" : "كلا لايمتلك رخصة قيادة"}',
                  style: TextStyle(fontSize: 18.0),
                ),
            ],
          ),
        ),
        SizedBox(
              width: MediaQuery.sizeOf(context).width - 30,
              child: DropdownButton(
                hint: const Text("عمر السائق"),
                items: ["12",
"13",
"14",
"15",
"16",
"17",
"18",
"19",
"20",
"21",
"22",
"23",
"24",
"25",
"26",
"27",
"28",
"29",
"30",
"31",
"32",
"33",
"34",
"35",
"36",
"37",
"38",
"39",
"40",
"41",
"42",
"43",
"44",
"45",
"46",
"47",
"48",
"49",
"50",
"51",
"52",
"53",
"54",
"55",
"56",
"57",
"58",
"59",
"60",
"61",
"62",
"63",
"64",
"65",
"66",
"67",
"68",
"69",
"70",
"71",
"72",
"73",
"74",
"75",
"76",
"77",
"78",
"79",
"80",
"81",
"82",
"83",
"84",
"85",
"86",
"87",
"88",
]
                    .map((e) => DropdownMenuItem(
                          value: e,
                          child: Text(e),
                        ))
                    .toList(),
                onChanged: (val) {
                  setState(() {
                    v11 = val;
                  });
                },
                value: v11,
              ),
            ),
            Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:  [
                    Flexible(
                child: TextField(
                  keyboardType: TextInputType.number, // Specify numeric keyboard
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly // Allow only digits
                  ],
                  decoration: InputDecoration(
                    hintText: 'رقم مركبة السائق الثاني ',
                    border: OutlineInputBorder(),
                     icon: Icon(Icons.numbers),
                  ),
                ),
              ), // Text input field
               const SizedBox(width: 10), // Text input field
                      DropdownButton(
              hint: const Text("حرف"),
              items: [
    'ا', 'ب', 'ت', 'ث', 'ج', 'ح', 'خ', 'د', 'ذ', 'ر', 'ز', 'س', 'ش', 'ص', 'ض', 'ط', 'ظ', 'ع', 'غ', 'ف', 'ق', 'ك', 'ل', 'م', 'ن', 'ه', 'و', 'ي'
  ]
                  .map((e) => DropdownMenuItem(
                        value: e,
                        child: Text(e),
                      ))
                  .toList(),
              onChanged: (val) {
                setState(() {
                  v7 = val;
                });
              },

              value: v7,
            ),
            const SizedBox(width: 10), // Text input field
                      DropdownButton(
              hint: const Text("محافظة"),
              items: [
                 '11 بغداد',
                 '12 نينوى',
                 '13 ميسان',
                 '14 البصرة',
                 '15 الأنبار',
                 '16 القادسية',
                 '17 المثنى',
                 '18 بابل',
                 '19 كربلاء',
                 '20 ديالى',
                 '21 السليمانية',
                 '22 أربيل',
                 'حلبجة 23 ',
                 '24 دهوك',
                 '25 كركوك',
                 '26 صلاح الدين',
                 '27 ذي قار',
                 ' 30 النجف',
                 '31 واسط',
              ]
                  .map((e) => DropdownMenuItem(
                        value: e,
                        child: Text(e),
                      ))
                  .toList(),
              onChanged: (val) {
                setState(() {
                  v6 = val;
                });
              },

              value: v6,
            ),
            
                  ],
                ),
          //   Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: <Widget>[
          //    // Icon(Icons.favorite, color: Colors.red), // أيقونة
          //     //SizedBox(width: 10), // فاصل أفقي
          //     const TextField(
          //     decoration: const InputDecoration(
          //         border: OutlineInputBorder(),
          //         hintText: "رقم المركبة السائق الثاني",
          //         hintStyle: TextStyle(color: Colors.red),),
          //   ), // نص
          //     const SizedBox(width: 10), // فاصل أفقي
          //      DropdownButton(
          //     hint: const Text("اضاءة "),
          //     items: ["متوسطة", "جيدة", "معدومة"]
          //         .map((e) => DropdownMenuItem(
          //               value: e,
          //               child: Text(e),
          //             ))
          //         .toList(),
          //     onChanged: (val) {
          //       setState(() {
          //         v6 = val;
          //       });
          //     },

          //     value: v6,
          //   ), // نص
          //   ],
          // ),
            TextField(
              controller: location,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "موقع الحادث",
                  hintStyle: TextStyle(color: Colors.black),
                  icon: Icon(
                    Icons.location_on,
                  ),
                  iconColor: Colors.black),
            ),
            const TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "شاهد عيان الاول ان وجد",
                  hintStyle:
                      TextStyle(color: Color.fromARGB(255, 54, 57, 244))),
            ),
             const TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "ايفادة شاهد العيان الاول",
                  hintStyle: TextStyle(color: Color.fromARGB(255, 54, 57, 244))),
            ),
            const TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "شاهد عيان الثاني ان وجد",
                  hintStyle:
                      TextStyle(color: Color.fromARGB(255, 133, 252, 23))),
            ),
            const TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "ايفادة شاهد العيان الثاني ",
                  hintStyle: TextStyle(color: Color.fromARGB(255, 133, 252, 23))),
            ),
            DropdownButton(
              hint: const Text("اضاءة "),
              items: ["متوسطة", "جيدة", "معدومة"]
                  .map((e) => DropdownMenuItem(
                        value: e,
                        child: Text(e),
                      ))
                  .toList(),
              onChanged: (val) {
                setState(() {
                  v1 = val;
                });
              },

              value: v1,
            ),
            SizedBox(
              width: MediaQuery.sizeOf(context).width - 30,
              child: DropdownButton(
                hint: const Text("سطح الطريق "),
                items: ["مبلط ", "غير مبلط ","تبليط رديء "]
                    .map((e) => DropdownMenuItem(
                          value: e,
                          child: Text(e),
                        ))
                    .toList(),
                onChanged: (val) {
                  setState(() {
                    v2 = val;
                  });
                },
                value: v2,
              ),
            ),
            SizedBox(
              width: MediaQuery.sizeOf(context).width - 30,
              child: DropdownButton(
                hint: const Text("الطقس"),
                items: ["معتدل", "ممطر","غائم","ضباب ","غبار"]
                    .map((e) => DropdownMenuItem(
                          value: e,
                          child: Text(e),
                        ))
                    .toList(),
                onChanged: (val) {
                  setState(() {
                    v3 = val;
                  });
                },
                value: v3,
              ),
            ),
            // DropdownButton(

              // hint: const Text("الطقس  "),
              // items: ["معتدل", "ممطر", "غائم", "ضباب ", "غبار"],

              // hint: const Text("وقت وقوع الحادثة "),
              // items: ["ليل","نهار "]

              //     .map((e) => DropdownMenuItem(
            //             value: e,
            //             child: Text(e),
            //           ))
            //       .toList(),
            //   onChanged: (val) {
            //     setState(() {
            //       v3 = val;
            //     });
            //   },
            //   value: v3,
            // ),
            SizedBox(
              width: MediaQuery.sizeOf(context).width - 30,
              child: DropdownButton(
                hint: const Text("وقت وقوع الحادثة   "),
                items: ["ليل", "نهار "]
                    .map((e) => DropdownMenuItem(
                          value: e,
                          child: Text(e),
                        ))
                    .toList(),
                onChanged: (val) {
                  setState(() {
                    v4 = val;
                  });
                },
                value: v4,
              ),
            ),
            SizedBox(
              width: MediaQuery.sizeOf(context).width - 20,
              child: DropdownButton(
                hint: const Text("نوع التصادم "),
                items: ["وجة لوجة", "زاوية ", "خلفي"]
                    .map((e) => DropdownMenuItem(
                          value: e,
                          child: Row(
                            children: [
                              Icon(FontAwesomeIcons.car),
                              Text(e),
                            ],
                          ),
                        ))
                    .toList(),
                onChanged: (val) {
                  setState(() {
                    v5 = val;
                  });
                },
                value: v5,
              ),
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