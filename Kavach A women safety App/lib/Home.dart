import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:geocoding/geocoding.dart';
import 'ColorApp.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'Location/CurrentLocation.dart';
import 'package:background_sms/background_sms.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:location/location.dart' as Loc;
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:get_storage/get_storage.dart';
import 'OtherPages/Awarezon.dart';
import 'OtherPages/Complaints.dart';
import 'OtherPages/Training.dart';
import 'package:url_launcher/url_launcher.dart';
import 'Contact/Contact.dart';

class Homefile extends StatefulWidget {
  const Homefile({super.key});

  @override
  State<Homefile> createState() => _HomefileState();
}

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

class _HomefileState extends State<Homefile> {
  final List<Contact> contacts = [];
  final sosData = GetStorage();
  @override
  void initState() {
    super.initState();
    loadContacts();
    if(sosData.read('sosStatus')!=null){
      setState(() {
        activeSos =sosData.read('sosStatus');
      });
    }

  }

  void loadContacts() {
    final box = GetStorage();
    final contactsJsonList = box.read<List>('contacts');

    if (contactsJsonList != null) {
      setState(() {
        contacts.addAll(contactsJsonList
            .map((contactJson) => Contact.fromJson(contactJson)));
      });
    }
  }

  List<Widget Function()> constructorList = [
    () => Training(),
    () => Awarezone(),
    () => Complaints(),
  ];
  String testImage = "assets/training.jpg";
  bool activeSos = false;

  _getPermission() async => await [
        Permission.sms,
      ].request();
  Future<bool> _isPermissionGranted() async =>
      await Permission.sms.status.isGranted;
  _sendMessage(String phoneNumber, String message, {int? simSlot}) async {
    var result = await BackgroundSms.sendMessage(
        phoneNumber: phoneNumber, message: message, simSlot: simSlot);
    if (result == SmsStatus.sent) {
      print("Sent on $phoneNumber");
    } else {
      print("Failed");
    }
  }

  Future<bool?> get _supportCustomSim async =>
      await BackgroundSms.isSupportCustomSim;
  void showPopUpSent() {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        backgroundColor: Colors.purpleAccent,
        icon: Image.asset("assets/gifs/SentGif.gif"),
        title: SizedBox(
          height: 40,
          child: DefaultTextStyle(
            style: TextStyle(
                fontSize: 32.0,
                fontWeight: FontWeight.bold,
                color: Colors.white),
            child: Center(
              child: AnimatedTextKit(
                repeatForever: true,
                pause: Duration(milliseconds: 50),
                animatedTexts: [
                  FadeAnimatedText(
                    'SOS Activated',
                    textStyle: TextStyle(fontWeight: FontWeight.normal),
                  ),
                ],
                onTap: () {
                  print("Tap Event");
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  void showPopUpSave() {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        backgroundColor: Colors.white,
        icon: Image.asset(
          "assets/gifs/safeSoS.gif",
          scale: 0.1,
          height: deviceHeigth() * 0.2,
        ),
        title: SizedBox(
          height: 40,
          child: DefaultTextStyle(
            style: TextStyle(
                fontSize: deviceWidth() * 0.07,
                fontWeight: FontWeight.bold,
                color: Colors.green),
            child: Center(
              child: AnimatedTextKit(
                repeatForever: true,
                pause: Duration(milliseconds: 50),
                animatedTexts: [
                  FadeAnimatedText(
                    'SOS Deactivated',
                    textStyle: TextStyle(fontWeight: FontWeight.normal),
                  ),
                  FadeAnimatedText(
                    'Now you are safe',
                    textStyle: TextStyle(fontWeight: FontWeight.normal),
                  ),
                ],
                onTap: () {
                  print("Tap Event");
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  double deviceWidth() {
    return MediaQuery.of(context).size.width;
  }

  double deviceHeigth() {
    return MediaQuery.of(context).size.height;
  }

  Widget getEmList(String text, String bgPath, int num) {
    return Container(
      height: deviceHeigth() * 0.08,
      decoration: BoxDecoration(
        image: DecorationImage(
          opacity: 0.5,
          image: AssetImage(bgPath),
          fit: BoxFit.cover,
        ),
        color: canvasColor,
        border: Border.all(
          // color: Colors.blueAccent,
          width: 0.1,
        ),
        borderRadius: BorderRadius.circular(10.0),
        // gradient: LinearGradient(
        //     colors: [Colors.purple, Colors.deepPurpleAccent]),
        boxShadow: [
          BoxShadow(
              color: Colors.black38, blurRadius: 10.0, offset: Offset(5.0, 5.0))
        ],
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 20, right: 10, top: 10, bottom: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Row(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      text,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: deviceWidth() * 0.05,
                      ),
                    ),
                    SizedBox(
                      width: deviceWidth() * 0.04,
                    ),
                    Text(
                      "$num",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: deviceWidth() * 0.03,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            IconButton(
              onPressed: () {
                FlutterPhoneDirectCaller.callNumber("$num");
              },
              icon: Icon(Icons.call),
              color: Colors.white,
            )
          ],
        ),
      ),
    );
  }

  void getListEmergency() {
    showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(25.0),
          ),
        ),
        backgroundColor: scaffoldBackgroundColor,
        builder: (BuildContext context) {
          return Padding(
            padding: EdgeInsets.only(
                top: 20,
                left: 5,
                right: 5,
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: ListView(
              children: [
                Text(
                  "Emergency Helplines",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: deviceWidth() * 0.05,
                      color: Colors.purple),
                ),
                SizedBox(
                  height: deviceHeigth() * 0.02,
                ),
                getEmList("Traffic Police",
                    "assets/icons/backgrounds/helpline.jpg", 1095),
                SizedBox(
                  height: deviceHeigth() * 0.02,
                ),
                getEmList("Emergency Services",
                    "assets/icons/backgrounds/police.jpg", 108),
                SizedBox(
                  height: deviceHeigth() * 0.02,
                ),
                getEmList("Child Helpline",
                    "assets/icons/backgrounds/firevan.jpg", 1098),
                SizedBox(
                  height: deviceHeigth() * 0.02,
                ),
                getEmList("Cyber Crime",
                    "assets/icons/backgrounds/hospital.jpg", 1930),
                SizedBox(
                  height: deviceHeigth() * 0.02,
                ),
                SizedBox(
                  height: deviceHeigth() * 0.02,
                ),
                getEmList("Women Helpline",
                    "assets/icons/backgrounds/helpline.jpg", 1091),
                SizedBox(
                  height: deviceHeigth() * 0.02,
                ),
                getEmList("Police", "assets/icons/backgrounds/police.jpg", 100),
                SizedBox(
                  height: deviceHeigth() * 0.02,
                ),
                getEmList("Fire Brigade",
                    "assets/icons/backgrounds/firevan.jpg", 101),
                SizedBox(
                  height: deviceHeigth() * 0.02,
                ),
                getEmList(
                    "Ambulance", "assets/icons/backgrounds/hospital.jpg", 101),
                SizedBox(
                  height: deviceHeigth() * 0.02,
                ),
              ],
            ),
          );
        });
  }

  Widget getOtherPagesContainer(
      String name, String bgPath, int num, Color paint, String iconPath) {
    /*
    Center(
            child: Padding(
              padding: EdgeInsets.only(
                top: 5,
                bottom: 5,
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    getOtherPagesContainer("training","training",Icons.model_training),
                    getOtherPagesContainer("AwareZone","aware",Icons.bolt),
                    getOtherPagesContainer("Self Complaints","right",Icons.message_outlined),
                  ],
                ),
              ),
            ),
          ),
     */
    return Padding(
      padding: EdgeInsets.only(
        left: 10,
        right: 10,
        bottom: 15,
      ),
      child: Container(
        height: deviceHeigth() * 0.14,
        width: deviceWidth() * 0.48,
        decoration: BoxDecoration(
            image: DecorationImage(
              opacity: 0.5,
              image: AssetImage(bgPath),
              fit: BoxFit.cover,
            ),
            color: paint,
            border: Border.all(
              // color: Colors.blueAccent,
              width: 0.1,
            ),
            borderRadius: BorderRadius.circular(10.0),
            // gradient: LinearGradient(
            //     colors: [Colors.purple, Colors.deepPurpleAccent]),
            boxShadow: [
              BoxShadow(
                  color: Colors.black38,
                  blurRadius: 10.0,
                  offset: Offset(5.0, 5.0))
            ]),
        child: GestureDetector(
          child: ListView(
            children: [
              SizedBox(
                height: deviceHeigth() * 0.0124,
              ),
              Image.asset(
                iconPath,
                height: deviceHeigth() * 0.045,
              ),
              SizedBox(
                height: deviceHeigth() * 0.006,
              ),
              Center(
                child: Text(
                  name,
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
              ),
              SizedBox(
                height: deviceHeigth() * 0.002,
              ),
              Center(
                child: Text(
                  "$num",
                  style: TextStyle(
                      fontSize: deviceWidth() * 0.063,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          onTap: () {
            FlutterPhoneDirectCaller.callNumber("$num");
          },
        ),
      ),
    );
  }

  Widget getSliderContainer(
      String name, String bg, IconData icon, int selectedIndex) {
    return Container(
      margin: EdgeInsets.only(
        top: 0,
        bottom: 15,
        right: 6,
        left: 6,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        image: DecorationImage(
          opacity: 0.5,
          image: AssetImage('assets/$bg.jpg'),
          fit: BoxFit.cover,
        ),
        color: canvasColor,
        boxShadow: [
          BoxShadow(
              color: Colors.black38, blurRadius: 10.0, offset: Offset(5.0, 5.0))
        ],
      ),
      child: GestureDetector(
        child: ListView(
          children: [
            SizedBox(
              height: deviceHeigth() * 0.056,
            ),
            Icon(
              icon,
              size: deviceHeigth() * 0.068,
              color: Colors.white,
            ),
            Center(
              child: Text(
                name,
                style: TextStyle(
                    fontSize: deviceHeigth() * 0.030, color: Colors.white),
              ),
            ),
            SizedBox(
              height: deviceHeigth() * 0.025,
            )
          ],
        ),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => constructorList[selectedIndex]()));
        },
      ),
    );
  }

  Widget getExploreNearby(String iconPath, String name, String query) {
    return Padding(
      padding: EdgeInsets.only(
        top: 0,
        left: 20,
        right: 20,
        bottom: 2,
      ),
      child: Container(
        decoration: BoxDecoration(
          // color: Colors.white,
          // border: Border.all(
          //   // color: Colors.blueAccent,
          //   width: 0.1,
          // ),

          borderRadius: BorderRadius.circular(10.0),
        ),
        // color: Colors.red,
        child: Padding(
          padding: EdgeInsets.only(
            left: 5,
            top: 0,
            bottom: 5,
            right: 5,
          ),
          child: Column(
            children: [
              Container(
                height: deviceHeigth() * 0.08,
                width: deviceWidth() * 0.15,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black38,
                      blurRadius: 10.0,
                      offset: Offset(4.0, 4.0),
                    )
                  ],
                  color: Colors.white,
                  border: Border.all(
                    // color: Colors.blueAccent,
                    width: 0.1,
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: IconButton(
                  onPressed: () async {
                    try {
                      Uri u = Uri.parse(
                          'https://www.google.com/maps/search/?api=1&query=$query');
                      if (await canLaunchUrl(u)) {
                        await launchUrl(
                          u,
                          mode: LaunchMode.externalApplication,
                        );
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Opening Map"),
                          ),
                        );
                      } else {
                        SnackBar(
                          content:
                              Text("Error Occured!! Cant' load this function"),
                        );
                      }
                    } catch (e) {
                      SnackBar(
                        content: Text("$e"),
                      );
                    }
                  },
                  icon: Image.asset(
                    iconPath,
                    height: deviceHeigth() * 0.045,
                  ),
                ),
              ),
              SizedBox(
                height: deviceHeigth() * 0.009,
              ),
              Text(
                name,
                style: TextStyle(fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ),
    );
  }

  void getNearBy() {
    showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(25.0),
          ),
        ),
        backgroundColor: scaffoldBackgroundColor,
        builder: (BuildContext context) {
          return Padding(
            padding: EdgeInsets.only(
                top: 20,
                left: 5,
                right: 5,
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Explore Nearby",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: deviceWidth() * 0.05,
                      color: Colors.purple),
                ),
                SizedBox(
                  height: deviceHeigth() * 0.03,
                ),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      getExploreNearby(
                          "assets/icons/location/locationPolice.png",
                          "Police",
                          "Police Station Nearby Me"),
                      getExploreNearby(
                          "assets/icons/location/locationhospital.png",
                          "Hospitals",
                          "Hospitals nearby me"),
                    ],
                  ),
                ),
                SizedBox(
                  height: deviceHeigth() * 0.03,
                ),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      getExploreNearby("assets/icons/location/locationBus.png",
                          "Bus Station", "Bus station Nearby me"),
                      getExploreNearby(
                          "assets/icons/location/locationPaharma.png",
                          "Pharmacies",
                          "Pharmaceuticals Nearby me"),
                    ],
                  ),
                ),
                SizedBox(
                  height: deviceHeigth() * 0.03,
                ),
              ],
            ),
          );
        });
  }

  void sendSafe() {
    int itemCount = contacts.length;
    for (int i = 0; i < itemCount; i++) {
      _sendMessage("${contacts[i].phoneNumber}",
          "I am safe now from Kavach A women safety application");
    }
    Navigator.of(context).pop();
    showPopUpSave();
  }

  void sendAlert() async {
    Loc.LocationData? locationData;
    List<Placemark>? placemark;
    locationData = await Loc.Location.instance.getLocation();
    placemark = await placemarkFromCoordinates(
        locationData!.latitude!, locationData!.longitude!);
    // print(placemark![0]);
    if (await _isPermissionGranted()) {
      if ((await _supportCustomSim)!) {
        int itemCount = contacts.length;
        for (int i = 0; i < itemCount; i++) {
          _sendMessage("${contacts[i].phoneNumber}",
              "Kavach test Location: ${placemark![0].name} ,${placemark![0].street} ${placemark![0].postalCode} ${placemark![0].country} ${placemark![0].locality}' track me here On the address from Kavach A women safety application",
              simSlot: 1);
        }
        Navigator.of(context).pop();
        showPopUpSent();
      } else {
        int itemCount = contacts.length;
        for (int i = 0; i < itemCount; i++) {
          _sendMessage("${contacts[i].phoneNumber}",
              "Kavach test Location: ${placemark![0].name} ,${placemark![0].street} ${placemark![0].postalCode} ${placemark![0].country} ${placemark![0].locality} track me here On the address from Kavach A women safety application");
        }
      }
      Navigator.of(context).pop();
      showPopUpSent();
    } else {
      Navigator.of(context).pop();
      _getPermission();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        color: canvasColor,
        notchMargin: 0,
        shape: const CircularNotchedRectangle(),
        height: deviceHeigth() * 0.05,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: ListView(
        children: [
          // 1st txt
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  SizedBox(
                    width: deviceWidth() * 0.025,
                    height: deviceHeigth() * 0.105,
                  ),
                  Text(
                    'Be',
                    style: TextStyle(
                      color: Colors.purple,
                      fontSize: deviceWidth() * 0.07,
                      fontWeight: FontWeight.bold,
                      shadows: [
                        Shadow(
                          blurRadius: 10.0,
                          color: Colors.white, // shadow color
                          offset:
                              Offset(2.0, 2.0), // how much shadow will be shown
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 7.0),
                  DefaultTextStyle(
                    style: TextStyle(
                      fontSize: deviceWidth() * 0.05,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Horizon',
                      shadows: [
                        Shadow(
                          blurRadius: 10.0,
                          color: Colors.black,
                          offset: Offset(2.0, 2.0),
                        ),
                      ],
                    ),
                    child: AnimatedTextKit(
                      repeatForever: true,
                      animatedTexts: [
                        RotateAnimatedText('You'),
                        RotateAnimatedText('Strong'),
                        RotateAnimatedText('Safer'),
                        RotateAnimatedText('Aware'),
                      ],
                      onTap: () {
                        print("Pop Up hey there");
                      },
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.only(left: 2, right: 2),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                        ),
                      ),
                      backgroundColor: Color(0xFF0D47A0),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ContactListScreen()));
                    },
                    child: Row(
                      children: [
                        Image.asset(
                          "assets/icons/addContact.png",
                          height: deviceHeigth() * 0.05,
                        ),
                        Text(
                          'Add Contacts',
                          style: TextStyle(fontSize: deviceWidth() * 0.03),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
          // Page slider
          CarouselSlider(
            items: [
              getSliderContainer(
                  "Training", "training", Icons.model_training, 0),
              getSliderContainer("Awarezone", "aware", Icons.bolt, 1),
              getSliderContainer(
                  "Safe Complaints", "right", Icons.message_outlined, 2)
            ],
            //Slider Container properties
            options: CarouselOptions(
              height: deviceHeigth() * 0.25,
              enlargeCenterPage: true,
              autoPlay: true,
              aspectRatio: 16 / 9,
              autoPlayCurve: Curves.fastOutSlowIn,
              enableInfiniteScroll: true,
              autoPlayAnimationDuration: Duration(milliseconds: 1000),
              viewportFraction: 0.8,
            ),
          ),
          SizedBox(
            height: deviceHeigth() * 0.012,
          ),
          // Emergency call lable
          Padding(
            padding: EdgeInsets.only(
              top: 0,
              left: 15,
              bottom: 0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Emergency Call",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: deviceWidth() * 0.05,
                      color: Colors.purple),
                ),
                // SizedBox(width: MediaQuery.of(context).size.width * 0.48),
                TextButton(
                  onPressed: () {
                    getListEmergency();
                  },
                  child: Text(
                    "See more",
                    style: TextStyle(
                      fontSize: deviceWidth() * 0.045,
                    ),
                  ),
                ),
              ],
            ),
          ),
          //   Emergency call slider
          Center(
            child: Padding(
              padding: EdgeInsets.only(
                top: 5,
                bottom: 5,
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    getOtherPagesContainer(
                        "Women Helpline",
                        "assets/icons/backgrounds/helpline.jpg",
                        1091,
                        Colors.red,
                        "assets/icons/womenP.png"),
                    getOtherPagesContainer(
                        "Police",
                        "assets/icons/backgrounds/police.jpg",
                        100,
                        Colors.blueAccent,
                        "assets/icons/police.png"),
                    getOtherPagesContainer(
                        "Fire",
                        "assets/icons/backgrounds/firevan.jpg",
                        107,
                        Colors.brown,
                        "assets/icons/fire_van.png"),
                    getOtherPagesContainer(
                        "Ambulance",
                        "assets/icons/backgrounds/hospital.jpg",
                        102,
                        Colors.purple,
                        "assets/icons/ambulance.png"),
                  ],
                ),
              ),
            ),
          ),
          // explore nearby lable
          Padding(
            padding: EdgeInsets.only(
              top: 0,
              left: 15,
              bottom: 0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Explore Nearby",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: deviceWidth() * 0.05,
                      color: Colors.purple),
                ),
                TextButton(
                  onPressed: () {
                    getNearBy();
                  },
                  child: Text(
                    "See more",
                    style: TextStyle(
                      fontSize: deviceWidth() * 0.045,
                    ),
                  ),
                )
              ],
            ),
          ),
          //   explore nearby slider
          Padding(
            padding: EdgeInsets.only(
              top: 5,
              bottom: 5,
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  getExploreNearby("assets/icons/location/locationPolice.png",
                      "Police", "Police Station Nearby Me"),
                  getExploreNearby("assets/icons/location/locationhospital.png",
                      "Hospitals", "Hospitals nearby me"),
                  getExploreNearby("assets/icons/location/locationBus.png",
                      "Bus Station", "Bus station Nearby me"),
                  getExploreNearby("assets/icons/location/locationPaharma.png",
                      "Pharmacies", "Pharmaceuticals Nearby me"),
                ],
              ),
            ),
          ),
          //  Location lable
          Padding(
            padding: EdgeInsets.only(
              top: 0,
              left: 15,
              bottom: 0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Location",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: deviceWidth() * 0.05,
                      color: Colors.purple),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CurrentLocation()));
                  },
                  child: Text(
                    "Get Explore",
                    style: TextStyle(
                      fontSize: deviceWidth() * 0.045,
                    ),
                  ),
                )
              ],
            ),
          ),
          // map on home screen
          // Padding(
          //     padding: EdgeInsets.only(
          //       top: 20,
          //       bottom: 20,
          //       left: 0,
          //       right: 0,
          //     ),
          //   child: Container(
          //     height: deviceHeigth()*0.70,
          //     decoration: BoxDecoration(
          //       color: scaffoldBackgroundColor,
          //       border: Border.all(
          //         // color: Colors.blueAccent,
          //         // width: 0.1,
          //       ),
          //       borderRadius: BorderRadius.circular(10.0),
          //       // gradient: LinearGradient(
          //       //     colors: [Colors.purple, Colors.deepPurpleAccent]),
          //       boxShadow: [
          //         BoxShadow(
          //             color: Colors.black38,
          //             blurRadius: 10.0,
          //             offset: Offset(5.0, 5.0))
          //       ],
          //     ),
          //     child: Padding(
          //       padding: EdgeInsets.all(8),
          //       child: CurrentLocation(),
          //       // child: Center(child: Text("Map")),
          //     ),
          //   ),
          //
          // ),
          SizedBox(
            height: deviceHeigth() * 0.2,
          ),
        ],
      ),
      floatingActionButton: (activeSos == false)
          ? IconButton(
              iconSize: deviceHeigth() * 0.07,
              onPressed: () async {
                showDialog(
                  context: context,
                  builder: (context) {
                    return Center(
                        child: CircularProgressIndicator(
                      backgroundColor: Color(0xF58A1DC7),
                      color: Colors.purpleAccent,
                      semanticsLabel: "Loading",
                      strokeWidth: 3,
                    ));
                  },
                );
                sendAlert();
                setState(() {
                  activeSos = true;
                  sosData.write('sosStatus', activeSos);
                });
              },
              icon: Image.asset(
                "assets/icons/SOS.png",
                height: deviceHeigth() * 0.1,
              ),
            )
          : IconButton(
              iconSize: deviceHeigth() * 0.07,
              onPressed: () async {
                // print("Safe Pressed");
                showDialog(
                  context: context,
                  builder: (context) {
                    return Center(
                        child: CircularProgressIndicator(
                      backgroundColor: Color(0xF58A1DC7),
                      color: Colors.purpleAccent,
                      semanticsLabel: "Loading",
                      strokeWidth: 3,
                    ));
                  },
                );
                Loc.LocationData? locationData;
                List<Placemark>? placemark;
                locationData = await Loc.Location.instance.getLocation();
                placemark = await placemarkFromCoordinates(
                    locationData!.latitude!, locationData!.longitude!);
                // print(placemark![0]);
                if (await _isPermissionGranted()) {
                  if ((await _supportCustomSim)!) {
                    sendSafe();
                  } else {
                    sendSafe();
                  }
                } else {
                  Navigator.of(context).pop();
                  _getPermission();
                }
                setState(() {
                  activeSos = false;
                  sosData.write('sosStatus', activeSos);
                });
              },
              icon: Image.asset(
                "assets/icons/safeSOS.png",
                height: deviceHeigth() * 0.1,
              ),
            ),
    );
  }
}
