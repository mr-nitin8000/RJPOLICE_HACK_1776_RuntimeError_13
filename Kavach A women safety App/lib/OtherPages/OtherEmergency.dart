import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:proui/ColorApp.dart';

class OtherEmergency extends StatefulWidget {
  const OtherEmergency({super.key});
  @override
  State<OtherEmergency> createState() => _OtherEmergencyState();
}

class _OtherEmergencyState extends State<OtherEmergency> {
  late final WebViewController controller;
  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..loadRequest(
        Uri.parse('http://www.ncw.nic.in/helplines'),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: scaffoldBackgroundColor,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          "Emergency Call ",
          style: TextStyle(color: canvasColor),
        ),
      ),
      body: WebViewWidget(
        controller: controller,
      ),
    );
  }
}
