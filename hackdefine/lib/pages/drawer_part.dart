import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hackdefine/constants.dart';
import 'package:hackdefine/pages/all_proposals.dart';
import 'package:hackdefine/pages/create_proposals.dart';
import 'package:web3_connect/web3_connect.dart';
import 'package:web3dart/web3dart.dart';

class SideMenu extends StatelessWidget {
  SideMenu({Key? key, required this.w3c, required this.client})
      : super(key: key);
  Web3Client client;
  Web3Connect w3c;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Container(
              color: primaryColor,
              padding: EdgeInsets.all(defaultPadding),
              child: Image.asset('assets/celo.png'),
            ),
          ),
          DrawerListTile(
            title: "Create Proposals",
            press: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          CreateProposal(w3c: w3c, client: client)));
            },
          ),
          DrawerListTile(
            title: "All Proposals",
            press: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => AllProposal(
                            w3c: w3c,
                            client: client,
                          )));
            },
          ),
          DrawerListTile(
            title: "Profile",
            press: () {},
          ),
        ],
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    Key? key,
    required this.title,
    required this.press,
  }) : super(key: key);

  final String title;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      horizontalTitleGap: 0.0,
      title: Text(
        title,
        style: const TextStyle(color: Colors.amber),
      ),
    );
  }
}
