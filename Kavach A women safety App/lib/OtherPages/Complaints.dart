import 'package:flutter/material.dart';
import 'package:proui/ColorApp.dart';
import 'package:webview_flutter/webview_flutter.dart';


class Complaints extends StatefulWidget {
  const Complaints({super.key});

  @override
  State<Complaints> createState() => _ComplaintsState();
}

class _ComplaintsState extends State<Complaints> {
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..loadRequest(
        Uri.parse('https://ncwapps.nic.in/onlinecomplaintsv2/'),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: scaffoldBackgroundColor,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text("Complaints",
        style: TextStyle(
          color: canvasColor
        ),
        ),
      ),
      body: WebViewWidget(
        controller: controller,
      ),
    );
  }
}
