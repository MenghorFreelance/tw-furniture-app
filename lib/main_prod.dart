import 'package:flutter/material.dart';
import 'package:flutter_tem/utils/api/dio_client.dart';
import 'my_app.dart';

void main() {
  DioClient.setup();
  runApp(const MyApp());
}
