import 'package:flutter/material.dart';
import 'package:hackdefine/constants.dart';

class ProposalDetails extends StatefulWidget {
  const ProposalDetails({Key? key}) : super(key: key);

  @override
  State<ProposalDetails> createState() => _ProposalDetailsState();
}

class _ProposalDetailsState extends State<ProposalDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Details"),
        backgroundColor: Colors.black,
      ),
      body: Container(
          padding: EdgeInsets.all(defaultPadding),
          child: Column(
            children: [],
          )),
    );
  }
}
