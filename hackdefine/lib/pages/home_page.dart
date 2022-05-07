import 'package:flutter/material.dart';
import 'package:hackdefine/constants.dart';
import 'package:hackdefine/pages/drawer_part.dart';
import 'package:web3_connect/web3_connect.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key, required this.w3c}) : super(key: key);
  Web3Connect w3c;
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("DApp-truist"),
        backgroundColor: Colors.black,
      ),
      drawer: const SideMenu(),
      body: Container(
        padding: EdgeInsets.all(defaultPadding),
        child: Column(
          children: [const Text("Welcome to DApp-truist")],
        ),
      ),
    );
  }
}
