import 'package:flutter/material.dart';
import 'package:hackdefine/constants.dart';
import 'package:hackdefine/pages/home_page.dart';
import 'package:web3_connect/web3_connect.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({Key? key}) : super(key: key);

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  Web3Connect w3c = Web3Connect();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Log In to DApp-truist"),
        backgroundColor: Colors.black,
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [primaryColor, secondaryColor],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight)),
        child: Center(
            child: Container(
                padding: EdgeInsets.all(defaultPadding),
                color: Colors.black,
                width: 400,
                height: 500,
                child: Column(children: [
                  const Text(
                    "Log In Using Your Wallet",
                    style: TextStyle(fontSize: 30),
                  ),
                  const SizedBox(
                    height: 300, //add celo png?
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      await w3c.connect();
                      if (w3c.account != "") {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => HomePage(
                                      w3c: w3c,
                                    ))));
                      }
                    },
                    child: const Text(
                      "Log In!",
                      style: TextStyle(color: Colors.black),
                    ),
                    style: ButtonStyle(
                        minimumSize:
                            MaterialStateProperty.all(const Size(200, 50)),
                        backgroundColor:
                            MaterialStateProperty.all(secondaryColor)),
                  )
                ]))),
      ),
    );
  }
}
