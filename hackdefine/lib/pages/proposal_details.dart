import 'package:flutter/material.dart';
import 'package:hackdefine/constants.dart';

class ProposalDetails extends StatefulWidget {
  ProposalDetails({Key? key, required this.proposal}) : super(key: key);
  dynamic proposal;
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
            children: [
              Text(
                "${widget.proposal.description}",
                style:
                    const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: defaultPadding * 3,
              ),
              Text(
                "Amount requested: ${widget.proposal.amount} cUSD",
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: defaultPadding * 2,
              ),
              Text("Proposal raised by: ${widget.proposal.fromAddress}"),
              SizedBox(
                height: defaultPadding,
              ),
              Text("For Charity: ${widget.proposal.toCharity}"),
              SizedBox(
                height: defaultPadding * 20,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                Text("For Votes: ${widget.proposal.forVotes}",
                    style: const TextStyle(
                        color: Colors.green,
                        fontSize: 18,
                        fontWeight: FontWeight.bold)),
                Text("Against Votes: ${widget.proposal.againstVotes}",
                    style: const TextStyle(
                        color: Colors.red,
                        fontSize: 18,
                        fontWeight: FontWeight.bold))
              ]),
            ],
          )),
    );
  }
}
