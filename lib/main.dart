import 'package:flutter/material.dart';
import 'package:storage_w_supabase/upload_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  await Supabase.initialize(
    url: "https://iastjvbuizresoyagbmn.supabase.co",
    anonKey:
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imlhc3RqdmJ1aXpyZXNveWFnYm1uIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDE2MDA4OTcsImV4cCI6MjA1NzE3Njg5N30.xjex0jThRiWNwsw4aVR7ckI_1gdFf9J_0MQigx7WVh8",
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: UploadPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
