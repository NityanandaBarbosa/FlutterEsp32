import 'package:edge_alerts/edge_alerts.dart';
import 'package:flutter/material.dart';

// ignore: missing_return
Widget successAlert(ctx){
  edgeAlert(
    ctx,
    title: "Success",
    description: "Connected to ESP32",
    duration: 2,
    icon: Icons.check,
    gravity: Gravity.top,
    backgroundColor: Colors.green
    );
}

// ignore: missing_return
Widget failAlert(ctx){
  edgeAlert(
    ctx, 
    title: "Error", 
    description: "Connect to the ESP32 access point!",
    duration: 2, 
    icon: Icons.error, 
    gravity: Gravity.top, 
    backgroundColor: Colors.red
    );
}