import 'package:flutter/material.dart';
import 'package:hackdefine/constants.dart';
import 'package:hackdefine/pages/create_proposals.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({Key? key}) : super(key: key);

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
                      builder: (context) => const CreateProposal()));
            },
          ),
          DrawerListTile(
            title: "View Proposals",
            press: () {},
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
