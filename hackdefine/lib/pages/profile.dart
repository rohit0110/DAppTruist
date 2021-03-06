import 'package:flutter/material.dart';
import 'package:hackdefine/constants.dart';
import 'package:web3_connect/web3_connect.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key? key, required this.w3c}) : super(key: key);
  Web3Connect w3c;
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        backgroundColor: Colors.black,
      ),
      body: Container(
        padding: EdgeInsets.all(defaultPadding),
        child: Column(children: [
          Image.asset("assets/1catto-modified.png"),
          SizedBox(
            height: defaultPadding * 4,
          ),
          Container(
            padding: EdgeInsets.all(defaultPadding),
            margin: EdgeInsets.all(defaultPadding),
            color: Colors.amber,
            child: Text("Contributor's Address: ${widget.w3c.account}",
                style: const TextStyle(fontSize: 20, color: Colors.black)),
          )
        ]),
      ),
    );
  }
}
