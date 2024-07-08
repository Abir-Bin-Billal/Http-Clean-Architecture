import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http_clean_architecture/utils/print_value.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  apiCall()async{
    var response = await http.get(Uri.parse("https://reqres.in/api/users?page=2"));
    printValue(tag: "API RESPONSE :" , response.body);
  }
  @override
  void initState() {
    apiCall();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

    );
  }
}
